package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import Math;
	
	
	public class Player extends Entity
	{
		/* A lot of help came from here: http://www.emanueleferonato.com/2011/05/30/creation-of-a-platform-game-using-flashpunk-step-2/
		*/
		private var paused:int = 0;
		private const maxYVel:Number = 10;
		private const jumpSpeed:Number = 12;
		private const gravity:Number = .5;
		private const xPos:Number = 20;
		private var ySpeed:Number = 0;
		private var doubleJumped:Boolean;
		private var onPlatform:Boolean;
		[Embed(source = 'assets/sample-sprite.png')] private const PLAYER:Class;
		public function Player() 
		{
			this.graphic = new Image(PLAYER);
			this.x = xPos;
			setHitbox(42, 21);
		}
		
		override public function update():void
		{
			if (Input.check(Key.P) && paused==0)
			{
				FP.world.active = false;
				paused = 1;
				if (Input.check(Key.S))
				{
					FP.world.active = true;
				}


			}
			
			
			if (Input.pressed(Key.UP) && onPlatform) {
				// you can always jump if you're on a platform
				ySpeed = -jumpSpeed;
				onPlatform = false; // you're probably not on the platform anymore if you've jumped
			} else if (Input.pressed(Key.UP) && !doubleJumped) {
				ySpeed = -jumpSpeed;
				doubleJumped = true; // you only get one double jump
			} else {
				ySpeed += gravity;
			}
			
			//clip velocities
			ySpeed = Math.min(ySpeed, maxYVel);
			ySpeed = Math.max(ySpeed, -maxYVel);
			
			moveBy(0, ySpeed, "platform");
		}
		
		override public function moveCollideX(e:Entity):Boolean {
			this.x -= 4;
			return true; 
		}
		
		override public function moveCollideY(e:Entity):Boolean {
			doubleJumped = false;
			onPlatform = true;
			this.ySpeed = 0;
			return true;
		}
	}

}

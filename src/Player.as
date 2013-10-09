package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import Math;
	
	
	public class Player extends Entity
	{
		/* A lot of help came from here: http://www.emanueleferonato.com/2011/05/30/creation-of-a-platform-game-using-flashpunk-step-2/
		*/
		private const xAccel:Number = 1;
		private const maxXVel:Number = 4;
		private const maxYVel:Number = 10;
		private const jumpSpeed:Number = 12;
		private const xDrag:Number = .5;
		private const gravity:Number = .5;
		private var xSpeed:Number = 0;
		private var ySpeed:Number = 0;
		private var doubleJumped:Boolean;
		private var onPlatform:Boolean;
		[Embed(source = 'assets/sample-sprite.png')] private const PLAYER:Class;
		public function Player() 
		{
			this.graphic = new Image(PLAYER);
			
			setHitbox(50, 50);
		}
		
		override public function update():void
		{
			
			if (Input.check(Key.LEFT)) {
				xSpeed -= xAccel;
			} else if (Input.check(Key.RIGHT)) {
				xSpeed += xAccel;
			} else {
				//Slow down your speed if you're not actively moving
				xSpeed = xSpeed * xDrag;
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
			xSpeed = Math.min(xSpeed, maxXVel);
			xSpeed = Math.max(xSpeed, -maxXVel);
			
			moveBy(xSpeed, ySpeed, "platform");
		}
		
		override public function moveCollideX(e:Entity):Boolean {
			this.xSpeed = 0;
			return true;
		}
		
		override public function moveCollideY(e:Entity):Boolean {
			doubleJumped = false;
			this.ySpeed = 0;
			return true;
		}
	}

}

package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Sfx;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import Math;
	
	
	public class Player extends Entity
	{
		/* A lot of help came from here: http://www.emanueleferonato.com/2011/05/30/creation-of-a-platform-game-using-flashpunk-step-2/
		*/
		private var runWorld:RunnerWorld;
		private const maxYVel:Number = 10;
		private const jumpSpeed:Number = 12;
		private const gravity:Number = .5;
		private const xPos:Number = 20;
		private const dashingCooldown:Number = 2; //in seconds
		private const lengthOfDashing:Number = 1; //in seconds
		private const dashSpeed:Number = 12;
		private var ySpeed:Number = 0;
		private var doubleJumped:Boolean;
		private var onPlatform:Boolean;
		private var currentlyDashing:Boolean = false;
		private var lastDashingTime:Number = 0;
		private var time:Number = 0;
		private var happiness:Number = 0;
		private var sadness:Number = 0;
		private var anger:Number = 0;
		public var currentEmotion:String = "happy";
		private var story:Story;
		
		[Embed(source = 'assets/Player_v0_hs.png')] private const HAPPY_SAD_SPRITE:Class;
		[Embed(source = 'assets/Player_v0_ha.png')] private const HAPPY_ANGRY_SPRITE:Class;
		[Embed(source = 'assets/Player_v0_sh.png')] private const SAD_HAPPY_SPRITE:Class;
		[Embed(source = 'assets/Player_v0_sa.png')] private const SAD_ANGRY_SPRITE:Class;
		[Embed(source = 'assets/Player_v0_ah.png')] private const ANGRY_HAPPY_SPRITE:Class;
		[Embed(source = 'assets/Player_v0_as.png')] private const ANGRY_SAD_SPRITE:Class;
		[Embed(source = 'assets/Player_v0_hs.png')] private const PLAYER:Class;
		[Embed(source = 'assets/HappySound.mp3')] private const HAPPY_SOUND:Class;
		[Embed(source = 'assets/AngrySound.mp3')] private const ANGRY_SOUND:Class;
		[Embed(source = 'assets/SadSound.mp3')] private const SAD_SOUND:Class;
		
		private var sfxHappy:Sfx = new Sfx(HAPPY_SOUND);
		private var sfxAngry:Sfx = new Sfx(ANGRY_SOUND);
		private var sfxSad:Sfx = new Sfx(SAD_SOUND);
		
		public function Player(runWorld:RunnerWorld) 
		{
			this.graphic = new Image(PLAYER);
			this.x = xPos;
			setHitbox(26, 50);
			this.story = new Story();
			trace(this.story);
			FP.world.add(this.story);
			this.runWorld = runWorld;
		}
		
		override public function update():void
		{			
			time += FP.elapsed;
			if (Input.pressed(Key.UP) && onPlatform) {
				// you can always jump if you're on a platform
				ySpeed = -jumpSpeed;
				onPlatform = false; // you're probably not on the platform anymore if you've jumped
				
				// Prevent the player from doublejumping if they're not happy
				if (currentEmotion != "happy") {
					doubleJumped = true;
					ySpeed += gravity;
				}
			} else if (Input.pressed(Key.UP) && !doubleJumped) {
				ySpeed = -jumpSpeed;
				doubleJumped = true; // you only get one double jump
			} else {
				ySpeed += gravity;
			}
			
			// dashing code
			if (Input.pressed(Key.RIGHT) && !currentlyDashing && currentEmotion == "angry") {
				// at the beginning it's not possible to dash for a small time
				if (time > (lastDashingTime  + dashingCooldown + lengthOfDashing)) { 
					currentlyDashing = true;
					lastDashingTime = time;
					runWorld.changeSpeed(dashSpeed);
				}
			}
			if (time > lastDashingTime + lengthOfDashing) {
				currentlyDashing = false;
				runWorld.resetSpeed();
			}
			
			
			//clip velocities
			ySpeed = Math.min(ySpeed, maxYVel);
			ySpeed = Math.max(ySpeed, -maxYVel);
			
			// Check for collision with a collectible and set new emotion
			var c:Collectible = collide("collectible", x, y) as Collectible;
			
			if (c) {
				var emotion:String = c.getEmotion();
				if (emotion == "happy") {
					sfxHappy.play();
					happiness++;
					if (happiness >= sadness && happiness >= anger) {
						if (currentEmotion == "sad") {
							this.y += 20;
						}
						setHitbox(50, 50);
						currentEmotion = "happy";
						//var story:Story = world.getInstance("story");
						this.story.showText("happy");
						if (sadness >= anger){
							this.graphic = new Image(HAPPY_SAD_SPRITE);
						} else {
							this.graphic = new Image(HAPPY_ANGRY_SPRITE);
						}
					} else if (happiness >= sadness) {
						// Anger is greater than happiness
						// emotion will already be anger
						this.graphic = new Image(ANGRY_HAPPY_SPRITE);
					} else if (happiness >= anger) {
						// Sad > happy
						// emotion is already sad
						this.graphic = new Image(SAD_HAPPY_SPRITE);
					}
				} else if (emotion == "angry") {
					sfxAngry.volume = 0.65;
					sfxAngry.play();
					anger++;
					if (anger >= happiness && anger >= sadness) {
						if (currentEmotion == "sad") {
							this.y += 20;
						}
						setHitbox(50, 50);
						currentEmotion = "angry";
						this.story.showText("angry");
						if (happiness >= sadness){
							this.graphic = new Image(ANGRY_HAPPY_SPRITE);
						} else {
							this.graphic = new Image(ANGRY_SAD_SPRITE);
						}
					} else if (anger >= happiness) {
						// Sadness is greater than anger
						// emotion will already be sadness
						this.graphic = new Image(SAD_ANGRY_SPRITE);
					} else if (anger >= sadness) {
						// happy > angry
						// emotion is already happy
						this.graphic = new Image(HAPPY_ANGRY_SPRITE);
					}
				} else if (emotion == "sad") {
					sfxSad.play();
					sadness++;
					if (sadness >= happiness && sadness >= anger) {
						currentEmotion = "sad";
						this.story.showText("sad");
						setHitbox(16, 30);
						if (happiness >= anger){
							this.graphic = new Image(SAD_HAPPY_SPRITE);
						} else {
							this.graphic = new Image(SAD_ANGRY_SPRITE);
						}
					} else if (sadness >= happiness) {
						// Anger is greater than sadness
						// emotion will already be anger
						this.graphic = new Image(ANGRY_SAD_SPRITE);
					} else if (sadness >= anger) {
						// happy > sad
						// emotion is already happiness
						this.graphic = new Image(HAPPY_SAD_SPRITE);
					}
				}
				
				runWorld.meter.updateMeter(happiness, sadness, anger);
				c.destroy();
			}
			
			moveBy(0, ySpeed, "platform");
			
		}
		
		override public function moveCollideX(e:Entity):Boolean {
			if (e is BreakableObstacle) {
				// check if the player is dashing
				if (currentlyDashing) {
					// if yes, destroy the obstacle!
					(e as BreakableObstacle).destroy();
					return true;
				}
			}
			// otherwise, treat as a general platform
			this.x -= 4;
			return true; 
		}
		
		override public function moveCollideY(e:Entity):Boolean {
			if (e is BreakableObstacle) {
				// check if the player is dashing
				if (currentlyDashing) {
					// if yes, destroy the obstacle!
					(e as BreakableObstacle).destroy();
					return true;
				}
			}
			// otherwise, treat as a general platform
			trace(this.y);
			trace(e.y);
			if ((Math.abs(this.y + 50 - e.y) < 1.) || (Math.abs(this.y + 30 - e.y) < 1.)){
				doubleJumped = false;
				onPlatform = true;
				this.ySpeed = 0;
			} else if (this.x <= e.x) {
				runWorld.resetSpeed();
				this.x -= runWorld.defaultSpeed;
			} else {
				this.y -= 50;
				ySpeed += gravity;
			}
			return true;
		}
	}

}

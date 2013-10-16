package  
{
	import flash.utils.Dictionary;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Collectible extends Entity
	{
		private var emotion:String;
		public var speed:Number = 2;
		public var level:Number;
		public var embeddedObjects:Dictionary; //first key: levelNumber, second key:sad/happy/angry string, value: Class variable
		[Embed(source = 'assets/HappyFlower.png')] private const HAPPY1_SPRITE:Class;
		[Embed(source = 'assets/SadCloud.png')] private const SAD1_SPRITE:Class;
		[Embed(source = 'assets/AngryBolt.png')] private const ANGRY1_SPRITE:Class;
		
		public function Collectible(xVal:Number, yVal:Number, level:Number, speed:Number) 
		{
			embeddedObjects = new Dictionary();
			//level 1
			var level1dict:Dictionary = new Dictionary();
			level1dict["happy"] = HAPPY1_SPRITE;
			level1dict["sad"] = SAD1_SPRITE;
			level1dict["angry"] = ANGRY1_SPRITE;
			//level 1
			var level2dict:Dictionary = new Dictionary();
			level2dict["happy"] = HAPPY1_SPRITE;
			level2dict["sad"] = SAD1_SPRITE;
			level2dict["angry"] = ANGRY1_SPRITE;
			//level 1
			var level3dict:Dictionary = new Dictionary();
			level3dict["happy"] = HAPPY1_SPRITE;
			level3dict["sad"] = SAD1_SPRITE;
			level3dict["angry"] = ANGRY1_SPRITE;
			//put all the levels together now
			embeddedObjects[1] = level1dict;
			embeddedObjects[2] = level2dict;
			embeddedObjects[3] = level3dict;
			
			this.x = xVal;
			this.y = yVal;
			this.type = "collectible";
			this.setHitbox(25, 25);
			this.level = level;
			this.setEmotion();
			this.speed = speed;
		}
		
		public function getEmotion():String {
			return this.emotion;
		}
		
		private function setEmotion():void {
			// Randomly choose one of the three emotions
			var emotionVal:Number = Math.ceil(Math.random() * 3);
			
			switch(emotionVal) {
				case 1:
					this.emotion = "happy";
					break;
				case 2:
					this.emotion = "sad";
					break;
				case 3:
					this.emotion = "angry";
					break;
			}
			// set the sprite now
			var sprite:Class = embeddedObjects[this.level][this.emotion];
			this.graphic = new Image(sprite);
		}
		
		public function destroy():void {
			FP.world.remove(this);
		}
		
		override public function update():void
		{
			moveBy( -speed, 0);
		}
	}
}
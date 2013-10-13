package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	public class Collectible extends Entity
	{
		private var emotion:String;
		[Embed(source = 'assets/sample-sprite.png')] private const HAPPY_SPRITE:Class;
		[Embed(source = 'assets/sample-sprite.png')] private const SAD_SPRITE:Class;
		[Embed(source = 'assets/sample-sprite.png')] private const ANGRY_SPRITE:Class;
		
		public function Collectible(xVal:Number, yVal:Number) 
		{
			this.x = xVal;
			this.y = yVal;
			this.type = "collectible";
			this.setHitbox(10, 10);
			this.setEmotion();
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
					this.graphic = new Image(HAPPY_SPRITE);
					break;
				case 2:
					this.emotion = "sad";
					this.graphic = new Image(SAD_SPRITE);
					break;
				case 3:
					this.emotion = "angry";
					this.graphic = new Image(ANGRY_SPRITE);
					break;
			}
		}
		
		public function destroy():void {
			FP.world.remove(this);
		}
	}
}
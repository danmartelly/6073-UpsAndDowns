package  
{
	import net.flashpunk.Entity;
	import flash.display.BitmapData;
	import net.flashpunk.graphics.Image;
	
	public class Platform extends Entity
	{
		private const platformHeight:Number = 20;
		public var speed:Number = 2;
		public function Platform() 
		{
			var platformWidth:int = 400;
			var platformHeight:int = 20;
			var rectBitmap:BitmapData = new BitmapData(platformWidth, platformHeight, false, 0x99999999)
			this.graphic = new Image(rectBitmap);
			
			this.x = 500;
			this.y = 400;
			setHitbox(400, 20);
			
			this.type = "platform";
		}
		
		public function init(width:Number, xPos:Number, yPos:Number, speed:Number):void
		{
			
			var rectBitmap:BitmapData = new BitmapData(width, platformHeight, false, 0x99999999)
			this.graphic = new Image(rectBitmap);
			this.setHitbox(width, platformHeight);
			this.y = yPos;
			this.x = xPos;
			this.speed = speed;
		}
		
		override public function update():void
		{
			moveBy( -speed, 0);
		}
	}

}
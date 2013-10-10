package  
{
	import net.flashpunk.Entity;
	import flash.display.BitmapData;
	import net.flashpunk.graphics.Image;
	
	public class Platform extends Entity
	{
		
		public function Platform() 
		{
			var platformWidth:int = 400;
			var platformHeight:int = 20;
			var rectBitmap:BitmapData = new BitmapData(platformWidth, platformHeight, false, 0x99999999)
			this.graphic = new Image(rectBitmap);
			
			this.x = 0;
			this.y = 400;
			setHitbox(400, 20);
			
			this.type = "platform";
		}
		
		
	}

}
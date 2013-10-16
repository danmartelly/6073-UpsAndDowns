package  
{
	import net.flashpunk.Entity;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import net.flashpunk.graphics.Image;
	
	public class Meter extends Entity
	{
		private var meterWidth:Number = 200;
		private var meterHeight:Number = 10;
		
		public var rectBitmap:BitmapData;
		
		public function Meter() 
		{
			rectBitmap = new BitmapData(meterWidth, meterHeight, false, 0x99999999);
			this.graphic = new Image(rectBitmap);
			
			this.x = 15;
			this.y = 15;
			
			this.type = "meter";
		}
		
		public function updateMeter(happiness:Number, sadness:Number, anger:Number):void
		{
			var sum:Number = happiness + sadness + anger;
			var h1:Number = happiness / sum, h2:Number = sadness / sum, h3:Number = anger / sum;
			
			rectBitmap.fillRect(new Rectangle(0, 0, meterWidth * h1, meterHeight), 0x00FFFF00);
			rectBitmap.fillRect(new Rectangle(meterWidth * h1, 0, meterWidth * h2, meterHeight), 0x003333FF);
			rectBitmap.fillRect(new Rectangle(meterWidth * (h1 + h2), 0, meterWidth * h3, meterHeight), 0x00FF3333);
		
			this.graphic = new Image(rectBitmap);
		}
	}

}
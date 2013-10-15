package  
{
	import flash.events.TextEvent;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	public class Story extends Entity
	{
		private var t:Text;
		private var e:Entity;
		
		public function Story() {
			name = "story";
			this.t = new Text("");
			this.e = new Entity(FP.halfWidth - (t.width / 2), FP.halfHeight + 250 - (t.height / 2), t);
		}

		public function showText(emotion:String):void {
			FP.world.remove(e);
			if (emotion == "sad") {
				t = new Text("I felt very small.");
			} else if (emotion == "happy") {
				t = new Text("I felt like jumping for joy!");
			} else {
				t = new Text("I wanted to break something.");
			}
			t.color = 0xFFFFFF;
			t.align = "center";
			e = new Entity(FP.halfWidth - (t.width / 2), FP.halfHeight + 250 - (t.height / 2), t);
			FP.world.add(e);
		}
	}
}
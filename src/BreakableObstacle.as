package  
{
	import net.flashpunk.FP;
	
	public class BreakableObstacle extends Platform
	{
		
		public function BreakableObstacle() 
		{
			super();
			this.color = 0x99449999; // it's a bluish color
		}
		
		public function destroy():void {
			// could do animation and sounds here
			FP.world.remove(this);
		}
	}

}
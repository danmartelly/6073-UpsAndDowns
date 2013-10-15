package  
{
	import net.flashpunk.FP;
	
	public class BreakableObstacle extends Platform
	{
		
		public function BreakableObstacle() 
		{
			super();
		}
		
		public function destroy():void {
			// could do animation and sounds here
			FP.world.remove(this);
		}
	}

}
package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	public class Collectible extends Entity
	{
		
		public function Collectible() 
		{
			setHitbox(10, 10);
			type = "collectible";
		}
		
		public function destroy():void {
			FP.world.remove(this);
		}
	}

}
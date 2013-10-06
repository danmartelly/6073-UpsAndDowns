package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	
	public class Powerup extends Entity
	{
		
		public function Powerup() 
		{
			setHitbox(10, 10);
			type = "powerup";
		}
		
		public function destroy():void {
			FP.world.remove(this);
		}
	}

}
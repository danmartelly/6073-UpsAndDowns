package
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	
	public class Overlay extends Entity
	{
		
		[Embed(source = 'assets/PauseTransparency.png')] private const TRANSPARENCY:Class;
		public function Overlay()
		{
			this.graphic = new Image(TRANSPARENCY);
		}
		
		public function Pause():void {
				trace("p pressed");
				if (FP.world.active) FP.world.add(this);
				else FP.world.remove(this);
				FP.world.active = !FP.world.active;
			}
		}
	}

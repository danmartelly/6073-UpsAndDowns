package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;	
	
	public class Main extends Engine
	{
		
		public function Main()
		{
			super(800, 600, 60, false);
		}
		
		override public function init():void {
			trace("FlashPunk has started successfully!");
			FP.world = new RunnerWorld();

		}
		
		override public function update():void {
			if (Input.pressed(Key.P))
			{
				FP.world.active = !FP.world.active;
			}
			super.update();
		}
	}
	
}
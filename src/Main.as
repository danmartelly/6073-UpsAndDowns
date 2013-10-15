package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.graphics.Text;
		
	public class Main extends Engine
	{
		private var overlay:Overlay;
		
		public function Main()
		{
			overlay = new Overlay();
			super(800, 600, 60, false);
		}
		
		override public function init():void {
			trace("FlashPunk has started successfully!");
			FP.world = new RunnerWorld;
		}
		
		//pause functionality
		override public function update():void {
			if (Input.pressed(Key.P)) {
				overlay.Pause();
			}
			super.update();
		}
	}
	
}

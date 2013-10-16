package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;	
	import net.flashpunk.FP;
	
	public class GameOver extends World 
	{
		private var levelNum:Number;
		public function GameOver(levelNum:Number) 
		{
			var t:Text = new Text("GAME OVER. Press R to restart.  Press M to move back to main menu");
			t.color = 0xFFFFFF;
			t.align = "center";
			var e:Entity = new Entity(FP.halfWidth - (t.width / 2), FP.halfHeight - (t.height / 2), t);
			add(e);
			this.levelNum = levelNum;
		}
 
		override public function update():void
		{
			super.update();
			if (Input.pressed(Key.R)) FP.world = new RunnerWorld(levelNum);
			if (Input.pressed(Key.M)) FP.world = new Title;

		}
 
	}
}
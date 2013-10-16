package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;	
	import net.flashpunk.FP;
	
	public class CompleteWorld extends World 
	{
 
		public function CompleteWorld() 
		{
			var t:Text = new Text("Congratulations!  You survived. ");
			var s:Text = new Text("INSERT STORY TEXT HERE");
			var u:Text = new Text("Press s to continue");
			t.color = 0xFFFFFF;
			t.align = "center";
			s.color = 0xFFFFFF;
			s.align = "center";
			u.color = 0xFFFFFF;
			u.align = "center";
			var e:Entity = new Entity(250, 150, t);
			var f:Entity = new Entity(290, 250, s);
			var g:Entity = new Entity(300, 350, u);

			add(e);
			add(f);
			add(g);
		}
 
		override public function update():void
		{
			super.update();
			if (Input.pressed(Key.S)) FP.world = new RunnerWorld;

		}
 
	}
}
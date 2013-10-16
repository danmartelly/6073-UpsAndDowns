package  
{
	import flash.events.TextEvent;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;	
	import net.flashpunk.FP;
	
	public class Credits extends World 
	{
 
		public function Credits() 
		{
			var t:Text = new Text("Thanks for playing our game!");  
			var s:Text = new Text("Created by: Daniel Martelly, Elizabeth Attaway, Tom Roberts, ");
			var u:Text = new Text("Skyler Seto, Nathan Pinsker, Tristan Daniels");  
			var v:Text = new Text("Sund Effects produced by:  freesounds.org");
			var x:Text = new Text("Images made by: ");
			var z:Text = new Text("Storyline produced by: ");
			t.color = 0xFFFFFF;
			t.align = "center";
			s.color = 0xFFFFFF;
			s.align = "center";
			u.color = 0xFFFFFF;
			u.align = "center";
			v.color = 0xFFFFFF;
			v.align = "center";
			x.color = 0xFFFFFF;
			x.align = "center";
			z.color = 0xFFFFFF;
			z.align = "center";
			var e:Entity = new Entity(20, 100, t);
			add(e);
			var f:Entity = new Entity(20, 150, s);
			add(f);
			var g:Entity = new Entity(20, 200, u);
			add(g);
			var h:Entity = new Entity(20, 250, v);
			add(h);
			var i:Entity = new Entity(20, 300, x);
			add(i);
			var k:Entity = new Entity(20, 400, z);
			add(k);
		}
 
		override public function update():void
		{
			super.update();
			//if (Input.pressed(Key.S)) FP.world = new RunnerWorld;

		}
 
	}
}
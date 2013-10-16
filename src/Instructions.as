package  
{
	import flash.events.TextEvent;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;	
	import net.flashpunk.FP;
	
	public class Instructions extends World 
	{
 
		public function Instructions() 
		{
			var t:Text = new Text("Welcome to Ups and Downs, the game of life.");  
			var s:Text = new Text("In this game you'll play the character of an old grandpa recounting his adventures.");  
			var u:Text = new Text("In order to play this game, you will use the ‘up’ and ‘right’ key on the keyboard.");
			var v:Text = new Text("In this game, there will be platforms coming at you. ");
			var x:Text = new Text("Your goal is to survive through each of these levels using the powerups, but be careful.  ");
			 var y:Text = new Text("The powerups you collect will affect your life.  ");
			 var z:Text = new Text("Press S to continue and P to pause at any point in game and check remaining time.");
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
			y.color = 0xFFFFFF;
			y.align = "center";
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
			var j:Entity = new Entity(20, 350, y);
			add(j);
			var k:Entity = new Entity(20, 400, z);
			add(k);
		}
 
		override public function update():void
		{
			super.update();
			if (Input.pressed(Key.S)) FP.world = new RunnerWorld(1);

		}
 
	}
}
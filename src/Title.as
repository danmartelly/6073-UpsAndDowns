package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;	
	import net.flashpunk.FP;
	
	public class Title extends World 
	{
 
		public function Title() 
		{
			var titleText:Text = new Text("Press S to Start");
			var textEntity:Entity = new Entity(0,0,titleText);
			textEntity.x = (FP.width/2)-(titleText.width/2);
			textEntity.y = (200);
			add(textEntity);
			var titleText1:Text = new Text("Press C to see Credits");
			var textEntity1:Entity = new Entity(0,0,titleText1);
			textEntity1.x = (FP.width/2)-(titleText.width/2);
			textEntity1.y = (300);
			add(textEntity1);
			var splashText:Text = new Text("Ups and Downs",0,0,640,480);
			splashText.color = 0x00ff00;
			splashText.size = 32;
			var splashEntity:Entity = new Entity(0,0,splashText);
			splashEntity.x = 280;
			splashEntity.y = 100;
			add(splashEntity);
		}
 
		override public function update():void
		{
			super.update();
			if (Input.pressed(Key.S)) FP.world = new Instructions;
			if (Input.pressed(Key.C)) FP.world = new Credits;

		}
 
	}
}
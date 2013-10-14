package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;	
	import net.flashpunk.FP;

	public class RunnerWorld extends World
	{
		private var player:Player;
		private var time:Number = 0;
		private const SECONDS:Number = 60;
		
		public function RunnerWorld() 
		{
			player = new Player();
			add(player);
			
			
			var plat:Platform = new Platform();
			plat.init(300, 400);
			var plat2:Platform = new Platform();
			plat2.init(800, 500);
			add(plat);
			add(plat2);
		}
		
		override public function update():void {
			time += 1;
			
			// Create a new collectible every 2 seconds
			if (time % (SECONDS * 2) == 0) { 
				var randomX:Number = Math.ceil(Math.random() * 100);
				var xVal:Number = player.x + randomX;
				var yVal:Number = player.y;
				
				add(new Collectible(xVal, yVal));
			}
			
			// Update all objects in RunnerWorld
			var entityList:Array = [];
			getAll(entityList);
			
			for each (var e:Entity in entityList) {
				e.update();
			}
			
			if (player.y > 900) {
				FP.world = new GameOver;
			}
		}
	}

}
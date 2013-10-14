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
			plat.init(300, 0, 300);
			var plat2:Platform = new Platform();
			plat2.init(800, 0, 400);
			add(plat);
			add(plat2);
		}
		
		override public function update():void {
			time += 1;
			
			// higher platforms--rarer since less easy to get to
			if (time % (SECONDS * 3) == 1) {
				var randomY:Number = Math.ceil(Math.random() * 400-50);
				var newPlat:Platform = new Platform();
				newPlat.init(Math.random() * 500 + 100, 500, randomY);
				if (Math.random() > .5) {
					var xVal1:Number = 500 + Math.random() * 200;
					var yVal1:Number = randomY2 - Math.random() * 75 - 25;
					add(new Collectible(xVal1, yVal1));
				}
				add(newPlat);
			}
			
			// low-ish platforms
			if (time % (SECONDS * 2) == 1) {
				var randomY2:Number = Math.ceil(-Math.random() * 200+500);
				var newPlat2:Platform = new Platform();
				newPlat2.init(Math.random() * 600 + 100, 500, randomY2);
				
				//50% chance for powerup to be attached to platform
				if (Math.random() > .5) {
					var xVal:Number = 500 + Math.random() * 200;
					var yVal:Number = randomY2 - Math.random() * 75 - 25;
					add(new Collectible(xVal, yVal));
				}
				add(newPlat2);
			}
			
			// Update all objects in RunnerWorld
			var entityList:Array = [];
			getAll(entityList);
			
			for each (var e:Entity in entityList) {
				e.update();
			}

			if (player.x < 0 || player.y > FP.screen.height) {
				FP.world = new GameOver;
			}
		}
	}

}
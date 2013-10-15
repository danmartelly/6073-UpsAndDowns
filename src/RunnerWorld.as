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
		private var platforms:Array;
		private var collectibles:Array;
		private var defaultSpeed:Number = 2;
		private var currentSpeed:Number = 3;
		private const SECONDS:Number = 60;
		
		private var nextPlatform:Platform = null;
		
		public function RunnerWorld() 
		{
			player = new Player(this);
			add(player);
			
			platforms = new Array();
			collectibles = new Array();
			
			initPlatform(300, 0, 300, currentSpeed);
			initPlatform(800, 0, 400, currentSpeed);
		}
		public function initPlatform(width:Number, xPos:Number, yPos:Number, speed:Number):void {
			var p:Platform = new Platform();
			p.init(width, xPos, yPos, speed);
			add(p);
			platforms.push(p);
			
			nextPlatform = p;
		}
		
		override public function update():void {
			time += 1;
			
			if (nextPlatform.x + nextPlatform.width < FP.width) {
				var shouldGoUp:Boolean = (nextPlatform.y > FP.height * Math.random());
				var nextY:Number;
				trace(shouldGoUp);
				
				if (shouldGoUp) {
					nextY = nextPlatform.y - 100 * Math.random();
					if (nextY < 5) nextY = 5;
					
					initPlatform(	300 + 400 * Math.random(), 
									nextPlatform.x + nextPlatform.width + 50 + 30 * Math.random(),
									nextY,
									currentSpeed   );
				}
				else {
					nextY = nextPlatform.y + 50 + 200 * Math.random();
					if (nextY > FP.height - nextPlatform.height - 5) nextY = FP.height - nextPlatform.height - 5;
					
					initPlatform(	300 + 400 * Math.random(), 
									nextPlatform.x + nextPlatform.width + 50 + 80 * Math.random(),
									nextY,
									currentSpeed   );
				}
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
		
		public function changeSpeed(newSpeed:Number):void {
			currentSpeed = newSpeed;
			for each (var plat:Platform in platforms) {
				plat.speed = currentSpeed;
			}
			for each (var coll:Collectible in collectibles) {
				coll.speed = currentSpeed;
			}
		}
		
		public function resetSpeed():void {
			changeSpeed(defaultSpeed);
		}
	}

}
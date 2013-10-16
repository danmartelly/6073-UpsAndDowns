package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;	
	import net.flashpunk.FP;

	public class RunnerWorld extends World
	{
		private const platformHeight:Number = 20;
		private const obstacleHeight:Number = 50;
		private var player:Player;
		private var time:Number = 0;
		private var platforms:Array;
		private var collectibles:Array;
		private var defaultSpeed:Number = 4;
		private var currentSpeed:Number = 4;
		private const SECONDS:Number = 60;
		public var level:Number;
		public var s:Text;
		public var totTime:Number  = 0;
		public var counter:Number = 0;

		private var background:Entity;
		private var f:Entity = new Entity(280, 100, s);

		[Embed(source = 'assets/kidBackground.png')] private const KID_BACKGROUND_IMAGE:Class;
		[Embed(source = 'assets/workBackground.png')] private const WORK_BACKGROUND_IMAGE:Class;
		[Embed(source = 'assets/hospitalBackground.png')] private const HOSPITAL_BACKGROUND_IMAGE:Class;
		
		private var nextPlatform:Platform = null;
		
		public function RunnerWorld(levelNum:Number = 1) 
		{
			writeTime(0);
			trace("testin  " + s.text);
			f = new Entity(350, 50, s);
			var backgroundImage:Class = [KID_BACKGROUND_IMAGE, WORK_BACKGROUND_IMAGE, HOSPITAL_BACKGROUND_IMAGE][levelNum+1];
			background = new Entity(0, 0, new Image(backgroundImage));
			add(background);
			add(f);

			player = new Player(this);
			add(player);
			
			platforms = new Array();
			collectibles = new Array();
			
			level = levelNum;
			
			initPlatform(800, platformHeight, 0, 400, currentSpeed);
		}
		public function initPlatform(width:Number, height:Number, xPos:Number, yPos:Number, speed:Number):void {
			var p:Platform = new Platform();
			p.init(width, height, xPos, yPos, speed);
			add(p);
			platforms.push(p);
			
			nextPlatform = p;
		}
		
		public function initBreakable(width:Number, height:Number, xPos:Number, yPos:Number, speed:Number):void {
			var b:BreakableObstacle = new BreakableObstacle();
			b.init(width, height, xPos, yPos, speed);
			add(b);
			platforms.push(b);
			
			nextPlatform = b;
		}
		
		public function makeCrannyTrap():void {
			var c:Platform = nextPlatform;
			var coll:Collectible = new Collectible(nextPlatform.x + 200, nextPlatform.y - 40, this.level, currentSpeed);
			
			collectibles.push(coll);
			add(coll);
			
			for (var n:int = 55; n <= 135; n += 20) {
				initBreakable(200, platformHeight, c.x + 500, c.y - n, currentSpeed);
			}
			
			nextPlatform = c;
		}
		
		public function writeTime(totTime:Number):void {
			var timer:Number = 30 - totTime;
			
			if (timer >= 0)
			{
				FP.world.remove(f);
				s = new Text(timer.toString());
				s.color = 0xFFFFFF;
				s.align = "center";
				f = new Entity(150,150, s);
				FP.world.add(f);
			}
			else {
				FP.world = new CompleteWorld(level, player.currentEmotion);
			}
		}
		
		override public function update():void {
			time += 1;
			counter = FP.elapsed;
			

			totTime  = totTime + counter;

			writeTime(totTime);
			add(f);
			
			if (nextPlatform.x + nextPlatform.width < FP.width) {
				var shouldGoUp:Boolean = (nextPlatform.y > FP.height * Math.random());
				var shouldMakeCollectible:Boolean = (0.5 > Math.random());
				var nextY:Number;
				
				if (shouldGoUp) {
					nextY = nextPlatform.y - 30 - 40 * Math.random();
					if (nextY < 5) nextY = 5;
					
					initPlatform(	500 + 600 * Math.random(), platformHeight, 
									nextPlatform.x + nextPlatform.width + 50 + 30 * Math.random(),
									nextY,
									currentSpeed   );
				}
				else {
					nextY = nextPlatform.y + 50 + 200 * Math.random();
					if (nextY > FP.height - nextPlatform.height - 5) nextY = FP.height - nextPlatform.height - 5;
					
					initPlatform(	500 + 600 * Math.random(), platformHeight,
									nextPlatform.x + nextPlatform.width + 20 + 40 * Math.random() + Math.sqrt((nextY - nextPlatform.y) / 4),
									nextY,
									currentSpeed   );
				}
				
				if (nextPlatform.width >= 800 && nextPlatform.y > 200 && Math.random() < 0.5) {
					makeCrannyTrap();
				}
				else if (shouldMakeCollectible) {
					var coll:Collectible = new Collectible(nextPlatform.x + Math.random() * nextPlatform.width, nextPlatform.y - 40, this.level, currentSpeed);
					collectibles.push(coll);
					
					add(coll);
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
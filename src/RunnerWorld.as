package  
{
	import net.flashpunk.World;
	public class RunnerWorld extends World
	{
		
		public function RunnerWorld() 
		{
			add(new Player());
			
			var plat:Platform = new Platform();
			plat.init(300, 400);
			var plat2:Platform = new Platform();
			plat2.init(800, 500);
			add(plat);
			add(plat2);
		}
		
	}

}
package  
{
	import net.flashpunk.World;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;	
	import net.flashpunk.FP;

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
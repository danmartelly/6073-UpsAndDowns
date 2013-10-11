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
			add(new Platform());
			

		}
		
	}

}
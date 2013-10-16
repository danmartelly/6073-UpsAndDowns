package  
{
	import flash.events.TextEvent;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;	
	import net.flashpunk.FP;
	
	public class CompleteWorld extends World
	{
		private var storyText:Text;
		private var storyEntity:Entity;
		private var continueText:Text;
		private var continueEntity:Entity;
		private var currentLevel:Number;
		private var currentEmotion:String;
		
		public function CompleteWorld(l:Number, e:String) {
			currentLevel = l;
			currentEmotion = e;
			
			if (currentEmotion == "sad") {
				storyText = new Text("Sad story :o(");
			} else if (currentEmotion == "happy") {
				storyText = new Text("Happy story!");
			} else {
				storyText = new Text("Angry story >.<");
			}
			
			storyText.color = 0xFFFFFF;
			storyText.align = "center";
			storyEntity = new Entity(FP.halfWidth - (storyText.width/2), (FP.halfHeight/2) - (storyText.height/2), storyText);
			
			continueText = new Text("Press S to start the next level");
			continueText.color = 0xFFFFFF;
			continueText.align = "center";
			continueEntity = new Entity(FP.halfWidth - continueText.width/2, FP.halfHeight, continueText);
			
			add(storyEntity);
			add(continueEntity);
		}
		
		override public function update():void {
			super.update();
			if (Input.pressed(Key.S)) {
				// Commented out for now since game crashes if it can't find the sprites for the next level
				// FP.world = new RunnerWorld(currentLevel + 1);
				FP.world = new RunnerWorld;
			}
		}
	}
}
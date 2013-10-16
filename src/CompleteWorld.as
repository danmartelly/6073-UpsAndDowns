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
		private var angryStories:Array = [["Man, I hated school. What a horrible place. Books and teachers and homework—and even worse, other kids. They might as well call it prison camp.",
										"Mom made me eat broccoli every day. Now just the thought of it makes me want to projectile vomit."], //level1
										
										["The boss just kept yelling at me for nothing. No one appreciates me. They'll just have to wait and see what I do."], //level2
										
										["With all this iBooks and GameBoxes and whatnot, no one knows how to talk to people anymore. This world’s going to hell in a handbasket! I’m glad I’ll be dead soon."] //level3
										];
		private var happyStories:Array = [["When I was a kid, I had the cutest little puppy. We did everything together. He made me the happiest boy in the world."],
										
										["Work was great. I was respected and everything was going well at home."], //level2
										
										["The home was great. A life of shuffleboard, complaining, and desperate widows? I thought I’d died and gone to heaven."] //level3
										];
										
		private var sadStories:Array = [["I didn't have a great childhood. I was lucky if I could get through a day without getting swirlied.",
										"My mom passed away when I was young; I barely remember her. But I still wonder if she’s out there somewhere, waiting for me."], //level1
										
										["Work was even worse. It was the same thing every, single day. I just wanted it to end.",
										"I never thought I’d be satisfied with 2.3 kids and a white picket fence in the suburbs. 2.3 kids and one fence later, I learned I was right."], //level2
										
										["When she died, I lost everything. I had nothing else to live for.",
										"I just couldn't stand seeing her in so much pain. It was the hardest thing I ever had to do..."] //level3
										];
		
		public function CompleteWorld(l:Number, e:String) {
			currentLevel = l;
			currentEmotion = e;
			
			if (currentEmotion == "sad") {
				storyText = new Text(FP.choose(sadStories[currentLevel-1]));
			} else if (currentEmotion == "happy") {
				storyText = new Text(FP.choose(happyStories[currentLevel-1]));
			} else {
				storyText = new Text(FP.choose(angryStories[currentLevel-1]));
			}
			
			storyText.color = 0xFFFFFF;
			storyText.align = "center";
			storyText.wordWrap = true;
			storyText.width = 400;
			storyEntity = new Entity(FP.halfWidth - (storyText.width/2), (FP.halfHeight/2) - (storyText.height/2), storyText);
			
			if (currentLevel == 3) {
				continueText = new Text("You finished the game, press S to go back to the main menu.");
			} else {
				continueText = new Text("Press S to start the next level");
			}
			continueText.color = 0xFFFFFF;
			continueText.align = "center";
			continueEntity = new Entity(FP.halfWidth - continueText.width/2, FP.halfHeight, continueText);
			
			add(storyEntity);
			add(continueEntity);
		}
		
		override public function update():void {
			super.update();
			if (Input.pressed(Key.S)) {
				if (currentLevel == 3) {
					FP.world = new Title();
				} else {
					FP.world = new RunnerWorld(currentLevel + 1);
				}
			}
		}
	}
}
package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	public class Player extends Entity
	{
		[Embed(source = 'assets/sample-sprite.png')] private const PLAYER:Class;
		public function Player() 
		{
			this.graphic = new Image(PLAYER);
			
			setHitbox(50, 50);
		}
		
		override public function update():void
		{
			if (Input.check(Key.LEFT)) { x -= 5; }
			if (Input.check(Key.RIGHT)) { x += 5; }
			if (Input.check(Key.UP)) { y -= 5; }
			if (Input.check(Key.DOWN)) { y += 5; }
			
			var p:Powerup = collide("powerup", this.x, this.y) as Powerup;
			
			if (p) {
				p.destroy();
			}
		}
	}

}
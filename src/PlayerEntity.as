package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	public class PlayerEntity extends Entity
	{
		[Embed(source = 'assets/sample-sprite.png')] private const PLAYER:Class;
		public function PlayerEntity() 
		{
			this.graphic = new Image(PLAYER);
		}
		
		override public function update():void
		{
			trace("Player updates.");
		}
	}

}
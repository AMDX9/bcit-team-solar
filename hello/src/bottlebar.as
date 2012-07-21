package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author joseph
	 */
	public class bottlebar extends Entity 
	{
		[Embed(source = 'assets/entities/bottlebar.png')] private const PLAYER:Class;
		public function bottlebar()
		{
			x = 450;
			y = 10;
			graphic = new Image(PLAYER);
		}
	}
	
}
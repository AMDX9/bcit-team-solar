package 
{
	import net.flashpunk.Entity;
		import net.flashpunk.graphics.Image;
		import net.flashpunk.FP;
	/**
	 * ...
	 * @author joseph
	 */
	public class Lotion extends ShiftableEntity
	{
				[Embed(source = 'assets/entities/bottle-ground.png')] private const PLAYER:Class;
		public function Lotion()
		{
			super(Math.random() * 500, Math.random() * 300 + 200, new Image(PLAYER), 45);
			setHitbox(30, 45);
			type = "lotion";
			
		}
		
		public function movefar():void
		{
			
			moveTo(Math.random() * 750,Math.random() * 300 + 200);
		}
	}
	
}
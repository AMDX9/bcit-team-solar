package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Sfx;
	/**
	 * ...
	 * @author Kevin
	 */
	public class Poof extends ShiftableEntity
	{
		[Embed(source = 'assets/particles/poof.png')] private const POOF:Class;
		[Embed(source = 'assets/pop-Oliverev-8163_hifi.mp3')] private const POP:Class;
		private var effect:Sfx = new Sfx(POP);
		private var poof:Spritemap;
		
		public function Poof() 
		{
			poof = new Spritemap(POOF, 100, 100);
			poof.add("poof", [0, 1, 2, 3, 4, 5, 6], 12, false);
			super(0, -100, poof, 9999999);
		}
		
		public function playPoof(locx:int, locy:int):void {
			moveTo(locx, locy);
			poof.play("poof", true);
			effect.play();
		}
	}

}
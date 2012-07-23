package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Kevin
	 */
	public class Sun extends Entity
	{
		[Embed(source = 'assets/background/sun.png')] private const SUN:Class;
		private var sunx:Number = 0;
		private var tempsunx:int;
		private var tempy:int;
		public function Sun() 
		{
			super(0, 0, new Image(SUN));
		}
		
		override public function update():void {
			layer = -1;
			tempsunx = sunx;
			tempy = ( -258 * Math.sin(Math.acos((sunx - FP.halfWidth) / FP.halfWidth)) + FP.halfHeight);
			moveTo(tempsunx,  tempy);
		}
		
		public function setX(newX:Number):void {
			sunx = newX;
		}
		
	}

}
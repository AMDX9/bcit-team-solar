package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author ...
	 */
	public class Cloud extends Entity
	{
		private var speed:Number;
		private var initialx:Number;
		private var yMaximum:Number;
		private var currenttime:Number = 0;
		
		public function Cloud(x:Number, yMax:Number, graphic:Graphic) 
		{
			super(x, FP.rand(yMax), graphic);
			yMaximum = yMax;
			initialx = x;
			setSpeed();
		}
		
		public function setSpeed():void {
			speed = FP.rand(3);
		}
		
		override public function update():void {
			if (speed == 0) {
				currenttime += FP.elapsed;
			}
			if ((currenttime >= 60)||(x >= FP.width)) {
				reset();
			} else {
				moveBy(speed * FP.elapsed, 0);
			}
		}
		
		public function reset():void {
			moveTo(initialx, FP.rand(yMaximum));
			setSpeed();
			currenttime = 0;
		}
	}

}
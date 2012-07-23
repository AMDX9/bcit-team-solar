package  
{
	/**
	 * ...
	 * @author Kevin
	 */
	public class MovementManger 
	{
		private var total:Number = 0;
		private var last:int = 0;
		private var clients:Vector.<Shiftable> = new Vector.<Shiftable>;
		
		public function add(item:Shiftable):void {
			clients.push(item);
		}
		
		public function shift(amount:Number):void {
			var displacement:int;
			total += amount;
			displacement = total - last;
			if (Math.abs(displacement) > 0) {
				for each(var temp:Shiftable in clients) {
					temp.shift(displacement);
				}
			}
			last = total;
		}
		
		public function update():void {
			for each(var temp:Shiftable in clients) {
				temp.update();
			}
		}
	}

}
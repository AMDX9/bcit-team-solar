package  
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author ...
	 */
	public class TreeManager implements Shiftable
	{
		[Embed(source = 'assets/trees/puff.png')] private const TREE1:Class;
		[Embed(source = 'assets/trees/conifer.png')] private const TREE2:Class;
		private var available:Vector.<Image>;
		private var trees:Vector.<ShiftableEntity>;
		private var generated:Boolean = true;
		private var lastshift:int = 0;
		private var world:World;
		private var leftBound:int, rightBound:int;
		public function TreeManager() 
		{
			available = Vector.<Image>([new Image(TREE1), new Image(TREE2)]);
			trees = Vector.<ShiftableEntity>([new ShiftableEntity(300, 400, available[0], 166), new ShiftableEntity(600, 100, available[1], 120)]);
			leftBound = 0;
			rightBound = 800;
		}
		
		public function update():void {
			var count:int  = 0;
			for each(var temp:ShiftableEntity in trees) {
				temp.update();
				if (temp.shown()) {
					count++;
				}
			}
			FP.console.log(trees.length);
			if (count < 2 && !generated && (leftBound > 0 || rightBound < FP.width)) {
				generate();
			}
		}
		
		public function shift(amount:int):void {
			for each(var temp:ShiftableEntity in trees) {
				temp.shift(amount);
				generated = false;
				leftBound += amount;
				rightBound += amount;
			}
			lastshift = amount;
		}
		
		public function generate():void {
			var select:int = FP.rand(available.length);
			if (lastshift > 0) {
				trees.push(new ShiftableEntity( -available[select].width, FP.rand(320) + 280 - available[select].height, available[select], 166));
				leftBound = -available[select].width;
			} else {
				trees.push(new ShiftableEntity(FP.width, FP.rand(320) + 280 - available[select].height, available[select], 166));
				rightBound = FP.width + available[select].width;
			}
			generated = true;
		}
		
		public function getLast():ShiftableEntity {
			return trees[trees.length-1];
		}
		
		public function hasGenerated():Boolean {
			return generated;
		}
		
		public function getFirst():ShiftableEntity {
			return trees[0];
		}
	}

}
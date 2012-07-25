package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author joseph
	 */
	public class MyBoy extends Entity
	{
		[Embed(source = 'assets/boy/boy_all.png')] 
		private const PLAYER:Class;
		public var sprPlayer:Spritemap = new Spritemap(PLAYER, 50, 100);
		private var total:Number;
		private var facingleft:Boolean = false;
		private var diffx:Number = 0;
		private var diffy:Number = 0;
		private var burnt:Boolean = false;
		public function MyBoy()
		{
			super(400, 300, sprPlayer);
			setHitbox(40, 90);			
			sprPlayer.add("right", [0, 1, 2, 3, 4, 5, 6, 7], 8, true);
			sprPlayer.add("left", [8, 9, 10, 11, 12, 13, 14, 15], 8, true);
			sprPlayer.add("stand", [16], 0, false);
			sprPlayer.add("burn", [17, 18, 19, 20, 21, 22, 23, 24, 25, 26], 10, false);
			type = "player";
			total = y;
			sprPlayer.play("stand");
		}
		override public function update():void
		{
			layer = -(y + 90);
			if (burnt) {
				return;
			}
			var sumx:int = 0, sumy:int = 0, temp:int;
			if (Input.mousePressed)
			{
				diffx = x - Input.mouseX;
				diffy = y - Input.mouseY;
				
			}
			
			if (Input.check(Key.LEFT))
			{
				++sumx;
			}
			
			if (Input.check(Key.RIGHT))
			{
				--sumx;
			}
			
			if (Input.check(Key.UP))
			{
				if (y > 200) {
					--sumy;
				}
			}
			if (Input.check(Key.DOWN))
			{
				if (y < 500) {
					++sumy;
				}
			}
			
			total += sumy * 250 * FP.elapsed;
			temp = total;
			y = temp;
			MyWorld.movement.shift(sumx * 300 * FP.elapsed);
			
			graphic = sprPlayer;
			if (sumx > 0) {
				sprPlayer.play("left");
				facingleft = true;
				
			} else if (sumx < 0) {
				sprPlayer.play("right");
				facingleft = false;
			}
			
			if (sumy != 0) {
				if (facingleft) {
					sprPlayer.play("left");
				} else {
					sprPlayer.play("right");
				}
			}
			
			if (sumx == 0 && sumy == 0) {
				sprPlayer.play("stand");
			}
		}
		
		public function burn():void {
			sprPlayer.play("burn");
			burnt = true;
		}
	}
	
}
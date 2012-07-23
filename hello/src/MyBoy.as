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
		[Embed(source = 'assets/boy/walkcycle/boy_all.png')] 
		private const PLAYER:Class;
		[Embed(source = 'assets/boy/boy_front.png')] 
		private const STAND:Class;
		
		public var sprPlayer:Spritemap = new Spritemap(PLAYER, 50, 100);
		private var total:Number;
		private var facingleft:Boolean = false;
		private var stand:Image = new Image(STAND);
		
		public var prevx:Number = 0;
		public var prevy:Number = 0;
		public var face:Number = 0;   // 0 = facing right, 1 = facing left.
		
		public var destx:Number = 0;
		public var desty:Number = 0;
		
	
		
		public function MyBoy()
		{
			super(400, 300, stand);
			setHitbox(40, 90);			
			sprPlayer.add("right", [0, 1, 2, 3, 4, 5, 6, 7], 8, true);
			sprPlayer.add("left", [8, 9, 10, 11, 12, 13, 14, 15], 8, true);
			type = "player";
			total = y;
		}
		override public function update():void
		{
			layer = -(y + 90);
			var sumx:int = 0, sumy:int = 0, temp:int;
			var bottle:Lotion = collide("lotion", x, y) as Lotion;
			if (bottle)
			{
				bottle.movefar();
				
			}
			
			if (Input.mousePressed)
			{
				destx = Input.mouseX;
				desty = Input.mouseY;
				
			}
			
			if (x < destx)
			{
				//sumx -= 1;
			}
			
			if (x > destx)
			{
				//sumx += 1;
			}
			
			if ((y > desty) && (y > 200))
			{
				//sumy -= 1;
			}
			
			if ((y < desty) && (y < 500))
			{
				//sumy += 1;
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
			FP.console.log(total);
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
				graphic = stand;
			}
		}
	}
	
}
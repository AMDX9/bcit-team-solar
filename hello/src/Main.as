package 
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author joseph
	 */
	public class Main extends Engine 
	{
		
		public function Main()
		{
			super(800, 600, 60, false);
			FP.console.enable();
			
			FP.screen.color = 0xffffff;
			
			FP.console.toggleKey = Key.ENTER;
		}
		
		override public function init():void {
			FP.world = new MenuWorld;
			trace("FlashPunk has started successfully!");
		}
		
		override public function update():void {
			if (Input.pressed(Key.SPACE)) {
				FP.world = new MyWorld;
				
			}
			super.update();
		}
		
	
		
	}
	
}
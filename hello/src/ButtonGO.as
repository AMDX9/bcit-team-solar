package  
{
	import adobe.utils.CustomActions;
	import net.flashpunk.Entity;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author ...
	 */
	public class ButtonGO extends Entity 
	{
		[Embed(source="assets/tree1.png")]private const OBJ:Class;
		public function ButtonGO() 
		{
			x = 400;
			y = 10;
			graphic = new Image(OBJ);
		}
		
		
		
	}

}
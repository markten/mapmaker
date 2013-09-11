package net.mabdulra 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author GW Game Developers
	 */
	public class GasStation extends TopDownLevel
	{
		//	constants
		public static const TILESPERROW	:uint = 19+6;	//	3*2 for side buffers
		
		//	floor layer
		protected static var FLOORS:Array = new Array(
			 1, 1, 1, 9, 9,20, 9, 9, 9, 9, 9, 9, 9, 9,24, 9, 9, 9, 9, 9, 9, 9, 1, 1, 1,
			 1, 1, 1, 9, 9,20, 9, 9, 9, 9, 9, 9, 9, 9,24, 9, 9, 9, 9, 9, 9, 9, 1, 1, 1,
			 1, 1, 1,19,19,20, 9, 9, 9, 9, 9, 9, 9, 9,24,19,19,19,19,19,19,19, 1, 1, 1,
			 1, 1, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1,
			 1, 1, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1,
			 1, 1, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1,
			 1, 1, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1,
			 1, 1, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1,
			 1, 1, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1,
			 1, 1, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1,
			 1, 1, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1,
			 1, 1, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1,
			 1, 1, 1, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 1, 1, 5, 5, 5, 5, 5, 5, 5, 1, 1, 1,
			 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 5, 5, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
		);
		
		//	wall layer
		protected static var WALLS:Array = new Array(
			 1, 1, 1, 9, 0,20, 9, 9, 9, 9, 9, 9, 9, 9,24, 0, 0, 9, 9, 9, 9, 9, 1, 1, 1,
			 1, 1, 1, 9, 0,20, 9, 9, 9, 9, 9, 9, 9, 9,24, 0, 0, 9, 9, 9, 9, 9, 1, 1, 1,
			 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
		);
		
		//	constructor
		public function GasStation(state:FlxState) 
		{
			super(state,
					FLOORS, WALLS,
					Assets.INDOORS_01_TILE,		//	tilesheet
					new FlxPoint(TILESPERROW, FLOORS.length / TILESPERROW),
					new FlxPoint(12, 13),			//	player warp start (tiles)
					Constants.GAS_STATION,			//	map ID
					new FlxPoint(0, -1)				//	player offset (pixels)
			);
		}
		
		//	create all interactable objects
		override protected function createObjects():void
		{
			//	computer
			sprite = createSprite(Assets.QIANYI_COMPUTER, new FlxPoint(15, 10), new FlxPoint(0, 0) );
			objectGroup.add(sprite);

			//	food shelf 1
			sprite = createSprite(Assets.FOOD_SHELF_TOP, new FlxPoint(4, 5), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			sprite = createSprite(Assets.FOOD_SHELF_BOTTOM, new FlxPoint(4, 10), new FlxPoint(0, 0) );
			decalGroup.add(sprite);
			
			//	food shelf 2
			sprite = createSprite(Assets.CHOCO_SHELF, new FlxPoint(8, 9), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			
			//	counter
			sprite = createSprite(Assets.COUNTER_SIDE, new FlxPoint(9, 3), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			sprite = createSprite(Assets.COUNTER_TOP, new FlxPoint(9, 5), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			sprite = createSprite(Assets.COUNTER_BOTTOM, new FlxPoint(9, 6), new FlxPoint(0, 0) );
			decalGroup.add(sprite);
			
			//	bed
			sprite = createSprite(Assets.QIANYI_BED, new FlxPoint(19, 9), new FlxPoint(0, 6) );
			objectGroup.add(sprite);
			
			//	wardrobe
			sprite = createSprite(Assets.QIANYI_CLOTHES, new FlxPoint(17, 2), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			
			//	poster 1 (Easy Rider)
			sprite = createSprite(Assets.POSTER_01, new FlxPoint(5, 0), new FlxPoint(0, 0) );
			decalGroup.add(sprite);
			
			//	poster 2 (Bob Seger)
			sprite = createSprite(Assets.POSTER_02, new FlxPoint(7, 0), new FlxPoint(0, 1) );
			decalGroup.add(sprite);
			
			//	poster 3 (Men at Work)
			sprite = createSprite(Assets.POSTER_03, new FlxPoint(9, 0), new FlxPoint(0, -2) );
			decalGroup.add(sprite);
			
			//	poster 4 (CCR)
			sprite = createSprite(Assets.POSTER_04, new FlxPoint(11, 0), new FlxPoint(0, 1) );
			decalGroup.add(sprite);
		}
		
		//	create the NPCs
		override protected function createNPC():void
		{
			var npcChar		:NPC = new NPC( Constants.QIANYI, 2 );
			npcChar.x = 11 * TILESIZE.x + 1;
			npcChar.y = 3 * TILESIZE.y - 2;
			npcGroup.add(npcChar);
		}
		
		//	overrides for dialogue handling
		override public function handleDialogueWithObjectGroup():void
		{
			if ( FlxG.levels[3] <= 3 )
				dialogueCall = FlxG.levels[3] + 43;
			else if ( FlxG.levels[3] == 4 )
				dialogueCall = 46;
			else
				dialogueCall = uint.MAX_VALUE;
		}
		
		override public function handleDialogueWithDecalGroup():void
		{
			if ( FlxG.levels[3] == 0 )
				dialogueCall = 44;
			else if (FlxG.levels[3] == 1)
				dialogueCall = 46;
			else
				dialogueCall = uint.MAX_VALUE;
		}
		
		override public function handleDialogueWithNpcGroup():void
		{
			if ( FlxG.levels[3] == 0 )
			{
				(npcGroup.members[0] as NPC).changeFacing(player.facing);
				dialogueCall = 46;
			}
			else
				dialogueCall = uint.MAX_VALUE;
		}
		
		//	warp zone definitions
		override public function warpZoneCheck():void
		{
			if ( player.y >= 12 * TILESIZE.y + (15*TILESIZE.y/16) || player.y <= -100 || player.x < 0 || player.x > TILESPERROW * TILESIZE.x )
				loadMap(Constants.PINE_CREEK, Constants.GASSTATION_WARP);
		}
		
		
		
	}

}
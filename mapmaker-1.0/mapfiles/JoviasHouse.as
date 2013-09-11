package net.mabdulra 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author GW Game Developers
	 */
	public class JoviasHouse extends TopDownLevel
	{
		//	constants
		public static const TILESPERROW	:uint = 21+6;	//	3*2 for side buffers
		
		//	floor layer
		protected static var FLOORS:Array = new Array(
			1, 1, 1,10,10,10,10,10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1,10,10,10,10,10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1,10,10,10,10,10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1,10,10,10,10,10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,10,10,10,10,10, 1, 1, 1,
			1, 1, 1,10,10,10,10,10,12,10,10,10,10,10,10,10,10,10,16,10,10,10,10,10, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6,12,10,10,10,10,10,10,10,10,10,16,10,10,10,10,10, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6,12,10,10,10,10,10,10,10,10,10,16,10,10,10,10,10, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6,12,10,10,10,10,10,10,10,10,10,16, 6, 6, 6, 6, 6, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 6, 6, 6, 6, 6, 6, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 1, 6, 6, 1, 1, 1, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1,10, 6, 6,10,10,10, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1,10, 6, 6,10,10,10, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 6, 6, 6, 6, 6, 6, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 6, 6, 6, 6, 6, 6, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 6, 6, 6, 6, 6, 6, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 6, 6, 6, 6, 6, 6, 1, 1, 1,
			1, 1, 1, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 1, 1, 6, 6, 6, 6, 6, 6, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 6, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
		);
		
		//	wall layer
		protected static var WALLS:Array = new Array(
			1, 1, 1,10,10,10,10,10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1,10,10,10,10,10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1,10,10,10,10,10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,10,10,10,10,10, 1, 1, 1,
			1, 1, 1,10,10,10,10,10, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,10,10,10,10,10, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0,12,10,10,10,10,10,10,10,10,10,16,10,10,10,10,10, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0,12,10,10,10,10,10,10,10,10,10,16,10,10,10,10,10, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0,12,10,10,10,10,10,10,10,10,10,16, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,10, 0, 0,10,10,10, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
		);
		
		//	constructor
		public function JoviasHouse(state:FlxState) 
		{
			super(state,
					FLOORS, WALLS,
					Assets.INDOORS_01_TILE,		//	tilesheet
					new FlxPoint(TILESPERROW, FLOORS.length / TILESPERROW),
					new FlxPoint(11, 21),			//	player warp start (tiles)
					Constants.JOVIAS_HOUSE,			//	map ID
					new FlxPoint(0, -1)				//	player offset (pixels)
			);
		}
		
		//	create all interactable objects
		override protected function createObjects():void
		{
			//	philosophy shelf
			sprite = createSprite( Assets.PHILOSOPHY_SHELF, new FlxPoint(8, 18), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			
			//	history shelf
			sprite = createSprite( Assets.HISTORY_SHELF, new FlxPoint(8, 15), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			
			//	lierature shelf
			sprite = createSprite( Assets.LITERATURE_SHELF, new FlxPoint(8, 12), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			
			//	art shelf
			sprite = createSprite( Assets.ART_SHELF, new FlxPoint(13, 18), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			
			//	engineering shelf
			sprite = createSprite( Assets.ENGINEERING_SHELF, new FlxPoint(13, 15), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			
			//	math/science shelf
			sprite = createSprite( Assets.MATH_SHELF, new FlxPoint(13, 12), new FlxPoint(0,0) );
			objectGroup.add(sprite);
			
			//	mars rover
			sprite = createSprite( Assets.MARS_ROVER, new FlxPoint(3, 18), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			
			//	fanfic table
			sprite = createSprite( Assets.FANFICS, new FlxPoint(3, 14), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			
			//	anime and manga table
			sprite = createSprite( Assets.ANIME_MANGA, new FlxPoint(3, 12), new FlxPoint(0, 0));
			objectGroup.add(sprite);
			
			//	chemistry with proto-112
			sprite = createSprite( Assets.JOVIA_PROTO112, new FlxPoint(20, 18), new FlxPoint(0, 0));
			objectGroup.add(sprite);
			
			//	television
			sprite = new FlxSprite(
				21 * TILESIZE.x, 5 * TILESIZE.y
			);
			sprite.loadGraphic(Assets.TV_TOP, true, false, 48, 16);
			sprite.addAnimation("idle", [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4, 5, 6, 7, 7, 7], 3);
			sprite.play("idle");
			sprite.immovable = true;
			objectGroup.add(sprite);
			
			sprite = new FlxSprite(
				21 * TILESIZE.x, 6 * TILESIZE.y
			);
			sprite.loadGraphic(Assets.TV_BOTTOM, true, false, 48, 16);
			sprite.addAnimation("idle", [1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 4, 5, 6, 7, 7, 7], 3);
			sprite.play("idle");
			sprite.immovable = true;
			decalGroup.add(sprite);
			
			/*
			sprite = createSprite( Assets.TV_TOP, new FlxPoint(21, 5), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			sprite = createSprite( Assets.TV_BOTTOM, new FlxPoint(21, 6), new FlxPoint(0, 0));
			decalGroup.add(sprite);
			*/
			
			//	bed
			sprite = createSprite( Assets.JOVIABED, new FlxPoint(21, 9), new FlxPoint(0, 6) );
			objectGroup.add(sprite);
			
			//	solar system display
			sprite = createSprite( Assets.SOLAR_TOP, new FlxPoint(3, 3), new FlxPoint(0, 0));
			objectGroup.add(sprite);
			sprite = createSprite( Assets.SOLAR_BOTTOM, new FlxPoint(3, 7), new FlxPoint(0, 0));
			decalGroup.add(sprite);
			
			//	laptop
			sprite = new FlxSprite(
				8 * TILESIZE.x, 7 * TILESIZE.y
			);
			sprite.loadGraphic(Assets.LAPTOP_TOP, true, false, 48, 16);
			sprite.addAnimation("idle", [1, 2], 2);
			sprite.play("idle");
			sprite.immovable = true;
			objectGroup.add(sprite);
			sprite = createSprite( Assets.LAPTOP_BOTTOM, new FlxPoint(8, 8), new FlxPoint(0, 0));
			decalGroup.add(sprite);
			
			//	clothing rack
			sprite = createSprite( Assets.JOVIA_CLOTHES_TOP, new FlxPoint(11, 6), new FlxPoint(0, 0));
			objectGroup.add(sprite);
			sprite = createSprite( Assets.JOVIA_CLOTHES_BOTTOM, new FlxPoint(11, 8), new FlxPoint(0, 0));
			decalGroup.add(sprite);
			
			//	archway
			sprite = createSprite( Assets.ARCHYWAY, new FlxPoint(18, 13), new FlxPoint(0, 0));
			overGroup.add(sprite);
			sprite = createSprite( Assets.ARCHYWAY_LEFT, new FlxPoint(18, 14), new FlxPoint(0, 0));
			decalGroup.add(sprite);
			sprite = createSprite( Assets.ARCHYWAY_RIGHT, new FlxPoint(21, 14), new FlxPoint(0, 0));
			decalGroup.add(sprite);
		}
		
		//	create the NPCs
		override protected function createNPC():void
		{
			var npcChar		:NPC = new NPC( (FlxG.levels[0] == Constants.ISJOVIA)?Constants.DANNY:Constants.JOVIA, 0 );
			npcChar.x = 7 * TILESIZE.x;
			npcChar.y = 7 * TILESIZE.y + 5;
			npcGroup.add(npcChar);
		}
		
		//	warp zone definitions
		override public function warpZoneCheck():void
		{
			if ( player.y >= 20 * TILESIZE.y + (15*TILESIZE.y/16) )
				loadMap(Constants.PINE_CREEK);	//	temporary (Pine Creek)
		}
		
		//	overrides for dialogue handling
		override public function handleDialogueWithObjectGroup():void
		{
			if ( FlxG.levels[3] <= 34-20 )
				dialogueCall = FlxG.levels[3] + 20;
			else
				dialogueCall = uint.MAX_VALUE;
		}
		
		override public function handleDialogueWithDecalGroup():void
		{
			switch( FlxG.levels[3] )
			{
				case 0:		dialogueCall = 30		;	break;
				case 1:		dialogueCall = 32		;	break;
				case 2:		dialogueCall = 33		;	break;
				case 3:		dialogueCall = 34		;	break;
				default:	dialogueCall = uint.MAX_VALUE	;	break;
			}
		}
		
		override public function handleDialogueWithNpcGroup():void
		{
			switch( FlxG.levels[3] )
			{
				case 0:		(npcGroup.members[0] as NPC).changeFacing(player.facing);
							dialogueCall = 36;
							break;
				default:	dialogueCall = uint.MAX_VALUE;
							break;
			}
		}
		
	}

}
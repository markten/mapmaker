package net.mabdulra 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author GW Game Developers
	 */
	public class DannysHouse extends TopDownLevel
	{
		//	constants
		public static const TILESPERROW	:uint = 21+6;
		
		//	floor layer
		protected static var FLOORS:Array = new Array(
			1, 1, 1, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 1, 1, 1,
			1, 1, 1, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 1, 1, 1,
			1, 1, 1, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 1, 1, 1,
			1, 1, 1, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 1, 1, 1,
			1, 1, 1, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 1, 1, 1,
			1, 1, 1,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13,13, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
		);
		
		//	wall layer
		protected static var WALLS:Array = new Array(
			1, 1, 1, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 1, 1, 1,
			1, 1, 1, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 1, 1, 1,
			1, 1, 1, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 1, 1, 1,
			1, 1, 1, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 1, 1, 1,
			1, 1, 1, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 8, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
			1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
		);
		
		//	constructor
		public function DannysHouse(state:FlxState)
		{
			var playerWarpStart:FlxPoint	= new FlxPoint(12, 6);
			var playerWarpOffset:FlxPoint	= new FlxPoint(0, 0);
			
			if ( FlxG.levels[13] == Constants.DANNYSHOUSE_WARP )
			{
				playerWarpStart = new FlxPoint(12, 22);
				playerWarpOffset = new FlxPoint(0, -1);
			}
			
			super(state,
					FLOORS, WALLS,
					Assets.INDOORS_01_TILE,			//	tilesheet
					new FlxPoint(TILESPERROW, FLOORS.length / TILESPERROW),
					playerWarpStart,				//	player warp start (tiles)
					Constants.DANNYS_HOUSE,			//	map ID
					playerWarpOffset				//	player offset (pixels)
			);
		}
		
		//	create all interactable objects
		override protected function createObjects():void
		{
			//	tv
			sprite = new FlxSprite(
				8 * TILESIZE.x, 12 * TILESIZE.y
			);
			sprite.loadGraphic(Assets.TELEVISION_DOWN, true, false, 32, 32);
			sprite.addAnimation("idle", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 6);
			sprite.play("idle");
			sprite.immovable = true;
			objectGroup.add(sprite);
			
			//	fake UFO model
			sprite = createSprite( Assets.FAKEUFOMODEL, new FlxPoint(8, 18), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			
			//	rock analyzer
			sprite = createSprite( Assets.ROCKANALYZER_TOP, new FlxPoint(3, 3), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			sprite = createSprite( Assets.ROCKANALYZER_BOTTOM, new FlxPoint(3, 8), new FlxPoint(0, 0) );
			decalGroup.add(sprite);
			
			//	computer setup
			sprite = new FlxSprite(
				9 * TILESIZE.x, 3 * TILESIZE.y
			);
			sprite.loadGraphic(Assets.DANNY_COMPUTER_TOP, true, false, 112, 32);
			sprite.addAnimation("off", [0]);
			sprite.addAnimation("original", [1]);
			sprite.addAnimation("search", [6]);
			sprite.addAnimation("rock", [5]);
			sprite.addAnimation("static", [2, 3, 4], 12);
			if ( FlxG.levels[0] == Constants.ISDANNY )
			{
				if ( player.eventFlags[2] )
					sprite.play("off");
				else if ( player.eventFlags[1] )
					sprite.play("search");
				else if( player.eventFlags[0] )
					sprite.play("rock");
				else
					sprite.play("original");
			}
			else
			{
				if ( FlxG.levels[12] == 4 )
					sprite.play("off");
				else if ( player.eventFlags[4] )
					sprite.play("search");
				else
					sprite.play("static");
			}
			sprite.immovable = true;
			objectGroup.add(sprite);
			
			
			sprite = createSprite( Assets.DANNY_COMPUTER_BOTTOM, new FlxPoint(9, 5), new FlxPoint(0, 0) );
			decalGroup.add(sprite);
			
			//	nsfw shelf
			sprite = createSprite( Assets.BOOKSHELF_DOWN_TOP, new FlxPoint(16, 3), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			sprite = createSprite( Assets.BOOKSHELF_DOWN_BOTTOM, new FlxPoint(16, 5), new FlxPoint(0, 0) );
			decalGroup.add(sprite);
			
			//	proto-111 transmitter
			sprite = createSprite( Assets.PROTO111_TOP, new FlxPoint(20, 3), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			sprite = createSprite( Assets.PROTO111_BOTTOM, new FlxPoint(20, 6), new FlxPoint(0, 0) );
			decalGroup.add(sprite);
			
			//	telescope
			sprite = createSprite( Assets.TELESCOPE_TOP, new FlxPoint(3, 9), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			sprite = createSprite( Assets.TELESCOPE_BOTTOM, new FlxPoint(3, 11), new FlxPoint(0, 0) );
			decalGroup.add(sprite);
			
			//	grapple hook
			sprite = createSprite( Assets.GRAPPLEHOOK, new FlxPoint(3, 12), new FlxPoint(0, 0) );
			if (	(FlxG.levels[0] == Constants.ISJOVIA) ||
					( FlxG.levels[0] == Constants.ISDANNY && player.eventFlags[Constants.S_WEAPON] )	)
				sprite.x = sprite.y = -100;
			objectGroup.add(sprite);
			
			//	photo shelf
			sprite = createSprite( Assets.BOOKSHELF_RIGHT_TOP, new FlxPoint(3, 14), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			sprite = createSprite( Assets.BOOKSHELF_RIGHT_BOTTOM, new FlxPoint(3, 17), new FlxPoint(0, 0) );
			decalGroup.add(sprite);
			
			//	dart gun ammo
			sprite = createSprite( Assets.DARTGUNAMMO_TOP, new FlxPoint(3, 18), new FlxPoint(0, 0));
			if (	(FlxG.levels[0] == Constants.ISJOVIA) ||
					( FlxG.levels[0] == Constants.ISDANNY && player.eventFlags[Constants.D_WEAPON] )	)
				sprite.x = sprite.y = -100;
			objectGroup.add(sprite);
			sprite = createSprite( Assets.DARTGUNAMMO_BOTTOM, new FlxPoint(3, 19), new FlxPoint(0, 0) );
			if (	(FlxG.levels[0] == Constants.ISJOVIA) ||
					( FlxG.levels[0] == Constants.ISDANNY && player.eventFlags[Constants.D_WEAPON] )	)
				sprite.x = sprite.y = -100;
			decalGroup.add(sprite);
			
			//	laser gun
			sprite = new FlxSprite(
				3 * TILESIZE.x, 20* TILESIZE.y
			);
			sprite.loadGraphic(Assets.LASERGUN, true, false, 48, 32);
			sprite.addAnimation("present", [0]);
			sprite.addAnimation("absent", [1]);
			if (	(FlxG.levels[0] == Constants.ISDANNY && FlxG.levels[12] >= 3) ||
					(FlxG.levels[0] == Constants.ISJOVIA && player.eventFlags[Constants.D_WEAPON] )		)
				sprite.play("absent");
			else
				sprite.play("present");
			sprite.immovable = true;
			objectGroup.add(sprite);
			
			//	didgeridoo
			sprite = createSprite( Assets.DIDGERIDOO_TOP, new FlxPoint(12, 9), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			sprite = createSprite( Assets.DIDGERIDOO_BOTTOM, new FlxPoint(12, 11), new FlxPoint(0, 0) );
			decalGroup.add(sprite);
			
			//	clothing rack
			sprite = createSprite( Assets.DANNY_CLOTHES_TOP, new FlxPoint(16, 9), new FlxPoint(0, 0) );
			objectGroup.add(sprite);
			sprite = createSprite( Assets.DANNY_CLOTHES_BOTTOM, new FlxPoint(16, 11), new FlxPoint(0, 0) );
			decalGroup.add(sprite);
			
			//	statue of david
			sprite = createSprite( Assets.STATUEOFDAVID, new FlxPoint(8, 14), new FlxPoint(0, 0));
			objectGroup.add(sprite);
			
			//	danny's bed
			sprite = createSprite( Assets.DANNYBED_TOP, new FlxPoint(10, 14), new FlxPoint(0, -1));
			objectGroup.add(sprite);
			sprite = createSprite( Assets.DANNYBED_BOTTOM, new FlxPoint(10, 16), new FlxPoint(0, -1));
			decalGroup.add(sprite);
			
			//	fake antigravity thing
			sprite = createSprite( Assets.FAKEANTIGRAVITY, new FlxPoint(14, 19), new FlxPoint(0, 0));
			objectGroup.add(sprite);
			
			//	tesla coils
			sprite = new FlxSprite(
				19 * TILESIZE.x, 19 * TILESIZE.y
			);
			sprite.loadGraphic(Assets.TESLACOILS, true, false, 80, 48);
			sprite.addAnimation("idle", [0, 1, 2, 1, 2, 0, 2, 0, 1, 0, 1, 2], 12);
			sprite.play("idle");
			sprite.immovable = true;
			objectGroup.add(sprite);
			
			//	tin foil hats
			sprite = createSprite(Assets.TINFOILHATS_TOP, new FlxPoint(19, 14), new FlxPoint(0, 0));
			objectGroup.add(sprite);
			sprite = createSprite(Assets.TINFOILHATS_BOTTOM, new FlxPoint(19, 15), new FlxPoint(0, 0));
			decalGroup.add(sprite);
			
			//	pH tests
			sprite = createSprite(Assets.PHTESTS, new FlxPoint(19, 16), new FlxPoint(0, 0));
			objectGroup.add(sprite);
			
		}
		
		//	create the NPCs
		override protected function createNPC():void
		{
			var npcChar		:NPC = new NPC( (FlxG.levels[0] == Constants.ISJOVIA)?Constants.DANNY:Constants.JOVIA, 0 );
			if ( FlxG.levels[12] == 4 )
			{
				npcChar.x = 23 * TILESIZE.x	;
				npcChar.y =  7 * TILESIZE.y	- 2;
			}
			else
				npcChar.x = npcChar.y = -100;
			
			
			npcGroup.add(npcChar);
		}
		
		//	overrides for dialogue handling
		override public function handleDialogueWithObjectGroup():void
		{
			//	didgeridoo first for SOLO
			if ( FlxG.levels[3] == 11 )
			{
				dialogueCall = FlxG.levels[3];
				FlxG.playMusic(Assets.DIDGERIDOO_MUSIC);
			}
			else if ( FlxG.levels[3] <= 18 )
				dialogueCall = FlxG.levels[3];
			else
				dialogueCall = uint.MAX_VALUE;
		}
		
		override public function handleDialogueWithDecalGroup():void
		{
			switch( FlxG.levels[3] )
			{
				case 0:		dialogueCall = 2		;	break;
				case 1:		dialogueCall = 3		;	break;
				case 2:		dialogueCall = 4		;	break;
				case 3:		dialogueCall = 5		;	break;
				case 4:		dialogueCall = 6		;	break;
				case 5:		dialogueCall = 8		;	break;
				case 6:		dialogueCall = 9		;	break;
				case 7:		dialogueCall = 11		;	break;
				case 8:		dialogueCall = 12		;	break;
				case 9:		dialogueCall = 14		;	break;
				case 10:	dialogueCall = 17		;	break;
				default:	dialogueCall = uint.MAX_VALUE	;	break;
			}
		}
		
		override public function handleDialogueWithNpcGroup():void
		{
			switch( FlxG.levels[3] )
			{
				case 0:		(npcGroup.members[0] as NPC).changeFacing(player.facing);
							dialogueCall = 19;
							break;
				default:	dialogueCall = uint.MAX_VALUE;
							break;
			}
		}
		
		//	warp zone definitions
		override public function warpZoneCheck():void
		{
			if ( player.y >= 21 * TILESIZE.y + (15*TILESIZE.y/16))
			{
				loadMap(Constants.PINE_CREEK, Constants.DANNYSHOUSE_WARP);
			}
		}

	}

}
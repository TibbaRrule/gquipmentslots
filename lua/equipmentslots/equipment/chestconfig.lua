/*=====================================================================
== Made by Mario 'Tibba'Sinn 										 ==
== CONTACT: mariosgameroominquiries@gmail.com" 						 ==
== YOUTUBE: https://www.youtube.com/channel/UCVYG2ZDHynAXgYLP6J9hxUg ==
== STEAM: https://steamcommunity.com/profiles/76561198191730261/     ==
=======================================================================
== Please consider subscribing to my youtube channel if you end up   ==
== using this addon.												 ==
=======================================================================
== LICENSE: CC BY-NC 4.0											 ==
== https://creativecommons.org/licenses/by-nc/4.0/ 					 ==
=======================================================================*/
if EquipmentSlots.ShowDebugPrints then

	print( "Including EquipmentSlot Chest Config.")

end

local ChestPieces = ChestPieces || {};
ChestPieces.Database = {};

local _count = 1;

function ChestPieces.Add( item )

	ChestPieces.Database[_count+1] = item;

	_count = _count + 1;
end 

ChestPieces.Add( {
	name = "Mario's Sturdy Chestguard";
	attributes = {
		["intellect"] = 1;
		["strength"] = 5;
	};
	Worth = 100;
	UseLength = 30;
	TickUse = false;
	description = "Many sought this very chestpiece as a treasure of fabled times.";
	OnUse = function( _p, equipmentID )
 
		if SERVER then
			
			EquipmentSlots.AddTickingEquipment(  _p:SteamID() , equipmentID )
	
		end
		
	end;
	UseTick = function( _p, lastTick, firstStart )

	end;
	FinishedUse = function( _p , lastTick , firstStart )

	end;
	OnEquip = function( _p )

	end;
	OnDisequip = function( _p )

	end;
})

hook.Add( "InitializeEquipment", "RegisterChestpieces", function( currentEquipment )

	for k , v in pairs( ChestPieces.Database ) do
		
		if EquipmentSlots.ShowDebugPrints then
			
			print("Registering: " .. v.name );

		end
		
		EquipmentSlots.RegisterEquipment( v , 3 );

	end

end )
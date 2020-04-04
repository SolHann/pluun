/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 0237A1A5
/// @DnDArgument : "code" "$(13_10)if(place_meeting(x-hspeed,y,obj_WALL))$(13_10)	{$(13_10)	x += hspeed;$(13_10)	}$(13_10)	$(13_10)	$(13_10)if(place_meeting(x+hspeed,y,obj_WALL))$(13_10)	{$(13_10)	x -= hspeed;$(13_10)	}$(13_10)	$(13_10)	$(13_10)if(other.y < y && !place_free(x,y+vspeed))$(13_10){$(13_10)		move_contact_all(90,8);$(13_10)		vspeed = 0;$(13_10)}$(13_10)$(13_10)$(13_10)if(place_meeting(x,y+vspeed,obj_WALL))$(13_10){$(13_10)	vspeed = 0$(13_10)	move_contact_solid(270,12)$(13_10)}"

if(place_meeting(x-hspeed,y,obj_WALL))
	{
	x += hspeed;
	}
	
	
if(place_meeting(x+hspeed,y,obj_WALL))
	{
	x -= hspeed;
	}
	
	
if(other.y < y && !place_free(x,y+vspeed))
{
		move_contact_all(90,8);
		vspeed = 0;
}


if(place_meeting(x,y+vspeed,obj_WALL))
{
	vspeed = 0
	move_contact_solid(270,12)
}
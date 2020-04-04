
key_right = keyboard_check(vk_right)
key_left = keyboard_check(vk_left)
key_up = keyboard_check(vk_up)
key_down = keyboard_check(vk_down)
key_jump = keyboard_check(vk_space)
key_X_pressed = keyboard_check_pressed(ord("X"))

if (key_right) {facing = "RIGHT"; sprite_index = sPlungoRGT;}
if (key_left) {facing = "LEFT"; sprite_index = sPlungoLFT;}
if (key_up) {facing = "UP"; sprite_index = sPlungoFWD}
if (key_down) {facing = "DOWN"}
if (key_jump && place_meeting(x, y+1, oSolid)) {vsp -= 5;}
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////MOVEMENT AND COLLISIONS/////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///Friction types and gravity presence conditions
if (place_meeting(x, y+1, oSolid)){fric = ground_friction; grav = 0;}
else {fric = 0; grav = world_gravity;}
///Horizontal movement with collision detection
hsp = (key_right - key_left)*msp
hsp += pullx ///Horizontal acceleration
var onepixel = sign(hsp + pullx)
if (place_meeting(x + hsp + pullx - fric*sign(hsp + pullx), y, oSolid))
	{
////move as close as possible
	while(!place_meeting(x+onepixel, y, oSolid))
		{
		x = x + onepixel;
		}
	hsp = 0;
	}
x += hsp - fric*sign(hsp)
///Vertical movement with collision detection	
vsp += grav + pully ///Vertical acceleration
var onepixel = sign(vsp)
if (place_meeting(x, y + vsp + pully, oSolid))
	{
////move as close as possible
	while (!place_meeting(x, y+onepixel, oSolid))
		{
		y = y + onepixel;
		}
	vsp = 0;
	}
y += vsp
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////PLUNGER FIRE AND ROPE CREATION///////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//oLOS SPAWN
if(key_X_pressed) 
	{
	instance_create_layer(oPlayer.x, oPlayer.y, "oLOS_Layer", oLOS);
	}

if(pull_active)
	{
	pullx = (LOSx - x) * 0.01;
	pully = (LOSy - y) * 0.01;
	///Helping to prevent collisions when being pulled by the rope
	var pixelcheck = 5*sign(hsp + pullx)
	if (place_meeting(x+pixelcheck, y, oSolid))
		{
		pullx = 0;
		}
	var pixelcheck = 5*sign(vsp + pully)
	if (place_meeting(x, y+pixelcheck, oSolid))
		{
		pully = 0	
		}
	
	
	}

	

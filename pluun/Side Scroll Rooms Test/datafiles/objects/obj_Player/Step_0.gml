if(place_free(x,y+1)) gravity = 1;
else gravity = 0;
if (keyboard_check(vk_right)) {hspeed = 5; facing = "RIGHT";}
if (keyboard_check(vk_left)) {hspeed = -5; facing = "LEFT";}
if (keyboard_check(vk_up)) {facing = "UP";}

if (!keyboard_check(vk_right) && !keyboard_check(vk_left)) {hspeed = 0;}
if (keyboard_check_pressed(vk_up) && !place_free(x,y+1))
	{
	vspeed = -20;
	}
	
//LOS SPAWN

if(keyboard_check_pressed(ord("X")))
	{
	instance_create_layer(x,y, "oLos_Layer",oLOS);
	}

//HOOK SPAWN- NEEDS CHANGING

if(keyboard_check_released(ord("X")))
	{
	plunger_trig = 0;
	}

if(plunger_trig == 1)
{
	
	mx = LOSx;
	my = LOSy;
	if(place_meeting(mx,my,obj_WALL)){
		active = true;
	}
}

if(active)
{
	gravity = 0.1;
	x += (mx - x) * 0.05;
	y += (my - y) * 0.05;
	
	
}

if(plunger_trig == 0){
	active = false;
}

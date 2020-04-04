///Step event runs this code every frame so this is how we deal with movement and other constant checkups

//Setting DirectionalSprites 

if (keyboard_check(vk_right)) 
	{
	sprite_index = (sPlungoRGT);
	}
if (keyboard_check(vk_left)) 
	{
	sprite_index = (sPlungoLFT);
	}
if (keyboard_check(vk_up)) 
	{
	sprite_index = (sPlungoUP);
	}
if (keyboard_check(vk_down)) 
	{
	sprite_index = (sPlungoDWN);
	}
		

//triggering spring animations

	
if (keyboard_check_pressed(ord("Z")) && facing == "LEFT")
	{
	sprite_index = sPlungoFlingLFT;
	}


if (keyboard_check_pressed(ord("Z")) && facing == "RIGHT")
	{
	sprite_index = sPlungoFlingRGT;
	}

if (keyboard_check_pressed(ord("Z")) && facing == "UP")
	{
	sprite_index = sPlungoFlingUP;
	}

///Moving the player by constantly checking to see if an arrow has been pressed
	
if (keyboard_check(vk_right) && place_free(x+collisionspeed, y)) {x+=movespeed;facing="RIGHT";}
if (keyboard_check_released(vk_right)) {hspeed=0;}
if (keyboard_check(vk_left) && place_free(x-collisionspeed, y)) {x-=movespeed;facing="LEFT";}
if (keyboard_check_released(vk_left)) {hspeed=0;}
if (keyboard_check(vk_up) && place_free(x, y-collisionspeed)) {y-=movespeed;facing="UP";}
if (keyboard_check_released(vk_up)) {vspeed=0;}
if (keyboard_check(vk_down) && place_free(x, y+collisionspeed)) {y+=movespeed;facing="DOWN";}
if (keyboard_check_released(vk_down)) {vspeed=0;}

///PLUNGER BELOW
///Beginning to set up our plunger funcion by clearing variables when z is pressed first
if (keyboard_check_pressed(ord("Z"))) 
	{
	Zx = x;
	Zy = y;
	image_speed = 1;
	charge_steps = 0;
	charge_speed = 0;
	charge_time = 0;
	}
///Creating the notion of charging as Z is held

if (keyboard_check(ord("Z")))
	{
	friction = 2
	x = Zx
	y = Zy
	charge_steps += 1;
	charge_time += delta_time/1000000
	if (charge_time > 1.5) {charge_time=1.5}
	}
///Converting time charged into speed at the release of Z	
if (keyboard_check_released(ord("Z")))
	{
	image_index = 0;
	image_speed = 0;
	friction = 0.5;
	var n;
	var i
	if (facing=="RIGHT")
		{
		///Equations calculating steps spent jumping and n pixels jumped to prevent collision
		hspeed = 4.78*exp(charge_time / 1.5);
		steps_jumped = 4.78*exp(charge_time / 1.5) / friction;
		n = steps_jumped*4.78*exp(charge_time / 1.5) - 0.5*friction*power(steps_jumped,2)
		for (i=1; i<n+2; i+=1)
			{
			if (!place_free(x+i, y))
				{
				hspeed = 0;
				x += i-1;
				break;
				}
			}
		}
	else if (facing=="LEFT")
		{
		hspeed = -4.78*exp(charge_time / 1.5);
		steps_jumped = 4.78*exp(charge_time / 1.5) / friction;
		n = steps_jumped*4.78*exp(charge_time / 1.5) - 0.5*friction*power(steps_jumped,2)
		for (i=1; i<n+2; i+=1)
			{
			if (!place_free(x-i, y))
				{
				hspeed = 0;
				x -= i-1;
				break;
				}
			}
		}
	else if (facing=="UP")
		{
		vspeed = -4.78*exp(charge_time / 1.5);
		steps_jumped = 4.78*exp(charge_time / 1.5) / friction;
		n = steps_jumped*4.78*exp(charge_time / 1.5) - 0.5*friction*power(steps_jumped,2)
		for (i=1; i<n+2; i+=1)
			{
			if (!place_free(x, y-i))
				{
				vspeed = 0;
				y -= i-1;
				break;
				}
			}
		}
	else
		{
		vspeed = 4.78*exp(charge_time / 1.5);
		steps_jumped = 4.78*exp(charge_time / 1.5) / friction;
		n = steps_jumped*4.78*exp(charge_time / 1.5) - 0.5*friction*power(steps_jumped,2)
		for (i=1; i<n+2; i+=1)
			{
			if (!place_free(x, y+i))
				{
				vspeed = 0;
				y += i-1;
				break;
				}
			}
		}
	
	
	}
///Making sure plunger doesnt leave any friction after landing
if (speed==0) {friction=0;}

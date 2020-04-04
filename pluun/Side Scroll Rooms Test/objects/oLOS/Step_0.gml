//Input Variables
key_X_down = keyboard_check(ord("X"))
key_X_released = keyboard_check_released(ord("X"))
//Tracking location with Player variable LOSx and LOSy
oPlayer.LOSx = x
oPlayer.LOSy = y
px_dist = x - oPlayer.x;
py_dist = y - oPlayer.y;
p_distance = sqrt(power(px_dist, 2) + power(py_dist, 2));
cos_angle = dot_product(px_dist, py_dist, 1, 0) / p_distance
if (cos_angle > 1) {cos_angle = 1;}
else if (cos_angle < -1) {cos_angle = -1}
p_angle = arccos(cos_angle)
if (py_dist > 0) {p_angle = -p_angle}
show_debug_message(p_angle)
	
//Moving object according to hsp and vsp
x += hsp;
y += vsp;

//All X button input functions and movement of plunger head 

if (key_X_down)
	{
	oPlayer.line_draw = true
	if(place_meeting(x+hsp, y+vsp, oSolid))
		{
		if (facing == "RIGHT" || facing=="LEFT")
			{
			var onepixel = sign(hsp)
			while (!place_meeting(x+onepixel, y, oSolid))
				{
				x = x + onepixel;
				}
			hsp = 0;
			vsp = 0;
			oPlayer.pull_active = true;
			}
		else 
			{
			var onepixel = sign(vsp)
			while (!place_meeting(x, y+onepixel, oSolid))
				{
				y = y + onepixel;
				}
			hsp = 0;
			vsp = 0;
			oPlayer.pull_active = true;
			}
		}
///////Recognising ID of block plunger is stuck to and moving the plunger along with it////////////////////
	if (facing == "RIGHT" && oPlayer.pull_active)
		{
		var inst;
		var instup;
		var instdown;
		inst = instance_position(x+25, y, oSolid)
		instup = instance_position(x+25, y-5, oSolid)
		instdown = instance_position(x+25, y+4, oSolid)
		if (inst == -4 && instup == -4 && instdown == -4) {vsp = 0; hsp = 0;}
		if (inst != -4) {hsp = (inst).hsp; vsp = (inst).vsp;}
		else if (instup != -4) {hsp = (instup).hsp; vsp = (instup).vsp;}
		else if (instdown != -4) {hsp = (instdown).hsp; vsp = (instdown).vsp;}
		}
	else if (facing == "LEFT" && oPlayer.pull_active)
		{
		var inst;
		var instup;
		var instdown;
		inst = instance_position(x-25, y, oSolid)
		instup = instance_position(x-25, y-5, oSolid)
		instdown = instance_position(x-25, y+4, oSolid)
		if (inst == -4 && instup == -4 && instdown == -4) {vsp = 0; hsp = 0;}
		if (inst != -4) {hsp = (inst).hsp; vsp = (inst).vsp;}
		else if (instup != -4) {hsp = (instup).hsp; vsp = (instup).vsp;}
		else if (instdown != -4) {hsp = (instdown).hsp; vsp = (instdown).vsp;}
		}
	else if (facing == "DOWN" && oPlayer.pull_active)
		{
		var inst;
		var instright;
		var instleft;
		inst = instance_position(x, y+25, oSolid)
		instright = instance_position(x+5, y+25, oSolid)
		instleft = instance_position(x-4, y+25, oSolid)
		if (inst == -4 && instright == -4 && instleft == -4) {vsp = 0; hsp = 0}
		if (inst != -4) {hsp = (inst).hsp; vsp = (inst).vsp;}
		else if (instright != -4) {hsp = (instright).hsp; vsp = (instright).vsp;}
		else if (instleft != -4) {hsp = (instleft).hsp; vsp = (instleft).vsp;}
		}	
	else if (facing == "UP" && oPlayer.pull_active)
		{
		var inst;
		var instright;
		var instleft;
		inst = instance_position(x, y-25, oSolid)
		instright = instance_position(x+5, y-25, oSolid)
		instleft = instance_position(x-4, y-25, oSolid)
		if (inst == -4 && instright == -4 && instleft == -4) {vsp = 0; hsp = 0}
		if (inst != -4) {hsp = (inst).hsp; vsp = (inst).vsp;}
		else if (instright != -4) {hsp = (instright).hsp; vsp = (instright).vsp;}
		else if (instleft != -4) {hsp = (instleft).hsp; vsp = (instleft).vsp;}
		}	
		
///////////////////////////////////////////////////////////////////////////////////////////////////
	}
///////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////RETURNING PLUNGER WHEN X RELEASED OR MAX DISTANCE REACHED/////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////
if (key_X_released)
	{
	oPlayer.pull_active = false
	returning = true
	oPlayer.pullx = 0
	oPlayer.pully = 0
	}

if (p_distance >= max_distance) {returning = true}

if (returning == true)
	{
	oPlayer.pull_active = false;
	hsp = -msp*cos(p_angle);
	vsp = msp*sin(p_angle);
	if (p_distance <= msp)
		{
		returning = false
		instance_destroy(oLOS)
		oPlayer.line_draw = false;
		oPlayer.pullx = 0;
		oPlayer.pully = 0;
		}
	}
	
	
	
	
	
	
	
	
	
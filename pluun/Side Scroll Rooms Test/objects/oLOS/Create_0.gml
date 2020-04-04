//oLOS Create
msp = 20
hsp = 0
vsp = 0
facing = "RIGHT"
returning = false
max_distance = 224

if(oPlayer.facing == "LEFT") {facing = "LEFT"; hsp = -msp; vsp = 0; sprite_index = sPlungerLFT;}
if(oPlayer.facing == "RIGHT") {facing = "RIGHT"; hsp = msp; vsp = 0; sprite_index = sPlungerRGT;}
if(oPlayer.facing == "UP") {facing = "UP"; vsp = -msp; hsp = 0; sprite_index = sPlungerUP;}
if(oPlayer.facing == "DOWN") {facing = "DOWN"; vsp = msp; hsp = 0; sprite_index = sPlungerDWN}
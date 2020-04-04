x += hsp
y += vsp

step_count += 1
if (step_count < (period*room_speed)/2){hsp = 1}
else if (step_count >= (period*room_speed)/2){hsp = -1}
if (step_count == (period*room_speed - 1)){step_count = 0}
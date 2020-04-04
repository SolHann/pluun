/// @DnDAction : YoYo Games.Common.Execute_Code
/// @DnDVersion : 1
/// @DnDHash : 6A0AFA05
/// @DnDArgument : "code" "image_alpha -= fadespeed;$(13_10)$(13_10)if (image_alpha	<= 0)$(13_10)	instance_destroy();"
image_alpha -= fadespeed;

if (image_alpha	<= 0)
	instance_destroy();
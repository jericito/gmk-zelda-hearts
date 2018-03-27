//----------------------------------------------------------------------------------------------
//position variables
// this makes sure width is the width of the gui
var width = display_get_gui_width()
// xx = width - 26 * 10 we have 10 hearts per row each heart is 32 pixels wide and we want a space between each heart
//so width is the edge of the screen - 26 pixels * 10 this gives us the starting position for the first heart
var xx = width - 26 * 10
//32 pixels from the top of the screen
var yy = 32
//increment variables
// x increment for empty hearts we increment ix 26 pixels every repeat
var xEmpty = 0
// y increment for empty hearts we only increment iy when the hearts are == to 10 but we wont see its effect until we have more than 10 hearts
var yEmpty = 0
// same as above but for the full hearts of the hearts
var xFull = 0
var yFull = 0
var xHalf = 0
var yHalf = 0
//maxhp can't go lower than 3 and max hp can't go higher than 20
oPlayer.maxhp = clamp(oPlayer.maxhp, 6, 40)
//hearts cant go lower than 0 or higher then maxhp
oPlayer.hp = clamp(oPlayer.hp, 0, oPlayer.maxhp)
//-----------------------------------------------------------------------------------------------

//draw_text
draw_set_colour(c_white)
draw_text(width - 26 * 10 / 2, 0, "-Life-")
draw_set_halign(fa_center)

repeat (oPlayer.maxhp/2)
{
	if (xEmpty == 26 * 10)
	{
		yEmpty = 26;
		xEmpty = 0;
	}
	
	draw_sprite(sHeartEmpty, 0, xx + xEmpty, yy + yEmpty);
	xEmpty += 26;
}

repeat (floor(oPlayer.hp/2) + frac(oPlayer.hp/2) * 2)
{
	if xHalf > 26 * 10
	{
		yHalf = 26;
		xHalf = 0;
	}
	draw_sprite(sHeartHalf, 0, xx + xHalf, yy + yHalf)
	xHalf += 26;
}

repeat (floor(oPlayer.hp/2))
{
	if (xFull >= 26 * 10)
	{
		yFull = 26;
		xFull = 0;
	}
	draw_sprite(sHeartFull, 0, xx + xFull, yy + yFull)
	xFull += 26;
	
}


//------------------------------------------------------------------------------------------------


with (oPlayer)
{
if keyboard_check_pressed(ord("A"))
{
    hp -= 1
}
if keyboard_check_pressed(ord("D"))
{
    hp += 1
}
if keyboard_check_pressed(ord("W"))
{
    maxhp += 2
}
if keyboard_check_pressed(ord("S"))
{
    maxhp -= 2
}
}

//half hp
//maxhp would = 40
//hp would be even numbers
//hphalf would be odd numbers
//hpfullhearts floor(oPlayer.hp/2)
//odds oPlayer.hp/2 + frac(oPlayer.hp/2) * 2
//maxhp is maxhp / 2 but we have to make sure and add 2 for every full heart we add or remove 2 maxhp for every full heart we remove
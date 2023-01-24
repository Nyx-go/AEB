//dynamic height
var _new_w = 0;
for (var i = 0 ; i < array_length(option) ; i++ ) {
	var _op_w = string_width(option[i]);
	_new_w = max (_new_w , _op_w) ;
}
width = _new_w + 2*op_border;
height = op_border*2 + (string_height(option[0]) + 1) + (op_length-1)*op_space;

draw_set_font(f_arial_big);

//draw menu background
draw_sprite_ext(sprite_index , image_index , x+width/2 , y+height/2 , width/sprite_width , height/sprite_height , 0 , c_white , 1);

//draw the options
draw_set_valign(fa_top);
draw_set_halign(fa_left);

for (var i = 0 ; i < op_length ; i++ ) {
	var _c = c_white ;
	if pos == i {_c = c_black };
	draw_text_color(x+op_border, y+op_border + op_space*i , option[i] , _c , _c , _c , _c , 1);
}


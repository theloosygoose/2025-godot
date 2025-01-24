shader_type canvas_item;

uniform bool is_hover = false;

void vertex() {
	if (is_hover){
		VERTEX.xy += sin((TIME*0.09) * (VERTEX.y * 0.5)) + sin((TIME * 0.1)*VERTEX.x * 1.5);
	}
}

void fragment() {
    COLOR.r = 0.2;

	if (is_hover){
		COLOR.r = sin(1.0 * TIME);
	}
}

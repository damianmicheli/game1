/// @description Inserte aquí la descripción
// Puede escribir su código en este editor
if (hp <= 0) {
	with(instance_create_layer(x, y, layer, oDead)) {
	
		direction = other.hitfrom;
		hsp = lengthdir_x(3, direction);
		vsp = lengthdir_y(3, direction)-2;	
		if (hsp < 0) image_xscale = -1;
	}
	instance_destroy();
}
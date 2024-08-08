// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
/// @desc SlideTransition(mode, targetroom)
/// @arg mode sets transition mode between next, restart and goto.
/// @arg targetroom sets target room when using the goto mode.
	with (oTransition){
	mode = argument[0];
	if(argument_count > 1) target = argument[1];

}

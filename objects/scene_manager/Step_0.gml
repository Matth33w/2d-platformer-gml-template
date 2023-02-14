if(!audio_is_playing(musicIntro) && !musicLoopStarted) {
	audio_play_sound(musicLoop, 1, true);
	musicLoopStarted = true;
}

if(cameraTarget != noone) {
	if(cameraMoveX) {
		camera_set_view_pos(view_camera[0], cameraTarget.x - camera_get_view_width(view_camera[0]) / 2 + cameraXOffset, camera_get_view_y(view_camera[0]));
	}
	
	if(cameraMoveY) {
		camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), cameraTarget.y - camera_get_view_height(view_camera[0]) / 2 + cameraYOffset);
	}
}

if(camera_get_view_x(view_camera[0]) < 0) {
	camera_set_view_pos(view_camera[0], 0, camera_get_view_y(view_camera[0]));
}

if(camera_get_view_y(view_camera[0]) < 0) {
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), 0);
}

if(camera_get_view_x(view_camera[0]) > room_width - camera_get_view_width(view_camera[0])) {
	camera_set_view_pos(view_camera[0], room_width - camera_get_view_width(view_camera[0]), camera_get_view_y(view_camera[0]));
}

if(camera_get_view_y(view_camera[0]) > room_height - camera_get_view_height(view_camera[0])) {
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), room_height - camera_get_view_height(view_camera[0]));
}
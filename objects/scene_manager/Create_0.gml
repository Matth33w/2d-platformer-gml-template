musicLoopStarted = false;

audio_stop_all();
audio_play_sound(musicIntro, 1, false);

// if it is a negative number, set initial position to the target
if(cameraInitialX > -1) {
	camera_set_view_pos(view_camera[0], cameraInitialX + cameraXOffset, camera_get_view_y(view_camera[0]));
} else {
	camera_set_view_pos(view_camera[0], cameraTarget.x - camera_get_view_width(view_camera[0]) / 2 + cameraXOffset, camera_get_view_y(view_camera[0]));
}

if(cameraInitialY > -1) {
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), cameraInitialY + cameraYOffset);
} else {
	camera_set_view_pos(view_camera[0], camera_get_view_x(view_camera[0]), cameraTarget.y - camera_get_view_height(view_camera[0]) / 2 + cameraYOffset);
}
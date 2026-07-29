var player

func scene():
	return get_tree().current_scene

func tick():
	return Time.get_ticks_msec()

func play(sound_name):
	var sound = AudioStreamPlayer.new()
	sound.process_mode = Node.PROCESS_MODE_ALWAYS
	sound.stream = load('res://sounds/%s.mp3' % sound_name)
	sound.volume_linear = 0.5
	if sound_name == 'swish':
		sound.pitch_scale = 0.85
	get_tree().current_scene.add_child(sound)
	sound.play.call_deferred()
	await sound.finished
	sound.queue_free()

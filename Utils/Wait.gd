extends Node

func delay_call(_method:Callable, _delay:float, _args:Array = []):
	var timer:Timer = Timer.new()
	timer.one_shot = true
	add_child(timer)
	timer.connect("timeout", on_timeout, [timer, _method, _args])
	timer.start(_delay)


func on_timeout(timer:Timer, callback:Callable, params:Array = []):
	timer.queue_free()
	
	var size:int = params.size()
	if(size == 0):
		callback.call()
	elif(size == 1):
		callback.call(params[0])
	elif(size == 2):
		callback.call(params[0], params[1])
	elif(size == 3):
		callback.call(params[0], params[1], params[2])
	elif(size == 4):
		callback.call(params[0], params[1], params[2], params[3])

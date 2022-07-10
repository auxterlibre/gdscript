extends Node

signal game_started

const EVT_GAME_STARTED:String = "game_started"

func add_listener(listener:Object, evt:String, method:Callable, params:Array = []):
	var error = listener.connect(evt, method, params)
	if error > 0:
		print("SIGNAL CONNECTION ERROR  (%s) : Event: %s  Target: %s   Method: %s " % [error, evt, listener.name, method])


func remove_listener(listener:Object, evt:String, method:Callable):
	if listener.is_connected(evt, method):
		listener.disconnect(evt, method)

#Add as many parameters as necessary
func send_signal(evt:String, param1 = null, param2 = null, param3 = null):
	if param1 == null:
		emit_signal(evt)
	elif param2 == null:
		emit_signal(evt, param1)
	elif param3 == null:
		emit_signal(evt, param1, param2)
	else:
		emit_signal(evt, param1, param2, param3)

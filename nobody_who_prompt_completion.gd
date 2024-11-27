extends NobodyWhoPromptChat

var phrase : String
@onready var label = $"../Label"
@onready var edit = $"../TextEdit"


var c : int = 0
func _ready() -> void:
	print("starting")
	phrase = ""
	run()

func _on_completion_updated(text) -> void:
	if text == "<end_of_turn>":
		return
	phrase += text
	
	if(c==0):
		label.text = text
	else:
		label.text += text
	#if(c%3 ==0):
	#	label.text="I'm Thinking . "
	#if(c%3 == 1):
	#	label.text="I'm Thinking . ."
	#if(c%3 == 2):
	#	label.text="I'm Thinking . . ."
	c+=1

func _on_completion_finished() -> void:
	print(phrase)
	print("MODEL FINISHED")
	#label.text = phrase
	#say("Interesting... Tell me more.")


func _on_button_pressed() -> void:
	label.text = ""
	var prompt_text = edit.text
	say(prompt_text)
	pass # Replace with function body.

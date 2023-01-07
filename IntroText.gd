extends Control

@onready var label = $HBoxContainer/dialogue/Label
var dialogue_counter = 0
var text_tween: Tween = null
const dialogues = [
	'You arrive at Redbrick, a quiet village in the remote region of Valthar.',
	'No one knows what secrets lie within the town\'s old limestone tower...'
]

# Called when the node enters the scene tree for the first time.
func _ready():
	show_next_dialogue()
		
func _process(_delta):
	if Input.is_action_just_pressed("mouse_button"):
		if (dialogue_counter < dialogues.size()):
			show_next_dialogue()
		else:
			queue_free()

func show_next_dialogue():
	if text_tween:
		text_tween.kill()
	text_tween = create_tween()
	label.text = dialogues[dialogue_counter]
	label.visible_ratio = 0
	text_tween.tween_property(label, 'visible_ratio', 1, 1)
	dialogue_counter = dialogue_counter + 1	

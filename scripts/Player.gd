extends KinematicBody2D

const MOVE_SPEED = 180
export (int) var JUMP_FORCE = 500
const GRAVITY = 20
const MAX_FALL_SPEED = 200

onready var sprite = $Sprite
onready var anim = $AnimationPlayer
onready var footstep = $Footstep

onready var coyote_timer = $Coyote
onready var remb_jump_timer = $RememberJump
 
var y_vel = 0
var facing_right = false
var can_jump = true
var jump_was_pressed = false

func _process(delta):
	var move_dir = 0
	var was_grounded = is_on_floor()
	
	# Movement
	if Input.is_action_pressed("movement_right"):
		if was_grounded:
			anim.play("player.walk")
		move_dir += 1
	if Input.is_action_pressed("movement_left"):
		if was_grounded:
			anim.play("player.walk")
		move_dir -= 1

	move_and_slide(Vector2(move_dir * MOVE_SPEED, y_vel), Vector2(0, -1))
	var grounded = is_on_floor() 

	y_vel += GRAVITY
	
	if was_grounded:
		can_jump = true
		
	if Input.is_action_just_pressed("movement_jump"):
		jump()

	if Input.is_action_just_released("movement_jump"):
		jump_cut()
	
	if was_grounded and !grounded:
		coyote_time()
		
	if was_grounded and y_vel >= 5:
		y_vel = 5
		
	if y_vel > MAX_FALL_SPEED:
		y_vel = MAX_FALL_SPEED

func jump():	
	jump_was_pressed = true
	remember_jump_time()
	if can_jump:
		anim.play("player.jump")
		y_vel = -JUMP_FORCE

func jump_cut():
	if y_vel < -100:
		y_vel = -100

func remember_jump_time():
	remb_jump_timer.start()
	pass

func _on_RememberJump_timeout():
	jump_was_pressed = false;
	pass

func coyote_time():
	coyote_timer.start()
	pass

func _on_Coyote_timeout():
	can_jump = false;
	pass

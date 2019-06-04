extends RigidBody2D

var physicsTestBodyTest = preload("res://PhysicsBodyTest.tscn")

var bodies = []
var freedOne = false

func _ready():
	for i in range(10):
		bodies.append(physicsTestBodyTest.instance())
		#add_child(bodies.back())
	
func _process(delta):
	yield(get_tree().create_timer(.5), "timeout")
	for body in bodies:
		remove_collision_exception_with(body)
	
func _physics_process(delta):
	yield(get_tree().create_timer(.1), "timeout")
	var bodyIndex = rand_range(0, bodies.size())
	
	if !freedOne:
		bodies[bodyIndex].queue_free()
		freedOne = true


func _on_QueueFreeCrasheTest_body_entered(body):
	add_collision_exception_with(body)
	body.queue_free()

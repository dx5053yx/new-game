extends CharacterBody2D


const kecepatan = 100.0
var arah

func _physics_process(delta):
	gerak(delta)

func gerak(_delta):
	if Input.is_action_pressed("kanan"):
		arah ="kanan"
		arah_player(true)
		velocity.x = kecepatan
		velocity.y = 0
	elif Input.is_action_pressed("kiri"):
		arah="kiri"
		arah_player(true)
		velocity.x = -kecepatan
		velocity.y = 0
	elif Input.is_action_pressed("bawah"):
		arah="bawah"
		arah_player(true)
		velocity.x = 0
		velocity.y = kecepatan
	elif Input.is_action_pressed("atas"):
		arah="atas"
		arah_player(true)
		velocity.x = 0
		velocity.y = -kecepatan
	elif Input.is_action_pressed("serang"):
		var serangan = arah
		if serangan == "kanan" or serangan == "kiri":
			arah = "serang"
			arah_player(true)
			velocity.x = 0
			velocity.y = 0
		elif serangan == "atas":
			arah = "serang3"
			arah_player(true)
			velocity.x = 0
			velocity.y = 0
		elif serangan == "bawah":
			arah = "serang2"
			arah_player(true)
			velocity.x = 0
			velocity.y = 0		
	else:
		arah_player(false)
		velocity.x = 0
		velocity.y = 0


func arah_player(gerak):
	var arah_sekarang = arah
	var animasi = $AnimatedSprite2D
	
	if arah_sekarang == "kanan":
		animasi.flip_h = false
		if gerak:
			animasi.play("kanan")
		else:
			animasi.play("diamK")
	elif arah_sekarang == "kiri":
		animasi.flip_h = true
		if gerak:
			animasi.play("kanan")
		else:
			animasi.play("diamK")
	elif arah_sekarang == "atas":
		if gerak:
			animasi.play("atas")
		else:
			animasi.play("diamB")
	elif arah_sekarang == "bawah":
		if gerak:
			animasi.play("bawah")
		else:
			animasi.play("diam")
	elif arah_sekarang == "serang":
		if gerak:
			animasi.play("serang1")
		else:
			animasi.play("diamK")
	elif arah_sekarang == "serang2":
		if gerak:
			animasi.play("serang2")
		else:
			animasi.play("diam")
	elif arah_sekarang == "serang3":
		if gerak:
			animasi.play("serang3")
		else:
			animasi.play("diamB")

	move_and_slide()

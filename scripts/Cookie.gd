extends Node

@onready var clickCookieSound = $cookieClick

func _on_cookie_button_pressed():
	clickCookieSound.play()
	GLOBAL.change_coin(1*GLOBAL.cpc,GLOBAL.Type.USER)

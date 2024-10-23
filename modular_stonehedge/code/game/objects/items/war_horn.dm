/obj/item/war_horn
	name = "generic war horn"
	desc = "Used to coordiante troops in the field."
	icon = 'modular_stonehedge/icons/obj/items/warhorns.dmi'
	icon_state = "humanhorn"
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_NECK
	w_class = WEIGHT_CLASS_NORMAL
	possible_item_intents = list(/datum/intent/war_horn/retreat, /datum/intent/war_horn/rally, /datum/intent/war_horn/hold, /datum/intent/war_horn/charge)
	var/retreatsound = 'modular_hearthstone/sound/items/bogguardhorn.ogg'
	var/rallysound = 'modular_hearthstone/sound/items/watchhorn.ogg'
	var/holdsound = 'modular_hearthstone/sound/items/rghorn.ogg'
	var/chargesound = 'modular_hearthstone/sound/items/signalhorn.ogg'
	var/farretreatsound = 'modular_hearthstone/sound/items/bogguardhorn.ogg'
	var/farrallysound = 'modular_hearthstone/sound/items/watchhorn.ogg'
	var/farholdsound = 'modular_hearthstone/sound/items/rghorn.ogg'
	var/farchargesound = 'modular_hearthstone/sound/items/signalhorn.ogg'
	var/hornchannel

//someone has to get a 4th sound for each and missing distant sounds.

/obj/item/war_horn/human
	name = "humenic war horn"
	icon_state = "humanhorn"
	retreatsound = 'modular_stonehedge/sound/items/human 1.ogg'
	rallysound = 'modular_stonehedge/sound/items/human 2.ogg'
	holdsound = 'modular_stonehedge/sound/items/human 2.ogg'
	chargesound = 'modular_stonehedge/sound/items/human 3.ogg'
	farretreatsound = 'modular_stonehedge/sound/items/human 1 distant.ogg'
	farrallysound = 'modular_stonehedge/sound/items/human 2 distant.ogg'
	farholdsound = 'modular_stonehedge/sound/items/human 2 distant.ogg'
	farchargesound = 'modular_stonehedge/sound/items/human 3.ogg'

/obj/item/war_horn/orc
	name = "Orcish war horn"
	icon_state = "orchorn"
	retreatsound = 'modular_stonehedge/sound/items/orc 1.ogg'
	rallysound = 'modular_stonehedge/sound/items/orc 2.ogg'
	holdsound = 'modular_stonehedge/sound/items/orc 2.ogg'
	chargesound = 'modular_stonehedge/sound/items/orc 3.ogg'
	farretreatsound = 'modular_stonehedge/sound/items/orc 1 distant.ogg'
	farrallysound = 'modular_stonehedge/sound/items/orc 2 distant.ogg'
	farholdsound = 'modular_stonehedge/sound/items/orc 2 distant.ogg'
	farchargesound = 'modular_stonehedge/sound/items/orc 3.ogg'

/datum/intent/war_horn
	attack_verb = list("hit", "strike")
	item_d_type = "blunt"
	chargetime = 0
	swingdelay = 0

/datum/intent/war_horn/retreat
	name = "retreat"
	icon_state = "inretreat"

/datum/intent/war_horn/rally
	name = "rally"
	icon_state = "inrally"

/datum/intent/war_horn/hold
	name = "hold"
	icon_state = "inhold"

/datum/intent/war_horn/charge
	name = "charge"
	icon_state = "incharge"

/obj/item/war_horn/attack_self(mob/living/user)
	. = ..()
	user.visible_message(span_warning("[user] is about to sound the [src]!"))
	if(do_after(user, 15))
		sound_horn(user, user.a_intent)

/obj/item/war_horn/proc/sound_horn(mob/living/user, datum/intent)
	user.stop_sound_channel(hornchannel)
	hornchannel = SSsounds.random_available_channel()
	user.visible_message(span_warning("[user] sounds the horn!"))
	if(intent.type == /datum/intent/war_horn/retreat) //retreat
		playsound(src, retreatsound, 100, TRUE, channel = hornchannel)
	if(intent.type == /datum/intent/war_horn/rally) //rally here
		playsound(src, rallysound, 100, TRUE, channel = hornchannel)
	if(intent.type == /datum/intent/war_horn/hold) //hold
		playsound(src, holdsound, 100, TRUE, channel = hornchannel)
	if(intent.type == /datum/intent/war_horn/charge) //charge
		playsound(src, chargesound, 100, TRUE, channel = hornchannel)

	var/turf/origin_turf = get_turf(src)
	for(var/mob/living/player in GLOB.player_list)
		if(player.stat == DEAD)
			continue
		if(isbrain(player))
			continue

		var/distance = get_dist(player, origin_turf)
		if(distance <= 7)
			if(player.faction[1] in user.faction)
				to_chat(player, span_warning("[user] signals to [user.a_intent]!"))
			continue
		var/dirtext = " to the "
		var/direction = get_dir(player, origin_turf)
		switch(direction)
			if(NORTH)
				dirtext += "north"
			if(SOUTH)
				dirtext += "south"
			if(EAST)
				dirtext += "east"
			if(WEST)
				dirtext += "west"
			if(NORTHWEST)
				dirtext += "northwest"
			if(NORTHEAST)
				dirtext += "northeast"
			if(SOUTHWEST)
				dirtext += "southwest"
			if(SOUTHEAST)
				dirtext += "southeast"
			else //Where ARE you.
				dirtext = ", although I cannot make out a direction"
		var/disttext
		switch(distance)
			if(0 to 20)
				disttext = " very close"
			if(20 to 40)
				disttext = " close"
			if(40 to 80)
				disttext = ""
			if(80 to 160)
				disttext = " far"
			else
				disttext = " very far"
		//sound played for other players
		player.stop_sound_channel(hornchannel)
		var/soundtouse
		if(intent.type == /datum/intent/war_horn/retreat)
			if(distance < 80)
				soundtouse = retreatsound
			else
				soundtouse = farretreatsound
		if(intent.type == /datum/intent/war_horn/rally)
			if(distance < 80)
				soundtouse = rallysound
			else
				soundtouse = farrallysound
		if(intent.type == /datum/intent/war_horn/hold)
			if(distance < 80)
				soundtouse = holdsound
			else
				soundtouse = farholdsound
		if(intent.type == /datum/intent/war_horn/charge)
			if(distance < 80)
				soundtouse = chargesound
			else
				soundtouse = farchargesound
		if(player.faction[1] in user.faction) //first is probably their primary.
			to_chat(player, span_warning("I hear the signal to [user.a_intent.name] somewhere[disttext][dirtext]!"))
		else
			to_chat(player, span_warning("I hear a foreign signal somewhere[disttext][dirtext]!"))
		player.playsound_local(get_turf(player), soundtouse, 50, FALSE, pressure_affected = FALSE, channel = hornchannel)

//A spell to choose new spells, upon spawning or gaining levels
/obj/effect/proc_holder/spell/invoked/learnspell
	name = "Attempt to learn a new spell"
	desc = "Weave a new spell"
	school = "transmutation"
	overlay_state = "book1"
	chargedrain = 0
	chargetime = 0

/obj/effect/proc_holder/spell/invoked/learnspell/cast(list/targets, mob/user = usr)
	. = ..()
	//list of spells you can learn, it may be good to move this somewhere else eventually
	//TODO: make GLOB list of spells, give them a true/false tag for learning, run through that list to generate choices
	var/list/choices = list()
	var/list/spell_choices = list(/obj/effect/proc_holder/spell/invoked/projectile/fireball,
		/obj/effect/proc_holder/spell/invoked/projectile/lightningbolt,
		/obj/effect/proc_holder/spell/invoked/projectile/eldritchblast5e,
		/obj/effect/proc_holder/spell/invoked/projectile/fetch,
		/obj/effect/proc_holder/spell/invoked/projectile/spitfire,
		/obj/effect/proc_holder/spell/invoked/projectile/firebolt5e,
		/obj/effect/proc_holder/spell/invoked/projectile/rayoffrost5e,
		/obj/effect/proc_holder/spell/invoked/projectile/acidsplash5e,
		/obj/effect/proc_holder/spell/invoked/forcewall_weak,
		/obj/effect/proc_holder/spell/invoked/slowdown_spell_aoe,
		/obj/effect/proc_holder/spell/invoked/message,
		/obj/effect/proc_holder/spell/invoked/push_spell,
		/obj/effect/proc_holder/spell/invoked/longjump,
		/obj/effect/proc_holder/spell/invoked/blade_burst,
	//	/obj/effect/proc_holder/spell/invoked/boomingblade5e,
		/obj/effect/proc_holder/spell/invoked/arcyne_storm,
		/obj/effect/proc_holder/spell/invoked/frostbite5e,
		/obj/effect/proc_holder/spell/invoked/poisonspray5e,
		/obj/effect/proc_holder/spell/invoked/greenflameblade5e,
		/obj/effect/proc_holder/spell/invoked/chilltouch5e,
		/obj/effect/proc_holder/spell/invoked/infestation5e,
		/obj/effect/proc_holder/spell/invoked/magicstone5e,
		/obj/effect/proc_holder/spell/invoked/mending5e,
	//	/obj/effect/proc_holder/spell/invoked/decompose5e,
		/obj/effect/proc_holder/spell/aoe_turf/conjure/Wolf,
		/obj/effect/proc_holder/spell/targeted/encodethoughts5e,
		/obj/effect/proc_holder/spell/invoked/mindsliver5e,
		/obj/effect/proc_holder/spell/targeted/guidance5e,
		/obj/effect/proc_holder/spell/targeted/lightninglure5e,
		/obj/effect/proc_holder/spell/self/light5e,
		/obj/effect/proc_holder/spell/self/bladeward5e,
		/obj/effect/proc_holder/spell/aoe_turf/conjure/createbonfire5e,
	)
	for(var/i = 1, i <= spell_choices.len, i++)
		choices["[spell_choices[i].name]: [spell_choices[i].cost]"] = spell_choices[i]
		
	var/choice = input("Choose a spell, points left: [user.mind.spell_points - user.mind.used_spell_points]") as null|anything in choices
	var/obj/effect/proc_holder/spell/item = choices[choice]
	if(!item)
		return     // user canceled; 
	for(var/obj/effect/proc_holder/spell/knownspell in user.mind.spell_list)
		if(knownspell.type == item.type)
			to_chat(user,span_warning("You already know this one!"))
			return	//already know the spell
	if(item.cost > user.mind.spell_points - user.mind.used_spell_points)
		to_chat(user,span_warning("You do not have enough experience to create a new spell"))
		return		// not enough spell points
	else
		user.mind.used_spell_points += item.cost
		user.mind.AddSpell(new item)


//forcewall
/obj/effect/proc_holder/spell/invoked/forcewall_weak
	name = "Forcewall"
	desc = "Conjure a wall of Arcyne force,  preventing anyone and anything other than you from moving"
	school = "transmutation"
	releasedrain = 30
	chargedrain = 1
	chargetime = 15
	charge_max = 35 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	clothes_req = FALSE
	active = FALSE
	sound = 'sound/blank.ogg'
	overlay_state = "forcewall"
	range = -1
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	var/wall_type = /obj/structure/forcefield_weak/caster
	xp_gain = TRUE
	cost = 1

//adapted from forcefields.dm, this needs to be destructible
/obj/structure/forcefield_weak
	desc = "A wall of pure arcyne force."
	name = "Arcyne Wall"
	icon = 'icons/effects/effects.dmi'
	icon_state = "m_shield"
	break_sound = 'sound/combat/hits/onstone/stonedeath.ogg'
	attacked_sound = list('sound/combat/hits/onstone/wallhit.ogg', 'sound/combat/hits/onstone/wallhit2.ogg', 'sound/combat/hits/onstone/wallhit3.ogg')
	opacity = 0
	density = TRUE
	max_integrity = 80	
	CanAtmosPass = ATMOS_PASS_DENSITY
	var/timeleft = 20 SECONDS  

/obj/structure/forcefield_weak/Initialize()
	. = ..()
	if(timeleft)
		QDEL_IN(src, timeleft) //delete after it runs out

/obj/effect/proc_holder/spell/invoked/forcewall_weak/cast(list/targets,mob/user = usr)
	new wall_type(get_turf(user),user)
	if(user.dir == SOUTH || user.dir == NORTH)
		new wall_type(get_step(user, EAST),user)
		new wall_type(get_step(user, WEST),user)
	else
		new wall_type(get_step(user, NORTH),user)
		new wall_type(get_step(user, SOUTH),user)
	return TRUE

/obj/structure/forcefield_weak
	var/mob/caster

/obj/structure/forcefield_weak/caster/Initialize(mapload, mob/summoner)
	. = ..()
	caster = summoner

/obj/structure/forcefield_weak/caster/CanPass(atom/movable/mover, turf/target)	//only the caster can move through this freely
	if(mover == caster)		
		return TRUE
	if(ismob(mover))
		var/mob/M = mover
		if(M.anti_magic_check(chargecost = 0))
			return TRUE
	return FALSE

/obj/effect/proc_holder/spell/invoked/message
	name = "Message"
	desc = "Latch onto the mind of one who is familair to you, whispering a message into their head"
	cost = 1
	xp_gain = TRUE
	releasedrain = 30
	chargedrain = 1
	chargetime = 30
	charge_max = 60 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	overlay_state = "message"

/obj/effect/proc_holder/spell/invoked/message/cast(list/targets, mob/user)
	. = ..()
	var/input = stripped_input(user, "Who are you trying to contact?")
	if(!input)
		return
	if(!user.key)
		to_chat(user, span_warning("I sense a body, but the mind does not seem to be there."))
		revert_cast()	//if the spell fails, cooldown is reset (waiting 1 minute cause your bad at spelling sux)
		return
	if(!user.mind || !user.mind.do_i_know(name=input))
		to_chat(user, span_warning("I don't know anyone by that name."))
		revert_cast()
		return
	for(var/mob/living/carbon/human/HL in GLOB.human_list)
		if(HL.real_name == input)
			var/message = stripped_input(user, "You make a connection. What are you trying to say?")
			if(!message)
				return
			to_chat(HL, "Arcyne whispers fill the back of my head, resolving into a clear, if distant, voice: </span><font color=#7246ff>\"[message]\"</font>")
			log_game("[key_name(user)] sent a message to [key_name(HL)] with contents [message]")
			// maybe an option to return a message, here?
			return TRUE
	to_chat(user, span_warning("I seek a mental connection, but can't find [input]."))
	revert_cast()
	
/obj/effect/proc_holder/spell/invoked/push_spell
	name = "Repulse"
	desc = "Conjure forth a wave of energy, repelling anyone directly in front of you"
	cost = 1
	xp_gain = TRUE
	releasedrain = 40
	chargedrain = 1
	chargetime = 20
	charge_max = 25 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	overlay_state = "placeholder"

/obj/effect/proc_holder/spell/invoked/push_spell/cast(list/targets, mob/user)	
	var/turf/lower_left
	var/turf/upper_right
	switch(user.dir)
		if(NORTH)
			lower_left = locate(user.x - 1, user.y + 1, user.z)
			upper_right = locate(user.x + 1, user.y + 1, user.z)
		if(SOUTH)
			lower_left = locate(user.x - 1, user.y - 1, user.z)
			upper_right = locate(user.x + 1, user.y - 1, user.z)
		if(WEST)
			lower_left = locate(user.x - 1, user.y - 1, user.z)
			upper_right = locate(user.x - 1, user.y + 1, user.z)
		if(EAST)
			lower_left = locate(user.x + 1, user.y - 1, user.z)
			upper_right = locate(user.x + 1, user.y + 1, user.z)
	
	var/list/things_to_throw = list()
	for(var/turf/affected_tile in block(lower_left, upper_right)) //everything in the 3x1 block is found.
		affected_tile.Shake_turf(duration = 0.5 SECONDS)
		for(var/atom/movable/affected as anything in affected_tile)
			if(!ishuman(affected) && !istype(affected, /obj/item))
				affected.Shake(duration = 0.5 SECONDS)
				continue
			if(ishuman(affected))
				var/mob/living/carbon/human/H = affected
				if(H.stat == DEAD)
					continue
				H.apply_effects(2 SECONDS, 2 SECONDS)
				shake_camera(H, 2, 1)
			things_to_throw += affected

	for(var/atom/movable/affected as anything in things_to_throw)
		var/throwlocation = affected.loc
		for(var/x in 1 to 6)
			throwlocation = get_step(throwlocation, user.dir)
		affected.throw_at(throwlocation, 3, 1, user, TRUE)
	user.visible_message(span_warning("[user] conjures forth a wave of force, repelling anything in front of [user.p_them()]!"))
	playsound(user,'sound/magic/swap.ogg', 75, TRUE)
	return TRUE

/turf/proc/Shake_turf(pixelshiftx = 2, pixelshifty = 2, duration = 2.5 SECONDS, shake_interval = 0.02 SECONDS)	//Atom/shake() does not work on turfs, this may be better off moved to HELPERS?
	var/initialpixelx = pixel_x
	var/initialpixely = pixel_y
	animate(src, pixel_x = initialpixelx + rand(-pixelshiftx,pixelshiftx), pixel_y = initialpixelx + rand(-pixelshifty,pixelshifty), time = shake_interval, flags = ANIMATION_PARALLEL)
	for (var/i in 3 to ((duration / shake_interval))) // Start at 3 because we already applied one, and need another to reset
		animate(pixel_x = initialpixelx + rand(-pixelshiftx,pixelshiftx), pixel_y = initialpixely + rand(-pixelshifty,pixelshifty), time = shake_interval)
	animate(pixel_x = initialpixelx, pixel_y = initialpixely, time = shake_interval)

/obj/effect/proc_holder/spell/invoked/longjump
	name = "Long Jump"
	desc = "Magically empower your legs, allowing you to jump further and higher than before"
	cost = 1
	xp_gain = TRUE
	releasedrain = 35
	chargedrain = 1
	chargetime = 30
	charge_max = 80 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	overlay_state = "jump"
	var/speed_increase = 3

/obj/effect/proc_holder/spell/invoked/longjump/cast(list/targets, mob/user = usr)
	var/mob/living/H = user
	ADD_TRAIT(H, TRAIT_ZJUMP, MAGIC_TRAIT)
	ADD_TRAIT(H, TRAIT_LEAPER, MAGIC_TRAIT)
	H.change_stat("speed", speed_increase)
	to_chat(H, span_warning("I feel arcyne energy empowering my legs, I can jump further and higher."))
	H.visible_message("[H]'s legs glow with arcyne energy.")
	addtimer(CALLBACK(src, PROC_REF(remove_buff), H), wait = 30 SECONDS)
	return TRUE

/obj/effect/proc_holder/spell/invoked/longjump/proc/remove_buff(mob/living/user)
	user.change_stat("speed", -speed_increase)
	REMOVE_TRAIT(user, TRAIT_ZJUMP, MAGIC_TRAIT)
	REMOVE_TRAIT(user, TRAIT_LEAPER, MAGIC_TRAIT)
	to_chat(user, span_warning("The energy in my legs dissapates."))

/obj/effect/proc_holder/spell/invoked/blade_burst
	name = "Blade Burst"
	desc = "summon a storm of arcyne force in an area, wounding anything in that location"
	cost = 1
	xp_gain = TRUE
	releasedrain = 30
	chargedrain = 1
	chargetime = 0
	charge_max = 15 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	overlay_state = "blade_burst"
	var/delay = 7
	var/damage = 40

/obj/effect/temp_visual/trap
	icon = 'icons/effects/effects.dmi'
	icon_state = "trap"
	light_range = 2
	duration = 7
	layer = ABOVE_ALL_MOB_LAYER //this doesnt render above mobs? it really should

/obj/effect/temp_visual/blade_burst
	icon = 'icons/effects/effects.dmi'
	icon_state = "purplesparkles"
	name = "rippeling arcyne energy"
	desc = "Get out of the way!"
	randomdir = FALSE
	duration = 1 SECONDS
	layer = ABOVE_ALL_MOB_LAYER

/obj/effect/proc_holder/spell/invoked/blade_burst/cast(list/targets, mob/user)
	var/turf/T = get_turf(targets[1])
	new /obj/effect/temp_visual/trap(T)
	sleep(delay)
	new /obj/effect/temp_visual/blade_burst(T)
	playsound(T,'sound/magic/charged.ogg', 80, TRUE)
	for(var/mob/living/L in T.contents)
		L.adjustBruteLoss(damage)
		playsound(T, "genslash", 80, TRUE)
		to_chat(L, "<span class='userdanger'>I'm cut by arcyne force!</span>")
	return TRUE

/obj/effect/proc_holder/spell/invoked/arcyne_storm
	name = "Arcyne storm"
	desc = "Conjure ripples of force into existance over a large area, injuring any who enter"
	cost = 2
	xp_gain = TRUE
	releasedrain = 50
	chargedrain = 1
	chargetime = 20
	charge_max = 50 SECONDS
	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	charging_slowdown = 2
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/arcane
	overlay_state = "hierophant"
	range = 2
	var/damage = 10

/obj/effect/proc_holder/spell/invoked/arcyne_storm/cast(list/targets, mob/user = usr)
	var/turf/T = get_turf(targets[1])
	var/list/affected_turfs = list()
	for(var/turf/turfs_in_range in range(range, T)) // use inrange instead of view
		if(turfs_in_range.density)
			continue
		affected_turfs.Add(turfs_in_range)
	for(var/i = 1, i < 16, i++)
		addtimer(CALLBACK(src, PROC_REF(apply_damage), affected_turfs), wait = i * 1 SECONDS)
	return TRUE

/obj/effect/proc_holder/spell/invoked/arcyne_storm/proc/apply_damage(var/list/affected_turfs)
	for(var/turf/damage_turf in affected_turfs)
		new /obj/effect/temp_visual/hierophant/squares(damage_turf)
		for(var/mob/living/L in damage_turf.contents)
			L.adjustBruteLoss(damage)
			playsound(damage_turf, "genslash", 40, TRUE)
			to_chat(L, "<span class='userdanger'>I'm cut by arcyne force!</span>")

#undef PRESTI_CLEAN
#undef PRESTI_SPARK
#undef PRESTI_MOTE

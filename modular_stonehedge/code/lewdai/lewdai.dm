//--------------simple mobs ----------------
//sex stuff brainrot --vide noir
/mob/living/simple_animal/hostile/retaliate/rogue/proc/Lewd_Tick()
	if(client)
		return
	if(!isfucking && seeksfuck && fuckcd > 0)
		fuckcd -= 1
	if(sexcon && seeksfuck && !isfucking && !fuckcd && prob(100) && !chasesfuck && !retreating)
		var/list/around = view(aggro_vision_range, src)
		for(var/mob/living/carbon/human/fucktarg in around)
			var/datum/sex_controller/sc = fucktarg.sexcon
			if(!src.aggressive && fucktarg.cmode) //skip if the target has cmode on and the mob is not aggressive.
				continue
			if(fucktarg.has_quirk(/datum/quirk/monsterhunter) && !sc.beingfucked)
				chasesfuck = TRUE
				if(src.gender == MALE)
					src.visible_message(span_boldwarning("[src] has his eyes on [fucktarg], cock throbbing!"))
					src.say(pick("Come here, mate!", "I smell a mate..!", "I'm going to get in you!",  "You will breed with me!"), language = /datum/language/common)
				else
					src.visible_message(span_boldwarning("[src] has her eyes on [fucktarg], cunt dripping!"))
					src.say(pick("Come here, mate!", "I smell a mate..!", "I'm going to get you in me!", "You will breed with me!"), language = /datum/language/common)
				break
			else
				continue
	if(chasesfuck && !retreating) //until fuck is acquired, keep chasing.
		seekboredom += 1
		enemies = list()
		target = null
		approaching_target = FALSE
		in_melee = FALSE
		if(prob(10))
			if(src.gender == MALE)
				src.visible_message(span_warning("[src] seeks his mate, cock throbbing!"))
				src.say(pick("I'll catch you yet...", "I smell a mate...", "I'm going to get in you!",  "You will breed with me!"), language = /datum/language/common)
			else
				src.visible_message(span_warning("[src] seeks her mate, cunt dripping!"))
				src.say(pick("I'll catch you yet...", "I smell a mate...", "I'm going to get you in me!", "You will breed with me!"), language = /datum/language/common)
		seeklewd()
	if(seekboredom > 25) //give up after a while and go dormant again, this should also help them get unstuck.
		stoppedfucking(src, TRUE)
	if(retreating && chasesfuck) //we are outta here
		stoppedfucking(src, TRUE)

/mob/living/simple_animal/hostile/retaliate/rogue/proc/seeklewd()
	var/mob/living/carbon/human/L
	var/list/around = view(aggro_vision_range, src)
	var/list/foundfuckmeat = list()
	if(isfucking && fuckcd > 0)
		return
	for(var/mob/living/carbon/human/fucktarg in around)
		if(!src.retreating && fucktarg.has_quirk(/datum/quirk/monsterhunter))
			foundfuckmeat += fucktarg
			L = fucktarg
			if(src.Adjacent(L))
				if(iscarbon(L))
					isfucking = TRUE
					chasesfuck = FALSE
					if(attack_sound)
						playsound(src, pick(attack_sound), 100, TRUE, -1)
					stop_automated_movement = TRUE
					if(L.cmode)
						L.SetImmobilized(20)
						L.SetKnockdown(20)
					else //sneak attacked i guess.
						L.SetImmobilized(50)
						L.SetKnockdown(50)
					if(!L.lying)
						L.emote("gasp")
					if(!L.cmode && L.wear_pants) //pants off if not in cmode
						src.visible_message(span_danger("[src] manages to rip [L]'s [L.wear_pants.name] off!"))
						L.dropItemToGround(L.wear_pants)
						L.wear_pants.throw_at(orange(2, get_turf(L)), 2, 1, src, TRUE)
					else if(L.cmode && L.wear_pants)
						src.visible_message(span_danger("[src] manages to tug [L]'s [L.wear_pants.name] out of the way!"))
					enemies = list()
					target = null
					approaching_target = FALSE
					in_melee = FALSE
					var/datum/sex_controller/sc = src.sexcon
					toggle_ai(AI_OFF)
					if(aggressive)
						sc.force = SEX_FORCE_MAX
					else
						sc.force = SEX_FORCE_MID
					src.throw_at(get_turf(L.loc), 3, 3, spin = FALSE)
					if(!get_turf(src) == get_turf(L)) //are we at the same tile?
						walk_to(src, get_turf(L.loc), 1, move_to_delay) //get on them.
					src.visible_message(span_danger("[src] starts to breed [L]!"))
					if(sc.force == SEX_FORCE_MAX)
						src.visible_message(span_danger("[src] pins [L] down for a savage fucking!"))
					else
						src.visible_message(span_info("[src] climbs on [L] to breed."))
					sc.speed = SEX_SPEED_MAX
					if(gender == MALE)
						sc.manual_arousal = SEX_MANUAL_AROUSAL_MAX
					log_admin("[src] is trying to init sex on [L]")
					var/current_action = /datum/sex_action/npc_rimming
					if(src.gender == FEMALE && L.gender == MALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_facesitting
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_ride_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_vaginal_ride_sex
					if(src.gender == MALE && L.gender == MALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_anal_sex
					if(src.gender == MALE && L.gender == FEMALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_vaginal_sex
					if(src.gender == FEMALE && L.gender == FEMALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_facesitting
							if(2) //anal
								current_action = /datum/sex_action/npc_rimming
							if(3) //vaginal
								current_action = /datum/sex_action/npc_cunnilingus
					sc.do_until_finished = TRUE
					sc.target = L
					sc.try_start_action(current_action)
					return
		else if(foundfuckmeat == list())
			fuckcd = rand(20,80)
	for(var/mob/living/fucktarg in foundfuckmeat)
		var/turf/T = get_turf(fucktarg)
		Goto(T,move_to_delay,0)
		return
	return 

/mob/living/simple_animal/hostile/retaliate/rogue/proc/stoppedfucking(timedout = FALSE)
	walk_away(src, get_turf(src.loc), 4, move_to_delay)
	isfucking = FALSE
	chasesfuck = FALSE
	seekboredom = 0
	toggle_ai(AI_ON)
	var/datum/sex_controller/sc = src.sexcon
	if(sc.just_ejaculated() || timedout) //is it satisfied or given up
		fuckcd = rand(50,350)
	else
		fuckcd = rand(20,80)
		if(aggressive)
			//if its in combat and unsatisfied by prey slipping off, it will wanna try again. But with some delay so the person can actually get up
			// and if they are taking turns with multiple seeksfuck mobs around this may help a bit.
			fuckcd = rand(10,20)
	stop_automated_movement = 0

/mob/living/simple_animal/hostile/retaliate/rogue/Retaliate()
	. = ..()
	if(src.isfucking)
		src.stoppedfucking()

//--------------not so simple mobs ----------------
//gonna be conversion of the simple mob stuff i made before somehow -videnoir
//those should not tackle down but only pounce laying mobs.
//those mobs may instantly refresh their cooldown if a mob is laying or is handcuffed nearby while seeking targets.

/mob/living/carbon/human
	//stuff related to auto sex stuff
	var/isfucking = FALSE
	var/fuckcd = 0
	var/seeksfuck = FALSE
	var/chasesfuck = FALSE
	var/seekboredom = 0
	//dumdumdumdum, use for not so smart mobs like goblins for dumb horny talk.
	var/dumblewdtalk = FALSE
	//since there may be so many at once, best make only a few try.
	var/hornychance = 15 //percent.

/mob/living/carbon/human/proc/Lewd_Tick()
	if(client)
		return
	if(!isfucking && seeksfuck && fuckcd > 0)
		fuckcd -= 1
	if(sexcon && seeksfuck && !isfucking && !fuckcd && prob(100) && !chasesfuck && !flee_in_pain)
		var/list/around = view(10, src)
		for(var/mob/living/carbon/human/fucktarg in around)
			var/datum/sex_controller/sc = fucktarg.sexcon
			if(!src.aggressive && fucktarg.cmode  && !fucktarg.lying) //skip if the target has cmode on and the mob is not aggressive.
				continue
			if(fucktarg.has_quirk(/datum/quirk/monsterhunter) && !sc.beingfucked)
				chasesfuck = TRUE
				if(dumblewdtalk)
					if(src.gender == MALE)
						src.visible_message(span_boldwarning("[src] has his eyes on [fucktarg], cock throbbing!"))
						src.say(pick("Come here, mate!", "I smell a mate..!", "I'm going to get in you!",  "You will breed with me!"), language = /datum/language/common)
					else
						src.visible_message(span_boldwarning("[src] has her eyes on [fucktarg], cunt dripping!"))
						src.say(pick("Come here, mate!", "I smell a mate..!", "I'm going to get you in me!", "You will breed with me!"), language = /datum/language/common)
				break
			else
				continue
	if(chasesfuck && !flee_in_pain) //until fuck is acquired, keep chasing.
		seekboredom += 1
		enemies = list()
		target = null
		mode = AI_IDLE
		if(prob(10) && dumblewdtalk)
			if(src.gender == MALE)
				src.visible_message(span_warning("[src] seeks his mate, cock throbbing!"))
				src.say(pick("I'll catch you yet...", "I smell a mate...", "I'm going to get in you!",  "You will breed with me!"), language = /datum/language/common)
			else
				src.visible_message(span_warning("[src] seeks her mate, cunt dripping!"))
				src.say(pick("I'll catch you yet...", "I smell a mate...", "I'm going to get you in me!", "You will breed with me!"), language = /datum/language/common)
		seeklewd()
	if(seekboredom > 25) //give up after a while and go dormant again, this should also help them get unstuck.
		stoppedfucking(src, TRUE)
	if(flee_in_pain && chasesfuck) //we are outta here
		stoppedfucking(src, TRUE)

/mob/living/carbon/human/proc/seeklewd()
	var/mob/living/carbon/human/L
	var/list/around = view(10, src)
	var/list/foundfuckmeat = list()
	if(isfucking && fuckcd > 0)
		return
	for(var/mob/living/carbon/human/fucktarg in around)
		if(!flee_in_pain && fucktarg.has_quirk(/datum/quirk/monsterhunter) && fucktarg.lying)
			foundfuckmeat += fucktarg
			L = fucktarg
			if(src.Adjacent(L))
				if(iscarbon(L))
					isfucking = TRUE
					chasesfuck = FALSE
					mode = AI_OFF
					wander = FALSE
					if(L.cmode)
						L.SetImmobilized(20)
						L.SetKnockdown(20)
					else //sneak attacked i guess.
						L.SetImmobilized(50)
						L.SetKnockdown(50)
					if(!L.lying) //i guess if already targeted but got up somehow.
						L.emote("gasp")
					if(!L.cmode && L.wear_pants) //pants off if not in cmode
						src.visible_message(span_danger("[src] manages to rip [L]'s [L.wear_pants.name] off!"))
						L.dropItemToGround(L.wear_pants)
						L.wear_pants.throw_at(orange(2, get_turf(L)), 2, 1, src, TRUE)
					else if(L.cmode && L.wear_pants)
						src.visible_message(span_danger("[src] manages to tug [L]'s [L.wear_pants.name] out of the way!"))
					enemies = list()
					target = null
					var/datum/sex_controller/sc = src.sexcon
					if(aggressive)
						sc.force = SEX_FORCE_MAX
					else
						sc.force = SEX_FORCE_MID
					src.throw_at(get_turf(L.loc), 3, 3, spin = FALSE)
					if(!get_turf(src) == get_turf(L)) //are we at the same tile?
						walk2derpless(L) //get on them.
					src.visible_message(span_danger("[src] starts to breed [L]!"))
					if(sc.force == SEX_FORCE_MAX)
						src.visible_message(span_danger("[src] pins [L] down for a savage fucking!"))
					else
						src.visible_message(span_info("[src] climbs on [L] to breed."))
					if(aggressive && !L.handcuffed && L.lying && !L.cmode) //aggro mob, not handcuffed, lying and not in cmode.
						for(var/obj/item/rope/ropey in src.held_items)
							src.visible_message(span_info("[src] puts the ropes on [L]!"))
							ropey.apply_cuffs(L, src)
							src.start_pulling(L)
							break
					sc.speed = SEX_SPEED_MAX
					if(gender == MALE)
						sc.manual_arousal = SEX_MANUAL_AROUSAL_MAX
					log_admin("[src] is trying to init sex on [L]")
					var/current_action = /datum/sex_action/npc_rimming
					if(src.gender == FEMALE && L.gender == MALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_facesitting
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_ride_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_vaginal_ride_sex
					if(src.gender == MALE && L.gender == MALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_anal_sex
					if(src.gender == MALE && L.gender == FEMALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_throat_sex
							if(2) //anal
								current_action = /datum/sex_action/npc_anal_sex
							if(3) //vaginal
								current_action = /datum/sex_action/npc_vaginal_sex
					if(src.gender == FEMALE && L.gender == FEMALE)
						switch(rand(3))
							if(1) //oral
								current_action = /datum/sex_action/npc_facesitting
							if(2) //anal
								current_action = /datum/sex_action/npc_rimming
							if(3) //vaginal
								current_action = /datum/sex_action/npc_cunnilingus
					sc.do_until_finished = TRUE
					sc.target = L
					sc.try_start_action(current_action)
					return
		else if(foundfuckmeat == list())
			fuckcd = rand(20,80)
	for(var/mob/living/fucktarg in foundfuckmeat)
		var/turf/T = get_turf(fucktarg)
		walk2derpless(T)
		return
	return 

/mob/living/carbon/human/proc/stoppedfucking(timedout = FALSE)
	walk_away(src, get_turf(src.loc), 4, 1)
	isfucking = FALSE
	chasesfuck = FALSE
	seekboredom = 0
	mode = AI_ON
	wander = initial(wander)
	var/datum/sex_controller/sc = src.sexcon
	if(sc.just_ejaculated() || timedout) //is it satisfied or given up
		fuckcd = rand(100,680)
	else
		fuckcd = rand(20,80)
		if(aggressive)
			//if its in combat and unsatisfied by prey slipping off, it will wanna try again. But with some delay so the person can actually get up
			// and if they are taking turns with multiple seeksfuck mobs around this may help a bit.
			fuckcd = rand(20,40)


/mob/living/carbon/human/should_target(mob/living/L)
	if(!L)
		return
	//those are here for proc dependancy.
	if(L.lying && !L.held_items) //laying with no items in hand, no threat.
		if(prob(4) && L.has_quirk(/datum/quirk/monsterhunter) && erpable) //tiny chance to trigger abuss.
			fuckcd = 0
			seeklewd()
		return FALSE

	var/mob/living/carbon/lcarbon = L
	if(istype(lcarbon, /mob/living/carbon)) //leave alone if handcuffed.
		if(lcarbon.handcuffed)
			if(prob(8) && lcarbon.has_quirk(/datum/quirk/monsterhunter) && erpable) //small chance to trigger abuss.
				fuckcd = 0
				seeklewd()
			return FALSE
	. = ..()

/mob/living/carbon/human/Life()
	if(seeksfuck)
		Lewd_Tick()
	. = ..()

/mob/living/simple_animal/hostile/retaliate/rogue/Life()
	if(seeksfuck)
		Lewd_Tick()
	. = ..()

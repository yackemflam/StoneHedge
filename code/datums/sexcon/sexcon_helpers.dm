/datum/looping_sound/femhornylite
	mid_sounds = list('sound/vo/female/gen/se/horny1loop (1).ogg')
	mid_length = 470
	volume = 20
	extra_range = -4

/datum/looping_sound/femhornylitealt
	mid_sounds = list('sound/vo/female/gen/se/horny1loop (2).ogg')
	mid_length = 360
	volume = 20
	extra_range = -4

/datum/looping_sound/femhornymed
	mid_sounds = list('sound/vo/female/gen/se/horny2loop (1).ogg')
	mid_length = 420
	volume = 20
	extra_range = -4

/datum/looping_sound/femhornymedalt
	mid_sounds = list('sound/vo/female/gen/se/horny2loop (2).ogg')
	mid_length = 350
	volume = 20
	extra_range = -4

/datum/looping_sound/femhornyhvy
	mid_sounds = list('sound/vo/female/gen/se/horny3loop (1).ogg')
	mid_length = 440
	volume = 20
	extra_range = -4

/datum/looping_sound/femhornyhvyalt
	mid_sounds = list('sound/vo/female/gen/se/horny3loop (2).ogg')
	mid_length = 390
	volume = 20
	extra_range = -4

/mob/living
	var/can_do_sex = TRUE
	var/virginity = FALSE
	var/defiant = FALSE

/mob/living/MiddleMouseDrop_T(mob/living/target, mob/living/user)
	if(user.mmb_intent)
		return ..()
	if(!istype(target))
		return
	if(target != user)
		return
	if(!user.can_do_sex())
		to_chat(user, "<span class='warning'>I can't do this.</span>")
		return
	if(!target.client || !target.client.prefs || (target.client.prefs.sexable == FALSE)) // Don't bang someone that dosn't want it.
		to_chat(user, "<span class='warning'>[target] dosn't wish to be touched. (Thier ERP prefrence under options)</span>")
		to_chat(target, "<span class='warning'>[user] failed to touch you. (Your ERP prefrence under options)</span>")
		return
	user.sexcon.start(src)

/mob/living/proc/can_do_sex()
	return TRUE

/mob/living/proc/make_sucking_noise()
	if(gender == FEMALE)
		playsound(src, pick('sound/misc/mat/girlmouth (1).ogg','sound/misc/mat/girlmouth (2).ogg'), 25, TRUE, ignore_walls = FALSE)
	else
		playsound(src, pick('sound/misc/mat/guymouth (1).ogg','sound/misc/mat/guymouth (2).ogg','sound/misc/mat/guymouth (3).ogg','sound/misc/mat/guymouth (4).ogg','sound/misc/mat/guymouth (5).ogg'), 35, TRUE, ignore_walls = FALSE)

/mob/living/proc/try_impregnate(mob/living/wife)
	var/obj/item/organ/filling_organ/testicles/testes = getorganslot(ORGAN_SLOT_TESTICLES)
	if(!testes)
		return
	var/obj/item/organ/vagina/vag = wife.getorganslot(ORGAN_SLOT_VAGINA)
	if(!vag)
		return
	if(vag.pregnant)
		return
	var/wiferoll = rand(20)+wife.STACON
	var/husbroll = rand(20)+STACON
	if(wiferoll < husbroll) //shitty d20 roll with +1 point per const, wife tries to roll more to not get pregnant.
		vag.be_impregnated(src)
		if(client?.prefs.showrolls)
			to_chat(src, span_info("My odds to impregnate... [husbroll] vs [wife]'s [wiferoll]."))
		if(wife.client?.prefs.showrolls)
			to_chat(wife, span_info("My odds to not be pregnant... [wiferoll] vs [src]'s [husbroll]."))
	else
		if(client?.prefs.showrolls)
			to_chat(src, span_info("My odds to impregnate... [husbroll] vs [wife]'s [wiferoll]."))
		if(wife.client?.prefs.showrolls)
			to_chat(wife, span_info("My odds to not be pregnant... [wiferoll] vs [src]'s [husbroll]."))

/mob/living/proc/get_highest_grab_state_on(mob/living/victim)
	var/grabstate = null
	if(r_grab && r_grab.grabbed == victim)
		if(grabstate == null || r_grab.grab_state > grabstate)
			grabstate = r_grab.grab_state
	if(l_grab && l_grab.grabbed == victim)
		if(grabstate == null || l_grab.grab_state > grabstate)
			grabstate = l_grab.grab_state
	return grabstate

/proc/add_cum_floor(turfu)
	if(!turfu || !isturf(turfu))
		return
	new /obj/effect/decal/cleanable/coom(turfu)


/datum/sex_controller/proc/came_into_loc(vaginal = FALSE, anal = FALSE, nipple = FALSE, mob/living/target)
	if(vaginal)
		return target.getorganslot(ORGAN_SLOT_VAGINA)
	if(anal)
		return target.getorganslot(ORGAN_SLOT_ANUS)
	if(nipple)
		return target.getorganslot(ORGAN_SLOT_BREASTS)
	return target

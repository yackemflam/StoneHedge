/datum/sex_action/toy_vagina
	name = "Pleasure cunt with toy"

/datum/sex_action/toy_vagina/shows_on_menu(mob/living/user, mob/living/target)
	if(user != target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!get_dildo_in_either_hand(user))
		return FALSE
	return TRUE

/datum/sex_action/toy_vagina/can_perform(mob/living/user, mob/living/target)
	if(user != target)
		return FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/userhuman = user
		if(userhuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = userhuman.wear_pants
			if(pantsies.flags_inv == HIDECROTCH) 
				if(pantsies.genitalaccess == FALSE) 
					return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!get_dildo_in_either_hand(user))
		return FALSE
	return TRUE

/datum/sex_action/toy_vagina/on_start(mob/living/user, mob/living/target)
	var/obj/item/dildo = get_dildo_in_either_hand(user)
	if(check_dildo_silver(user))
		var/mob/living/carbon/human/H = user
		var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
		if(ishuman(H))
			if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser) || H.mind.has_antag_datum(/datum/antagonist/vampire))
				to_chat(H, span_userdanger("This will HURT."))
			if(V_lord)
				if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
					to_chat(H, span_userdanger("This will sting a little."))
			if(W && W.transformed == TRUE)
				to_chat(H, span_userdanger("This will HURT."))
	user.visible_message(span_warning("[user] shoves \the [dildo] in their cunt..."))

/datum/sex_action/toy_vagina/on_perform(mob/living/user, mob/living/target)
	var/obj/item/dildo = get_dildo_in_either_hand(user)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks their cunt with \the [dildo]."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)
	if(check_dildo_silver(user))
		dildoburn(user)
	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/toy_vagina/on_finish(mob/living/user, mob/living/target)
	var/obj/item/dildo = get_dildo_in_either_hand(user)
	user.visible_message(span_warning("[user] pulls \the [dildo] from their cunt."))

/datum/sex_action/toy_vagina/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE

//non dildo items, thank me later for the big funnies and exploits -- vide noir
/datum/sex_action/toy_vaginatwo
	name = "Fuck cunt with object"
	var/ouchietext = "owie"

/datum/sex_action/toy_vaginatwo/shows_on_menu(mob/living/user, mob/living/target)
	if(user != target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!get_funobject_in_hand(user))
		return FALSE
	return TRUE

/datum/sex_action/toy_vaginatwo/can_perform(mob/living/user, mob/living/target)
	if(user != target)
		return FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/userhuman = user
		if(userhuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = userhuman.wear_pants
			if(pantsies.flags_inv == HIDECROTCH) 
				if(pantsies.genitalaccess == FALSE) 
					return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!get_funobject_in_hand(user))
		return FALSE
	return TRUE

/datum/sex_action/toy_vaginatwo/on_start(mob/living/user, mob/living/target)
	var/obj/item/dildo = user.get_active_held_item()
	if(dildo.get_temperature() >= FIRE_MINIMUM_TEMPERATURE_TO_SPREAD)
		to_chat(user, span_userdanger("\the [dildo] is flaming hot, this will hurt!"))
	if(istype(user.get_active_held_item(), /obj/item/rogueweapon))
		var/obj/item/rogueweapon/wdildo = dildo
		if(wdildo.sharpness >= IS_SHARP)
			to_chat(user, span_userdanger("\the [wdildo] is sharp, this will hurt!"))
		if(wdildo.sharpness == IS_BLUNT)
			to_chat(user, span_userdanger("\the [wdildo] will mush my insides if i am not careful.!"))
	if(istype(user.get_active_held_item(), /obj/item/reagent_containers/glass))
		var/obj/item/reagent_containers/glass/contdildo = dildo
		if(contdildo.spillable)
			to_chat(user, span_info("\the [contdildo] will likely spill inside me."))
	user.visible_message(span_warning("[user] shoves \the [dildo] in their cunt..."))

/datum/sex_action/toy_vaginatwo/on_perform(mob/living/user, mob/living/target)
	var/obj/item/dildo = user.get_active_held_item()
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks their cunt with \the [dildo]."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	if(dildo.get_temperature() >= FIRE_MINIMUM_TEMPERATURE_TO_SPREAD)
		ouchietext = pick("OUCH! \the [dildo] burns my cunt!", "YOUCH! \the [dildo] burns my pussy!", "OW! \the [dildo] chars my walls!", "AGH! \the [dildo] burns my cunt!")
		to_chat(user, span_userdanger(ouchietext))
		user.apply_damage(rand(4,6), BURN, BODY_ZONE_PRECISE_GROIN)

	var/datum/sex_controller/sc = user.sexcon
	if(istype(user.get_active_held_item(), /obj/item/rogueweapon))
		var/obj/item/rogueweapon/wdildo = dildo
		var/cutchance = 10*sc.speed //multiplies with speed
		if(user.lying) //less odds if laying
			cutchance *= 0.5
		if(wdildo.sharpness >= IS_SHARP && sc.speed > SEX_SPEED_LOW && prob(cutchance))
			ouchietext = pick("OUCH! \the [wdildo] cuts my insides!", "ACK! \the [wdildo] poked my walls!", "OW! \the [wdildo] cut my lower lips!", "ACK! \the [wdildo] stabs my womb!")
			to_chat(user, span_userdanger(ouchietext))
			user.apply_damage(rand(10,20), BRUTE, BODY_ZONE_PRECISE_GROIN)
		if(wdildo.sharpness == IS_BLUNT && sc.speed > SEX_SPEED_MID && prob(cutchance))
			ouchietext = pick("OUCH! \the [wdildo] scrapes my insides!", "GUH! \the [wdildo] bruises my womb!", "OW! \the [wdildo] is pulls my cunt!", "AGH! \the [wdildo] smashes my womb!")
			to_chat(user, span_userdanger(ouchietext))
			user.apply_damage(rand(10,20), BRUTE, BODY_ZONE_PRECISE_GROIN)

		var/mob/living/carbon/human/userussy = user
		var/woundchance = 5*sc.speed //multiplies with speed
		if(user.lying) //less odds if laying
			woundchance *= 0.5
		if(prob(woundchance))
			if(prob(90))
				to_chat(user, span_userdanger("OUCH! \the [wdildo] bleeds my cunt!!!"))
				var/obj/item/bodypart/chest/gr = userussy.get_bodypart(BODY_ZONE_PRECISE_GROIN)
				gr.add_wound(/datum/wound/slash/small, TRUE, FALSE)
			else
				to_chat(user, span_userdanger("AHH!!! \the [wdildo] TEARS my cunt!!!"))
				var/obj/item/bodypart/chest/gr = userussy.get_bodypart(BODY_ZONE_PRECISE_GROIN)
				gr.add_wound(/datum/wound/slash, TRUE, FALSE)

	if(istype(user.get_active_held_item(), /obj/item/ammo_casing/caseless/rogue))
		var/obj/item/ammo_casing/caseless/rogue/adildo = dildo
		var/cutchance = 10*sc.speed //multiplies with speed
		if(user.lying) //less odds if laying
			cutchance *= 0.5
		if(sc.speed > SEX_SPEED_LOW && prob(cutchance))
			ouchietext = pick("OUCH! \the [adildo] cuts my insides!", "ACK! \the [adildo] poked my walls!", "OW! \the [adildo] cut my lower lips!", "ACK! \the [adildo] stabs my womb!")
			to_chat(user, span_userdanger(span_userdanger(ouchietext)))
			user.apply_damage(rand(5,10), BRUTE, BODY_ZONE_PRECISE_GROIN)

	if(istype(user.get_active_held_item(), /obj/item/reagent_containers/glass))
		var/obj/item/reagent_containers/glass/contdildo = dildo
		var/spillchance = 15*sc.speed //multiplies with speed
		if(user.lying) //double spill odds if lying down due gravity and stuff.
			spillchance *= 2
		if(contdildo.spillable && prob(spillchance) && contdildo.reagents.total_volume)
			to_chat(user, span_notice(pick("[english_list(contdildo.reagents.reagent_list)] from \the [contdildo] fill my cunt.", "I feed my cunt with [english_list(contdildo.reagents.reagent_list)] from \The [contdildo]", "[english_list(contdildo.reagents.reagent_list)] from \the [contdildo] splash into my cunt.", "[english_list(contdildo.reagents.reagent_list)] from \the [contdildo] flood into me.")))
			addtimer(CALLBACK(contdildo.reagents, TYPE_PROC_REF(/datum/reagents, trans_to), user, sc.speed, TRUE, TRUE, FALSE, user, FALSE, INJECT), 5)
			playsound(user.loc, 'sound/misc/mat/endin.ogg', 100, TRUE)

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)
	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/toy_vaginatwo/on_finish(mob/living/user, mob/living/target)
	var/obj/item/dildo = get_funobject_in_hand(user)
	user.visible_message(span_warning("[user] pulls \the [dildo] from their cunt."))

/datum/sex_action/toy_vaginatwo/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE

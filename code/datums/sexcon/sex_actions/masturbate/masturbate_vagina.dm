/datum/sex_action/masturbate_vagina
	name = "Stroke clit"

/datum/sex_action/masturbate_vagina/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.bypasssexable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user != target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	return TRUE

/datum/sex_action/masturbate_vagina/can_perform(mob/living/user, mob/living/target)
	if(user != target)
		return FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/userhuman = user
		if(userhuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = userhuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH) 
				if(!pantsies.genitalaccess) 
					return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	return TRUE

/datum/sex_action/masturbate_vagina/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] starts stroking their clit..."))

/datum/sex_action/masturbate_vagina/on_perform(mob/living/user, mob/living/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] strokes their clit..."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)

	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/masturbate_vagina/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] stops stroking."))

/datum/sex_action/masturbate_vagina/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE

//fingering
/datum/sex_action/masturbate_vaginatwo
	name = "Finger cunt"

/datum/sex_action/masturbate_vaginatwo/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.bypasssexable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user != target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	return TRUE

/datum/sex_action/masturbate_vaginatwo/can_perform(mob/living/user, mob/living/target)
	if(user != target)
		return FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/userhuman = user
		if(userhuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = userhuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH) 
				if(!pantsies.genitalaccess) 
					return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	return TRUE

/datum/sex_action/masturbate_vaginatwo/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] starts fingering their cunt..."))

/datum/sex_action/masturbate_vaginatwo/on_perform(mob/living/user, mob/living/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fingers their cunt.."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	user.sexcon.perform_sex_action(user, 2, 4, TRUE)

	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/masturbate_vaginatwo/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] stops fingering."))

/datum/sex_action/masturbate_vaginatwo/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE

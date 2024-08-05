/datum/sex_action/force_armpit_nuzzle
	name = "Force them against armpit"
	require_grab = TRUE
	stamina_cost = 1.0

/datum/sex_action/force_armpit_nuzzle/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.bypasssexable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	return TRUE

/datum/sex_action/force_armpit_nuzzle/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/userhuman = user
		if(userhuman.wear_shirt)
			var/obj/item/clothing/suit/roguetown/shirtsies = userhuman.wear_shirt
			if(shirtsies.flags_inv == HIDEBOOB)
				if(shirtsies.genitalaccess == FALSE)
					return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	return TRUE

/datum/sex_action/force_armpit_nuzzle/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] forces [target]'s head against their armpit!"))

/datum/sex_action/force_armpit_nuzzle/on_perform(mob/living/user, mob/living/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] forces [target] to nuzzle their armpit."))

	user.sexcon.perform_sex_action(user, 0.5, 0, TRUE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/force_armpit_nuzzle/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] pulls [target]'s head away from their armpit."))

/datum/sex_action/force_armpit_nuzzle/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE

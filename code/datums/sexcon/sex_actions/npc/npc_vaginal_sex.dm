/datum/sex_action/npc_vaginal_sex
	name = "Fuck their cunt"
	stamina_cost = 0
	check_same_tile = FALSE

/datum/sex_action/npc_vaginal_sex/shows_on_menu(mob/living/user, mob/living/target)
	return FALSE

/datum/sex_action/npc_vaginal_sex/can_perform(mob/living/user, mob/living/target)
	if(issimple(user))
		return TRUE
	return FALSE

/datum/sex_action/npc_vaginal_sex/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] slides their cock into [target]'s cunt!"))
	playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)
	var/datum/sex_controller/sc = target.sexcon
	sc.beingfucked = TRUE

/datum/sex_action/npc_vaginal_sex/on_perform(mob/living/user, mob/living/target)
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks [target]'s cunt."))
	playsound(target, 'sound/misc/mat/segso.ogg', 50, TRUE, -2, ignore_walls = FALSE)

	target.adjustBruteLoss(-0.2)
	target.adjustFireLoss(-0.2)
	target.adjustOxyLoss(-0.2)
	user.sexcon.perform_sex_action(user, 2, 0, TRUE)
	if(user.sexcon.check_active_ejaculation())
		user.visible_message(span_love("[user] cums into [target]'s cunt!"))
		user.sexcon.cum_into()
		user.try_impregnate(target)
		user.virginity = FALSE
		target.virginity = FALSE

	if(user.sexcon.considered_limp())
		user.sexcon.perform_sex_action(target, 1.2, 3, FALSE)
	else
		user.sexcon.perform_sex_action(target, 2.4, 7, FALSE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/npc_vaginal_sex/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] pulls their cock out of [target]'s cunt."))
	var/mob/living/simple_animal/hostile/retaliate/rogue/usermob = user
	usermob.stoppedfucking()
	var/datum/sex_controller/sc = target.sexcon
	sc.beingfucked = FALSE


/datum/sex_action/npc_vaginal_sex/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		var/mob/living/simple_animal/hostile/retaliate/rogue/usermob = user
		usermob.stoppedfucking()
		var/datum/sex_controller/sc = target.sexcon
		sc.beingfucked = FALSE
		return TRUE
	return FALSE

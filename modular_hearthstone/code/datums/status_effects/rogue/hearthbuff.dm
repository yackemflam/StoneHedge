/datum/status_effect/buff/fortitudebuff
	id = "fortitudebuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/fortitude
	effectedstats = list("strength" = 1, "constitution" = 3)
	duration = 1500

/atom/movable/screen/alert/status_effect/buff/fortitude
	name = "Fortitude"
	desc = ""
	icon_state = "fortitude"

/datum/status_effect/buff/swiftnessbuff
	id = "swiftnessbuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/swiftness
	effectedstats = list("speed" = 3, "dexterity" = 1)
	duration = 1500

/atom/movable/screen/alert/status_effect/buff/swiftness
	name = "Swiftness"
	desc = ""
	icon_state = "swiftness"

/datum/status_effect/buff/intellectbuff
	id = "intellectbuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/intellect
	effectedstats = list("intelligence" = 2, "perception" = 2)
	duration = 1500

/atom/movable/screen/alert/status_effect/buff/intellect
	name = "Intellect"
	desc = ""
	icon_state = "intellect"


/datum/status_effect/buff/virilitybuff
	id = "virilitybuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/virility
	duration = 3000

/atom/movable/screen/alert/status_effect/buff/virility
	name = "Virility"
	desc = ""
	icon_state = "virility"

/datum/status_effect/buff/virilitybuff/on_apply()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		var/obj/item/organ/filling_organ/testicles/testie = C.getorganslot(ORGAN_SLOT_TESTICLES)
		testie.reagent_generate_rate = 20 //20 sperm regenerated per life tick
		if(!testie.virility)
			testie.virility = TRUE
	return ..()

/datum/status_effect/buff/virilitybuff/on_remove()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		var/obj/item/organ/filling_organ/testicles/testie = C.getorganslot(ORGAN_SLOT_TESTICLES)
		testie.reagent_generate_rate = initial(testie.reagent_generate_rate)
		testie.virility = initial(testie.virility)
	return ..()
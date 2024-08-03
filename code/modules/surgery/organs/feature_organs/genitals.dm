/obj/item/organ/penis
	name = "penis"
	icon_state = "penis"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_PENIS
	organ_dna_type = /datum/organ_dna/penis
	accessory_type = /datum/sprite_accessory/penis/human
	var/penis_size = DEFAULT_PENIS_SIZE

/obj/item/organ/anus
	//only for storing stuff
	name = "anus"
	icon_state = "anus"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_ANUS
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/vagina
	name = "vagina"
	icon_state = "vagina"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_VAGINA
	accessory_type = /datum/sprite_accessory/vagina/human
	var/pregnant = FALSE
	var/fertility = TRUE
	var/initialbellysize = 0
	var/preggotimer

/obj/item/organ/vagina/proc/be_impregnated(mob/living/father)
	if(pregnant)
		return
	if(!owner)
		return
	if(owner.stat == DEAD)
		return
	to_chat(owner, span_love("I feel a surge of warmth in my belly, I’m definitely pregnant!"))
	pregnant = TRUE
	if(owner.getorganslot(ORGAN_SLOT_BREASTS))
		var/obj/item/organ/breasts/breasties = owner.getorganslot(ORGAN_SLOT_BREASTS)
		if(breasties.lactating == FALSE)
			breasties.lactating = TRUE
			to_chat(owner, span_love("My breasts should start lactating soon..."))
	if(owner.getorganslot(ORGAN_SLOT_BELLY))
		var/obj/item/organ/belly/bellyussy = owner.getorganslot(ORGAN_SLOT_BELLY)
		initialbellysize = bellyussy.belly_size
		//there is no birthing so hopefully 2 hours for one stage is enough to last till round end, there is 0 to 3 belly sizes.
		addtimer(CALLBACK(src, PROC_REF(handle_preggoness)), 2 HOURS, TIMER_STOPPABLE)

/obj/item/organ/vagina/proc/handle_preggoness()
	var/obj/item/organ/belly/bellyussy = owner.getorganslot(ORGAN_SLOT_BELLY)
	var/datum/sprite_accessory/belly/bellyacc = bellyussy.accessory_type
	if(bellyussy.belly_size < 3)
		to_chat(owner, span_love("I notice my belly has grown as my pregnancy progresses."))
		bellyussy.belly_size += 1
		bellyacc.get_icon_state()
		owner.update_body_parts(TRUE)
		preggotimer = addtimer(CALLBACK(src, PROC_REF(handle_preggoness)), 2 HOURS, TIMER_STOPPABLE)
	else
		deltimer(preggotimer)

/obj/item/organ/vagina/proc/undo_preggoness()
	deltimer(preggotimer)
	pregnant = FALSE
	to_chat(owner, span_love("I feel my belly shrink to how it was before. Pregnancy is no more."))
	if(owner.getorganslot(ORGAN_SLOT_BELLY))
		var/obj/item/organ/belly/bellyussy = owner.getorganslot(ORGAN_SLOT_BELLY)
		var/datum/sprite_accessory/belly/bellyacc = bellyussy.accessory_type
		bellyussy.belly_size = initialbellysize
		bellyacc.get_icon_state()
	owner.update_body_parts(TRUE)

/obj/item/organ/breasts
	name = "breasts"
	icon_state = "breasts"
	dropshrink = 0.8
	visible_organ = TRUE
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BREASTS
	organ_dna_type = /datum/organ_dna/breasts
	accessory_type = /datum/sprite_accessory/breasts/pair
	var/breast_size = DEFAULT_BREASTS_SIZE
	var/lactating = FALSE
	var/milk_stored = 0
	var/milk_max = 75

/obj/item/organ/breasts/New()
	..()
	milk_max = max(75, breast_size * 100)

/obj/item/organ/belly
	name = "belly"
	icon_state = "belly"
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_STOMACH
	slot = ORGAN_SLOT_BELLY
	organ_dna_type = /datum/organ_dna/belly
	accessory_type = /datum/sprite_accessory/belly
	var/belly_size = DEFAULT_BELLY_SIZE

/obj/item/organ/testicles
	name = "testicles"
	icon_state = "testicles"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_TESTICLES
	organ_dna_type = /datum/organ_dna/testicles
	accessory_type = /datum/sprite_accessory/testicles/pair
	var/ball_size = DEFAULT_TESTICLES_SIZE
	var/virility = TRUE

/obj/item/organ/testicles/internal
	name = "internal testicles"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/penis/internal
	name = "internal penis"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/vagina/internal
	name = "internal vagina"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/breasts/internal
	name = "internal breasts"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/belly/internal
	name = "internal belly"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

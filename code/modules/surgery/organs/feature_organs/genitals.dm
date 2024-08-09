/obj/item/organ/penis
	name = "penis"
	icon_state = "penis"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_PENIS
	organ_dna_type = /datum/organ_dna/penis
	accessory_type = /datum/sprite_accessory/penis/human
	var/sheath_type = SHEATH_TYPE_NONE
	var/erect_state = ERECT_STATE_NONE
	var/penis_type = PENIS_TYPE_PLAIN
	var/penis_size = DEFAULT_PENIS_SIZE

/obj/item/organ/penis/Initialize()
	. = ..()

/obj/item/organ/penis/proc/update_erect_state()
	var/oldstate = erect_state
	var/new_state = ERECT_STATE_NONE
	if(owner)
		var/mob/living/carbon/human/human = owner
		if(human.sexcon.arousal > 20 && human.sexcon.manual_arousal == 1 || human.sexcon.manual_arousal == 4)
			new_state = ERECT_STATE_HARD
		else if(human.sexcon.arousal > 10 && human.sexcon.manual_arousal == 1 || human.sexcon.manual_arousal == 3)
			new_state = ERECT_STATE_PARTIAL
		else
			new_state = ERECT_STATE_NONE

	erect_state = new_state
	if(oldstate != erect_state && owner)
		owner.update_body_parts(TRUE)

/obj/item/organ/penis/knotted
	name = "knotted penis"
	penis_type = PENIS_TYPE_KNOTTED
	sheath_type = SHEATH_TYPE_NORMAL

/obj/item/organ/penis/knotted/big
	penis_size = 3

/obj/item/organ/penis/equine
	name = "equine penis"
	penis_type = PENIS_TYPE_EQUINE
	sheath_type = SHEATH_TYPE_NORMAL

/obj/item/organ/penis/tapered_mammal
	name = "tapered penis"
	penis_type = PENIS_TYPE_TAPERED
	sheath_type = SHEATH_TYPE_NORMAL

/obj/item/organ/penis/tapered
	name = "tapered penis"
	penis_type = PENIS_TYPE_TAPERED
	sheath_type = SHEATH_TYPE_SLIT

/obj/item/organ/penis/tapered_double
	name = "hemi tapered penis"
	penis_type = PENIS_TYPE_TAPERED_DOUBLE
	sheath_type = SHEATH_TYPE_SLIT

/obj/item/organ/penis/tapered_double_knotted
	name = "hemi knotted tapered penis"
	penis_type = PENIS_TYPE_TAPERED_DOUBLE_KNOTTED
	sheath_type = SHEATH_TYPE_SLIT

/obj/item/organ/penis/barbed
	name = "barbed penis"
	penis_type = PENIS_TYPE_BARBED
	sheath_type = SHEATH_TYPE_NORMAL

/obj/item/organ/penis/barbed_knotted
	name = "barbed knotted penis"
	penis_type = PENIS_TYPE_BARBED_KNOTTED
	sheath_type = SHEATH_TYPE_NORMAL

/obj/item/organ/penis/tentacle
	name = "tentacle penis"
	penis_type = PENIS_TYPE_TENTACLE
	sheath_type = SHEATH_TYPE_NONE

/obj/item/organ/filling_organ/anus
	//absorbs faster than womb, less capacity.
	name = "anus"
	icon_state = "anus"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_ANUS
	accessory_type = /datum/sprite_accessory/none
	max_reagents = 15 //use if organ not sizeable
	absorbing = TRUE //absorbs liquids within slowly. Wont absorb reagent_to_make type, refilling and hungerhelp are irrelevant to this.
	absorbrate = 2 //refilling and hungerhelp are irrelevant to this.
	altnames = list("ass", "asshole", "butt", "butthole", "guts") //used in thought messages.
	spiller = TRUE

/obj/item/organ/filling_organ/vagina
	name = "vagina"
	icon_state = "vagina"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_VAGINA
	accessory_type = /datum/sprite_accessory/vagina/human
	max_reagents = 30
	absorbing = TRUE
	fertility = TRUE
	pregnantaltorgan = /obj/item/organ/belly
	altnames = list("vagina", "cunt", "womb", "pussy", "slit", "kitty", "snatch") //used in thought messages.
	spiller = TRUE

/obj/item/organ/filling_organ/breasts
	name = "breasts"
	icon_state = "breasts"
	dropshrink = 0.8
	visible_organ = TRUE
	zone = BODY_ZONE_CHEST
	slot = ORGAN_SLOT_BREASTS
	organ_dna_type = /datum/organ_dna/breasts
	accessory_type = /datum/sprite_accessory/breasts/pair
	organ_size = DEFAULT_BREASTS_SIZE
	reagent_to_make = /datum/reagent/consumable/breastmilk
	refilling = TRUE
	hungerhelp = TRUE 
	organ_sizeable = TRUE
	absorbing = FALSE //funny liquid tanks
	altnames = list("breasts", "tits", "milkers", "tiddies", "badonkas", "boobas") //used in thought messages.
	startsfilled = TRUE

/obj/item/organ/belly
	name = "belly"
	icon_state = "belly"
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_STOMACH
	slot = ORGAN_SLOT_BELLY
	organ_dna_type = /datum/organ_dna/belly
	accessory_type = /datum/sprite_accessory/belly
	organ_size = DEFAULT_BELLY_SIZE

/obj/item/organ/filling_organ/testicles
	name = "testicles"
	icon_state = "testicles"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_TESTICLES
	organ_dna_type = /datum/organ_dna/testicles
	accessory_type = /datum/sprite_accessory/testicles/pair
	organ_size = DEFAULT_TESTICLES_SIZE
	reagent_to_make = /datum/reagent/consumable/cum
	refilling = TRUE
	hungerhelp = TRUE //balls be dry if you starve
	organ_sizeable = TRUE
	absorbing = TRUE //if you somehow put another liquid here it should probably get replaced..
	storage_per_size = 5
	altnames = list("balls", "testicles", "testes", "orbs", "cum tanks", "seed tanks") //used in thought messages.
	startsfilled = TRUE
	var/virility = TRUE

/obj/item/organ/filling_organ/testicles/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	if(!virility)
		reagent_to_make = /datum/reagent/consumable/cum/sterile
		reagents.clear_reagents()
		reagents.add_reagent(reagent_to_make, reagents.maximum_volume)

/obj/item/organ/filling_organ/testicles/internal
	name = "internal testicles"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/penis/internal
	name = "internal penis"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/filling_organ/vagina/internal
	name = "internal vagina"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/filling_organ/breasts/internal
	name = "internal breasts"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/belly/internal
	name = "internal belly"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

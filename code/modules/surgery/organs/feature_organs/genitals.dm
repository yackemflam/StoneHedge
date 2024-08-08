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

/obj/item/organ/anus
	//absorbs faster than womb, less capacity.
	name = "anus"
	icon_state = "anus"
	dropshrink = 0.5
	visible_organ = TRUE
	zone = BODY_ZONE_PRECISE_GROIN
	slot = ORGAN_SLOT_ANUS
	accessory_type = /datum/sprite_accessory/none
	var/initialreagentcap = 15

/obj/item/organ/anus/Initialize()
	. = ..()
	create_reagents(initialreagentcap)

/obj/item/organ/anus/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	if(!issimple(M))
		if(M.mind)
			var/athletics = M.mind.get_skill_level(/datum/skill/misc/athletics)
			var/captarget = initialreagentcap+(athletics*4)
			if(captarget != reagents.maximum_volume)
				reagents.maximum_volume = captarget

/obj/item/organ/anus/on_life()
	var/mob/living/carbon/human/H = owner
	var/datum/reagent/liquid
	..()
	//liquid handlers
	liquid = locate(/datum/reagent) in reagents.reagent_list

	if(liquid) //slowly inject to your blood if they have reagents.
		addtimer(CALLBACK(reagents, TYPE_PROC_REF(/datum/reagents, trans_to), owner, 1, TRUE, TRUE, FALSE, src, FALSE, INJECT), 3 SECONDS)
		if(!contents.len && !HAS_TRAIT(H, TRAIT_GOODLOVER)) //if nothing is plugging the hole, stuff will drip out. Good lovers have steel grip so they dont drip.
			if(prob(5))
				to_chat(H, pick(span_info("A little bit of [english_list(reagents.reagent_list)] drips from my ass..."),
				span_info("Some liquid drips from my ass."),
				span_info("My ass spills some liquid."),
				span_info("Some [english_list(reagents.reagent_list)] drips from my ass.")))
			reagents.remove_all(0.2)

	if(liquid)
		if(liquid.volume > reagents.maximum_volume)
			H.adjust_nutrition(-damage)
			H.emote("grunts as their ass spills its contents.")
			to_chat(H, span_warning("My ass strains and spills it's contents as I am incapable of holding in all that stuff!"))

	if(!issimple(H) && H.mind)
		var/athletics = H.mind.get_skill_level(/datum/skill/misc/athletics)
		var/captarget = initialreagentcap+(athletics*4)
		if(captarget != reagents.maximum_volume)
			reagents.maximum_volume = captarget
			if(H.has_quirk(/datum/quirk/selfawaregeni))
				to_chat(H, span_blue("My ass may be able to hold a different amount now."))

	if(damage < low_threshold)
		return

	if(liquid)
		if(liquid.volume > (reagents.maximum_volume - damage))
			H.adjust_nutrition(-damage)
			H.emote("grunts as their ass spills its contents.")
			to_chat(H, span_warning("My ass strains and spills it's contents as I am incapable of holding in all that stuff!"))

/obj/item/organ/anus/proc/organ_jumped()
	var/mob/living/carbon/human/H = owner
	var/obj/item/organ/anus/userass = H.getorganslot(ORGAN_SLOT_ANUS)
	//content object handlers
	if(!issimple(H) && H.mind)
		if(contents.len)
			var/stealth = H.mind.get_skill_level(/datum/skill/misc/sneaking)
			var/keepinsidechance = CLAMP((rand(25,100) - (stealth * 20)),0,100) //basically cant lose your item if you have 5 stealth.
			for(var/obj/item/asscontents as anything in userass.contents)
				if(!istype(asscontents, /obj/item/dildo))
					if(!H.wear_pants || H.wear_pants && (!H.wear_pants.flags_inv & HIDECROTCH || H.wear_pants.genitalaccess))
						if(prob(keepinsidechance))
							if(H.client?.prefs.showrolls)
								to_chat(H, span_alert("Damn! I lose my ass's grip on [english_list(contents)]! [keepinsidechance]%"))
							else
								to_chat(H, span_alert("Damn! I lose my ass's grip on [english_list(contents)]!"))
							asscontents.doMove(get_turf(H))
							userass.contents -= asscontents
							var/yeet = rand(4)
							var/turf/selectedturf = pick(orange(H, yeet)) //object flies off the hole with pressure at a random turf, funny.
							asscontents.throw_at(selectedturf, yeet, 2)
						else
							if(H.client?.prefs.showrolls)
								if(keepinsidechance < 10)
									to_chat(H, span_blue("Gah, I easily maintain my ass's grip on [english_list(contents)]. [keepinsidechance]%"))
								else
									to_chat(H, span_smallnotice("Phew, I maintain my ass's grip on [english_list(contents)]. [keepinsidechance]%"))
							else
								if(keepinsidechance < 10)
									to_chat(H, span_blue("Gah, I easily maintain my ass's grip on [english_list(contents)]."))
								else
									to_chat(H, span_smallnotice("Phew, I maintain my ass's grip on [english_list(contents)]."))
				break	


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
	var/initialreagentcap = 30

/obj/item/organ/vagina/Initialize()
	. = ..()
	//absorbs slower than ass, more capacity.
	create_reagents(initialreagentcap)

/obj/item/organ/vagina/Insert(mob/living/carbon/M, special, drop_if_replaced)
	. = ..()
	if(!issimple(M))
		if(M.mind)
			var/athletics = M.mind.get_skill_level(/datum/skill/misc/athletics)
			var/captarget = initialreagentcap+(athletics*4)
			if(captarget != reagents.maximum_volume)
				reagents.maximum_volume = captarget

/obj/item/organ/vagina/on_life()
	var/mob/living/carbon/human/H = owner
	var/datum/reagent/liquid

	..()

	//liquid handlers
	liquid = locate(/datum/reagent) in reagents.reagent_list

	if(liquid) //slowly inject to your blood if they have reagents.
		addtimer(CALLBACK(reagents, TYPE_PROC_REF(/datum/reagents, trans_to), owner, 1, TRUE, TRUE, FALSE, src, FALSE, INJECT), 6 SECONDS)
		if(!contents.len && !HAS_TRAIT(H, TRAIT_GOODLOVER)) //if nothing is plugging the hole, stuff will drip out. Good lovers have steel grip so they dont drip.
			if(prob(5))
				to_chat(H, pick(span_info("A little bit of [english_list(reagents.reagent_list)] drips from my slit..."),
				span_info("Some liquid drips from my slit."),
				span_info("My slit spills some liquid."),
				span_info("Some [english_list(reagents.reagent_list)] drips from my slit.")))
			reagents.remove_all(0.1)

	if(liquid)
		if(liquid.volume > reagents.maximum_volume)
			H.adjust_nutrition(-damage)
			H.emote("grunts as their womb spills its contents.")
			to_chat(H, span_warning("My womb tenses and spills it's contents as I am incapable of holding in all that stuff!"))
			reagents.remove_all(reagents.maximum_volume - liquid.volume)

	if(!issimple(H) && H.mind)
		var/athletics = H.mind.get_skill_level(/datum/skill/misc/athletics)
		var/captarget = initialreagentcap+(athletics*4)
		if(captarget != reagents.maximum_volume)
			if(pregnant)
				captarget *= 0.5
			reagents.maximum_volume = captarget
			if(H.has_quirk(/datum/quirk/selfawaregeni))
				to_chat(H, span_blue("My womb may be able to hold a different amount now."))

	if(damage < low_threshold)
		return

	if(liquid)
		if(liquid.volume > (reagents.maximum_volume - damage))
			H.adjust_nutrition(-damage)
			H.emote("grunts as their womb spills its contents.")
			to_chat(H, span_warning("My womb tenses and spills it's contents as I am incapable of holding in all that stuff!"))

/obj/item/organ/vagina/proc/organ_jumped()
	var/mob/living/carbon/human/H = owner
	var/obj/item/organ/vagina/uservag = H.getorganslot(ORGAN_SLOT_VAGINA)
	//content object handlers
	if(!issimple(H) && H.mind)
		if(contents.len)
			var/stealth = H.mind.get_skill_level(/datum/skill/misc/sneaking)
			var/keepinsidechance = CLAMP((rand(25,100) - (stealth * 20)),0,100) //basically cant lose your item if you have 5 stealth.
			for(var/obj/item/pusscontents as anything in uservag.contents)
				if(!istype(pusscontents, /obj/item/dildo))
					if(!H.wear_pants || H.wear_pants && (!H.wear_pants.flags_inv & HIDECROTCH || H.wear_pants.genitalaccess)) //dildo stays in place.
						if(prob(keepinsidechance))
							if(H.client?.prefs.showrolls)
								to_chat(H, span_alert("Damn! I lose my cunt's grip on [english_list(contents)]! [keepinsidechance]%"))
							else
								to_chat(H, span_alert("Damn! I lose my cunt's grip on [english_list(contents)]!"))
							playsound(H, 'sound/misc/mat/insert (1).ogg', 20, TRUE, -2, ignore_walls = FALSE)
							pusscontents.doMove(get_turf(H))
							uservag.contents -= pusscontents
							var/yeet = rand(4)
							var/turf/selectedturf = pick(orange(H, yeet)) //object flies off the hole with pressure at a random turf, funny.
							pusscontents.throw_at(selectedturf, yeet, 2)
						else
							if(H.client?.prefs.showrolls)
								if(keepinsidechance < 10)
									to_chat(H, span_blue("I easily maintain my cunt's grip on [english_list(contents)]. [keepinsidechance]%"))
								else
									to_chat(H, span_smallnotice("Phew, I maintain my cunt's grip on [english_list(contents)]. [keepinsidechance]%"))
							else
								if(keepinsidechance < 10)
									to_chat(H, span_blue("I easily maintain my cunt's grip on [english_list(contents)]."))
								else
									to_chat(H, span_smallnotice("Phew, I maintain my cunt's grip on [english_list(contents)]."))
				break		

/obj/item/organ/vagina/proc/be_impregnated(mob/living/father)
	if(pregnant)
		return
	if(!owner)
		return
	if(owner.stat == DEAD)
		return
	to_chat(owner, span_love("I feel a surge of warmth in my belly, I’m definitely pregnant!"))
	reagents.maximum_volume *= 0.5 //ick ock, should make the thing recalculate on next life tick.
	pregnant = TRUE
	if(owner.getorganslot(ORGAN_SLOT_BREASTS))
		var/obj/item/organ/filling_organ/breasts/breasties = owner.getorganslot(ORGAN_SLOT_BREASTS)
		if(breasties.refilling == FALSE)
			breasties.refilling = TRUE
			to_chat(owner, span_love("My breasts should start refilling soon..."))
	if(owner.getorganslot(ORGAN_SLOT_BELLY))
		var/obj/item/organ/belly/bellyussy = owner.getorganslot(ORGAN_SLOT_BELLY)
		initialbellysize = bellyussy.organ_size
		//there is no birthing so hopefully 2 hours for one stage is enough to last till round end, there is 0 to 3 belly sizes.
		addtimer(CALLBACK(src, PROC_REF(handle_preggoness)), 2 HOURS, TIMER_STOPPABLE)

/obj/item/organ/vagina/proc/handle_preggoness()
	var/obj/item/organ/belly/bellyussy = owner.getorganslot(ORGAN_SLOT_BELLY)
	var/datum/sprite_accessory/belly/bellyacc = bellyussy.accessory_type
	if(bellyussy.organ_size < 3)
		to_chat(owner, span_love("I notice my belly has grown as my pregnancy progresses."))
		bellyussy.organ_size += 1
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
		bellyussy.organ_size = initialbellysize
		bellyacc.get_icon_state()
	owner.update_body_parts(TRUE)


#define STORAGE_PER_SIZE 10
/obj/item/organ/filling_organ
	name = "self filling organ"
	var/reagent_generate_rate = HUNGER_FACTOR
	var/max_reagent = 0 //do we even need this set on organs if it is set by the natural limit of storage define and size
	var/datum/reagent/reagent_to_make =  /datum/reagent/consumable/nutriment
	var/refilling = TRUE
	var/uses_nutrient = TRUE //incase someone for some reason wanna make an OP paradox i guess.

/obj/item/organ/filling_organ/Insert(mob/living/carbon/M, special, drop_if_replaced) //update size cap n shit on insert
	. = ..()
	max_reagent = STORAGE_PER_SIZE + STORAGE_PER_SIZE * organ_size
	create_reagents(max_reagent)
	if(special) // won't fill the organ if you insert this organ via surgery
		reagents.add_reagent(reagent_to_make, max_reagent)

#undef STORAGE_PER_SIZE
// press dat button? still cant
/obj/item/organ/filling_organ/on_life()
	..()
	// modify nutrition to generate reagents
	if(refilling && owner.nutrition < NUTRITION_LEVEL_HUNGRY || owner.nutrition < NUTRITION_LEVEL_STARVING)
		var/remove_amount = min(reagent_generate_rate, reagents.total_volume)
		if(uses_nutrient)
			owner.adjust_nutrition(remove_amount)
		reagents.remove_reagent(reagent_to_make, remove_amount)
		return
	if(reagents.total_volume >= max_reagent || !refilling) //youch.
		return
	var/max_restore = owner.nutrition > NUTRITION_LEVEL_FED ? reagent_generate_rate * 2 : reagent_generate_rate
	// amount restored, capped by max_reagent
	var/restore_amount = min(max_restore, max_reagent - reagents.total_volume)
	if(uses_nutrient)
		owner.adjust_nutrition(-restore_amount)
	reagents.add_reagent(reagent_to_make, restore_amount)

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
	var/virility = TRUE

/obj/item/organ/filling_organ/testicles/internal
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

/obj/item/organ/filling_organ/breasts/internal
	name = "internal breasts"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/belly/internal
	name = "internal belly"
	visible_organ = FALSE
	accessory_type = /datum/sprite_accessory/none

/obj/item/organ/filling_organ
	name = "self filling organ"

	//self generating liquid stuff, dont use with absorbing stuff
	var/storage_per_size = 10 //added per organ size
	var/datum/reagent/reagent_to_make = /datum/reagent/consumable/nutriment //naturally generated reagent
	var/refilling = FALSE //slowly refills when not hungry
	var/reagent_generate_rate = HUNGER_FACTOR //with refilling
	var/hungerhelp = FALSE //if refilling, absorbs reagent_to_make as nutrients if hungry. Conversion is to nutrients direct even if you brew poison in there.
	var/uses_nutrient = TRUE //incase someone for some reason wanna make an OP paradox i guess.
	var/organ_sizeable = FALSE //if organ can be resized in prefs etc, SET THIS RIGHT, IT'S IMPORTANT.
	var/max_reagents = 30 //use if organ not sizeable, it auto calculates with sizeable organs and uses it as a base.
	var/startsfilled = FALSE

	//absorbing etc content liquid stuff, non self generated.
	var/absorbing = FALSE //absorbs liquids within slowly. Wont absorb reagent_to_make type, refilling and hungerhelp are irrelevant to this.
	var/absorbrate = 1 //refilling and hungerhelp are irrelevant to this, each life tick. NO LESS THAN 1 DIGESTS RIGHT.
	var/absorbmult = 1.25 //for a longer absorbtion time it's probably fine to have more.
	var/driprate = 0.1
	var/spiller = FALSE //toggles if it will spill its contents when not plugged.
	var/blocker = ITEM_SLOT_SHIRT //pick an item slot
	var/processspeed = 3 SECONDS//will apply the said seconds cooldown each time before any spill or absorb happens.

	//pregnancy vars
	var/fertility = FALSE //can it be impregnated
	var/pregnant = FALSE // is it pregnant
	var/preggotimer //dumbass timer
	var/pre_pregnancy_size = 0
	var/obj/item/organ/pregnantaltorgan = null //change to switch which organ grows from pregnancy of this one. 

	//misc
	var/list/altnames = list("bugged place", "bugged organ") //used in thought messages.
	COOLDOWN_DECLARE(liquidcd)

/obj/item/organ/filling_organ/Insert(mob/living/carbon/M, special, drop_if_replaced) //update size cap n shit on insert
	. = ..()
	if(organ_sizeable)
		max_reagents = rand(1,5) + storage_per_size + storage_per_size * organ_size
	create_reagents(max_reagents)
	if(!refilling)
		startsfilled = FALSE
	if(special && startsfilled) // won't fill the organ if you insert this organ via surgery
		reagents.add_reagent(reagent_to_make, reagents.maximum_volume)

/obj/item/organ/filling_organ/on_life()
	var/mob/living/carbon/human/H = owner

	..()

	//updates size caps
	if(!issimple(H) && H.mind)
		var/athletics = H.mind?.get_skill_level(/datum/skill/misc/athletics)
		var/captarget = max_reagents+(athletics*4)
		if(damage)
			captarget -= damage
		if(contents.len)
			for(var/obj/item/thing as anything in contents)
				if(thing.type != /obj/item/dildo/plug) //plugs wont take space as they are especially for this.
					captarget -= thing.w_class*10
		if(captarget != reagents.maximum_volume)
			if(fertility && pregnant)
				captarget *= 0.5
			reagents.maximum_volume = captarget
			if(H.has_quirk(/datum/quirk/selfawaregeni))
				to_chat(H, span_blue("My [pick(altnames)] may be able to hold a different amount now."))

	if(reagents.total_volume > reagents.maximum_volume + 5) //lil allowance
		visible_message(span_info("[owner]'s [pick(altnames)] spill some of it's contents with the pressure on it!"),span_info("My [pick(altnames)] spill it's excesss contents with the pressure built up on it!"),span_unconscious("I hear a splash."))
		reagents.remove_all(reagents.total_volume - reagents.maximum_volume)
		playsound(owner, 'sound/foley/waterenter.ogg', 15)

	if(damage > low_threshold)
		if(prob(5))
			to_chat(H, span_warning("My [pick(altnames)] aches..."))

	// modify nutrition to generate reagents
	if(refilling) //self-consuming liquids for refilling organs.
		if(owner.nutrition < NUTRITION_LEVEL_HUNGRY) //consumes if hungry
			var/remove_amount = min(reagent_generate_rate, reagents.total_volume)
			if(uses_nutrient)
				owner.adjust_nutrition(remove_amount)
			reagents.remove_reagent(reagent_to_make, remove_amount)
		if((reagents.total_volume < reagents.maximum_volume) && hungerhelp) //if organ is not full
			var/max_restore = owner.nutrition > NUTRITION_LEVEL_FED ? reagent_generate_rate * 2 : reagent_generate_rate
			var/restore_amount = min(max_restore, reagents.maximum_volume - reagents.total_volume) // amount restored if fed, capped by reagents.maximum_volume
			if(uses_nutrient)
				owner.adjust_nutrition(-restore_amount)
			reagents.add_reagent(reagent_to_make, restore_amount)

	if(!COOLDOWN_FINISHED(src, liquidcd))
		return
	if(reagents.total_volume && absorbing) //slowly inject to your blood if they have reagents. Will not work if refilling because i cant properly seperate the reagents for which to keep which to dump.
		reagents.trans_to(owner, absorbrate, absorbmult, TRUE, FALSE)
	if(!contents.len) //if nothing is plugging the hole, stuff will drip out.
		var/tempdriprate = driprate
		if((reagents.total_volume && spiller) || (reagents.total_volume > reagents.maximum_volume)) //spiller or above it's capacity to leak.
			var/obj/item/clothing/blockingitem = H.mob_slot_wearing(blocker)
			if(blockingitem && !blockingitem.genitalaccess) //if worn slot cover it, drip less.
				tempdriprate *= 0.5
				if(H.has_quirk(/datum/quirk/selfawaregeni))
					if(prob(5))
						to_chat(H, pick(span_info("A little bit of [english_list(reagents.reagent_list)] drips from my [pick(altnames)] to my [blockingitem.name]..."),
						span_info("Some liquid drips from my [pick(altnames)] to my [blockingitem.name]."),
						span_info("My [pick(altnames)] spills some liquid to my [blockingitem.name]."),
						span_info("Some [english_list(reagents.reagent_list)] drips from my [pick(altnames)] to my [blockingitem.name].")))
			else
				if(H.has_quirk(/datum/quirk/selfawaregeni))
					if(prob(5))
						to_chat(H, pick(span_info("A little bit of [english_list(reagents.reagent_list)] drips from my [pick(altnames)]..."),
						span_info("Some liquid drips from my [pick(altnames)]."),
						span_info("My [pick(altnames)] spills some liquid."),
						span_info("Some [english_list(reagents.reagent_list)] drips from my [pick(altnames)].")))
			reagents.remove_all(tempdriprate)
	COOLDOWN_START(src, liquidcd, processspeed)

/obj/item/organ/filling_organ/proc/organ_jumped()
	var/mob/living/carbon/human/H = owner
	var/obj/item/organ/filling_organ/forgan = src

	var/stealth = H.mind?.get_skill_level(/datum/skill/misc/sneaking)
	var/keepinsidechance = CLAMP((rand(25,100) - (stealth * 20)),0,100) //basically cant lose your item if you have 5 stealth.
	if(reagents.total_volume > reagents.maximum_volume / 2 && spiller && prob(keepinsidechance)) //if you have more than half full spiller organ.
		visible_message(span_info("[owner]'s [pick(altnames)] spill some of it's contents with the pressure on it!"),span_info("My [pick(altnames)] spill some of it's contents with the pressure on it! [keepinsidechance]%"),span_unconscious("I hear a splash."))
		reagents.remove_all(keepinsidechance)
		playsound(owner, 'sound/foley/waterenter.ogg', 15)

	if(!issimple(H) && H.mind)
		if(contents.len)
			for(var/obj/item/forgancontents as anything in forgan.contents)
				if(!istype(forgancontents, /obj/item/dildo)) //dildo keeps stuff in even if you have no pants ig
					var/obj/item/clothing/blockingitem = get_organ_blocker(H, zone)
					if(!blockingitem || blockingitem.genitalaccess) //checks if the item has genitalaccess, like skirts, if not, it blocks the thing from flying off.
						if(prob(keepinsidechance))
							if(H.client?.prefs.showrolls)
								to_chat(H, span_alert("Damn! I lose my [pick(altnames)]'s grip on [english_list(contents)]! [keepinsidechance]%"))
							else
								to_chat(H, span_alert("Damn! I lose my [pick(altnames)]'s grip on [english_list(contents)]!"))
							playsound(H, 'sound/misc/mat/insert (1).ogg', 20, TRUE, -2, ignore_walls = FALSE)
							forgancontents.doMove(get_turf(H))
							forgan.contents -= forgancontents
							var/yeet = rand(4)
							var/turf/selectedturf = pick(orange(H, yeet)) //object flies off the hole with pressure at a random turf, funny.
							forgancontents.throw_at(selectedturf, yeet, 2)
						else
							if(H.client?.prefs.showrolls)
								if(keepinsidechance < 10)
									to_chat(H, span_blue("I easily maintain my [pick(altnames)]'s grip on [english_list(contents)]. [keepinsidechance]%"))
								else
									to_chat(H, span_info("Phew, I maintain my [pick(altnames)]'s grip on [english_list(contents)]. [keepinsidechance]%"))
							else
								if(keepinsidechance < 10)
									to_chat(H, span_blue("I easily maintain my [pick(altnames)]'s grip on [english_list(contents)]."))
								else
									to_chat(H, span_info("Phew, I maintain my [pick(altnames)]'s grip on [english_list(contents)]."))
				break		

/obj/item/organ/filling_organ/proc/be_impregnated(mob/living/father)
	if(pregnant)
		return
	if(!owner)
		return
	if(owner.stat == DEAD)
		return
	if(owner.has_quirk(/datum/quirk/selfawaregeni))
		to_chat(owner, span_love("I feel a surge of warmth in my [src], I’m definitely pregnant!"))
	reagents.maximum_volume *= 0.5 //ick ock, should make the thing recalculate on next life tick.
	pregnant = TRUE
	if(owner.getorganslot(ORGAN_SLOT_BREASTS)) //shitty default behavior i guess, i aint gonna customiza-ble this fuck that.
		var/obj/item/organ/filling_organ/breasts/breasties = owner.getorganslot(ORGAN_SLOT_BREASTS)
		if(breasties.refilling == FALSE)
			breasties.refilling = TRUE
			if(owner.has_quirk(/datum/quirk/selfawaregeni))
				to_chat(owner, span_love("My breasts should start lactating soon..."))
		if(pregnantaltorgan) //there is no birthing so hopefully 2 hours for one stage is enough to last till round end, there is 0 to 3 belly sizes.
			pre_pregnancy_size = pregnantaltorgan.organ_size
			addtimer(CALLBACK(pregnantaltorgan, PROC_REF(handle_preggoness)), 2 HOURS, TIMER_STOPPABLE)
		else
			pre_pregnancy_size = organ_size
			addtimer(CALLBACK(src, PROC_REF(handle_preggoness)), 2 HOURS, TIMER_STOPPABLE)

/obj/item/organ/filling_organ/proc/handle_preggoness()
	var/datum/sprite_accessory/acc = accessory_type
	to_chat(owner, span_love("I notice my [src] has grown...")) //dont need to repeat this probably if size cant grow anyway.
	if(organ_sizeable)
		if(organ_size < 3)
			organ_size += 1
			acc.get_icon_state()
			owner.update_body_parts(TRUE)
			preggotimer = addtimer(CALLBACK(src, PROC_REF(handle_preggoness)), 2 HOURS, TIMER_STOPPABLE)
		else
			deltimer(preggotimer)

/obj/item/organ/filling_organ/proc/undo_preggoness()
	if(!pregnant)
		return
	deltimer(preggotimer)
	pregnant = FALSE
	to_chat(owner, span_love("I feel my [src] shrink to how it was before. Pregnancy is no more."))
	if(owner.getorganslot(ORGAN_SLOT_BELLY))
		var/obj/item/organ/belly/bellyussy = owner.getorganslot(ORGAN_SLOT_BELLY)
		var/datum/sprite_accessory/belly/bellyacc = bellyussy.accessory_type
		bellyussy.organ_size = pre_pregnancy_size
		bellyacc.get_icon_state()
	owner.update_body_parts(TRUE)

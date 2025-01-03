/mob/living/carbon/human/species/goblin
	name = "goblin"

	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	icon_state = "goblin"
	race = /datum/species/goblin
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest, /obj/item/bodypart/head/goblin, /obj/item/bodypart/l_arm/,
					 /obj/item/bodypart/r_arm, /obj/item/bodypart/r_leg, /obj/item/bodypart/l_leg)
	rot_type = /datum/component/rot/corpse/goblin
	var/gob_outfit = /datum/outfit/job/roguetown/npc/goblin
	ambushable = FALSE
	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw)
	possible_rmb_intents = list()
	erpable = TRUE
	hornychance = 50
	//If someone ends up writing custom messages for goblins, lewd talk could be used ig -vide
	//lewd_talk = TRUE
	//skin color is "e8b59b"
	show_genitals = TRUE  //would be good but colors just wont work.
	skin_tone = "e8b59b"
	hair_color = "291e01"
	var/ball_organ = /obj/item/organ/filling_organ/testicles/goblin
	var/breast_organ = /obj/item/organ/filling_organ/breasts/goblin
	var/ass_organ = /obj/item/organ/butt/goblin
	var/penis_organ = /obj/item/organ/penis/goblin
	var/bounty = 30


/mob/living/carbon/human/species/goblin/unarmed
	gob_outfit = null

/mob/living/carbon/human/species/goblin/cave/unarmed
	gob_outfit = null

/mob/living/carbon/human/species/goblin/npc
	aggressive = 1
	mode = AI_IDLE
	dodgetime = 30 //they can dodge easily, but have a cooldown on it
	flee_in_pain = TRUE

	wander = FALSE

/mob/living/carbon/human/species/goblin/npc/ambush

	wander = TRUE

/mob/living/carbon/human/species/goblin/hell
	name = "hell goblin"
	race = /datum/species/goblin/hell
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/hell
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/hell
	ass_organ = /obj/item/organ/butt/goblin/hell
	penis_organ = /obj/item/organ/penis/goblin/hell

/mob/living/carbon/human/species/goblin/npc/hell
	race = /datum/species/goblin/hell
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/hell
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/hell
	ass_organ = /obj/item/organ/butt/goblin/hell
	penis_organ = /obj/item/organ/penis/goblin/hell

/mob/living/carbon/human/species/goblin/npc/ambush/hell
	race = /datum/species/goblin/hell
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/hell
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/hell
	ass_organ = /obj/item/organ/butt/goblin/hell
	penis_organ = /obj/item/organ/penis/goblin/hell

/datum/species/goblin/hell
	name = "hell goblin"
	raceicon = "goblin_hell"

/mob/living/carbon/human/species/goblin/cave
	name = "cave goblin"
	race = /datum/species/goblin/cave
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/cave
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/cave
	ass_organ = /obj/item/organ/butt/goblin/cave
	penis_organ = /obj/item/organ/penis/goblin/cave

/mob/living/carbon/human/species/goblin/npc/cave
	race = /datum/species/goblin/cave
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/cave
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/cave
	ass_organ = /obj/item/organ/butt/goblin/cave
	penis_organ = /obj/item/organ/penis/goblin/cave
/mob/living/carbon/human/species/goblin/npc/ambush/cave
	race = /datum/species/goblin/cave
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/cave
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/cave
	ass_organ = /obj/item/organ/butt/goblin/cave
	penis_organ = /obj/item/organ/penis/goblin/cave
/datum/species/goblin/cave
	raceicon = "goblin_cave"

/mob/living/carbon/human/species/goblin/sea
	name = "sea goblin"
	race = /datum/species/goblin/sea
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/sea
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/sea
	ass_organ = /obj/item/organ/butt/goblin/sea
	penis_organ = /obj/item/organ/penis/goblin/sea

/mob/living/carbon/human/species/goblin/npc/sea
	race = /datum/species/goblin/sea
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/sea
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/sea
	ass_organ = /obj/item/organ/butt/goblin/sea
	penis_organ = /obj/item/organ/penis/goblin/sea

/mob/living/carbon/human/species/goblin/npc/ambush/sea
	race = /datum/species/goblin/sea
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/sea
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/sea
	ass_organ = /obj/item/organ/butt/goblin/sea
	penis_organ = /obj/item/organ/penis/goblin/sea

/datum/species/goblin/sea
	raceicon = "goblin_sea"

/mob/living/carbon/human/species/goblin/moon
	name = "moon goblin"
	race = /datum/species/goblin/moon
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/moon
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/moon
	ass_organ = /obj/item/organ/butt/goblin/moon
	penis_organ = /obj/item/organ/penis/goblin/moon

/mob/living/carbon/human/species/goblin/npc/moon
	race = /datum/species/goblin/moon
	race = /datum/species/goblin/moon
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/moon
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/moon
	ass_organ = /obj/item/organ/butt/goblin/moon
	penis_organ = /obj/item/organ/penis/goblin/moon

/mob/living/carbon/human/species/goblin/npc/ambush/moon
	race = /datum/species/goblin/moon
	race = /datum/species/goblin/moon
	ball_organ = /obj/item/organ/filling_organ/testicles/goblin/moon
	breast_organ = /obj/item/organ/filling_organ/breasts/goblin/moon
	ass_organ = /obj/item/organ/butt/goblin/moon
	penis_organ = /obj/item/organ/penis/goblin/moon

/datum/species/goblin/moon
	id = "goblin_moon"
	raceicon = "goblin_moon"

/datum/species/goblin/moon/spec_death(gibbed, mob/living/carbon/human/H)
	new /obj/item/reagent_containers/powder/moondust/purest(get_turf(H))
	H.visible_message(span_blue("Moondust falls from [H]!"))
//	qdel(H)

/mob/living/carbon/human/species/goblin/npc/horny
	seeksfuck = TRUE


/* //why not
/obj/item/bodypart/chest/goblin
	dismemberable = 0
/obj/item/bodypart/l_arm/goblin
	dismemberable = 0
/obj/item/bodypart/r_arm/goblin
	dismemberable = 0
/obj/item/bodypart/r_leg/goblin
	dismemberable = 0
/obj/item/bodypart/l_leg/goblin
	dismemberable = 0
*/

/obj/item/bodypart/head/goblin/update_icon_dropped()
	return

/obj/item/bodypart/head/goblin/get_limb_icon(dropped, hideaux = FALSE)
	return

/obj/item/bodypart/head/goblin/skeletonize()
	. = ..()
	icon_state = "goblin_skel_head"
	sellprice = 2



/datum/species/goblin
	name = "goblin"
	id = "goblin"
	species_traits = list(NO_UNDERWEAR,NOEYESPRITES)
	inherent_traits = list(TRAIT_NOROGSTAM,TRAIT_RESISTCOLD,TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE,TRAIT_RADIMMUNE,TRAIT_CRITICAL_WEAKNESS)
	nojumpsuit = 1
	sexes = 1
	offset_features = list(OFFSET_HANDS = list(0,-4), OFFSET_HANDS_F = list(0,-4))
	damage_overlay_type = ""
	organs = list(
		ORGAN_SLOT_BRAIN = /obj/item/organ/brain,
		ORGAN_SLOT_HEART = /obj/item/organ/heart,
		ORGAN_SLOT_LUNGS = /obj/item/organ/lungs,
		ORGAN_SLOT_EYES = /obj/item/organ/eyes,
		ORGAN_SLOT_EARS = /obj/item/organ/ears/goblin,
		ORGAN_SLOT_TONGUE = /obj/item/organ/tongue,
		ORGAN_SLOT_LIVER = /obj/item/organ/liver,
		ORGAN_SLOT_STOMACH = /obj/item/organ/stomach,
		ORGAN_SLOT_APPENDIX = /obj/item/organ/appendix,
		ORGAN_SLOT_ANUS = /obj/item/organ/filling_organ/anus,
		)
	offset_features = list(
		OFFSET_ID = list(0,-4), OFFSET_GLOVES = list(0,0), OFFSET_WRISTS = list(0,0),\
		OFFSET_CLOAK = list(0,0), OFFSET_FACEMASK = list(0,-4), OFFSET_HEAD = list(0,-4), \
		OFFSET_FACE = list(0,-4), OFFSET_BELT = list(0,-4), OFFSET_BACK = list(0,-3), \
		OFFSET_NECK = list(0,-4), OFFSET_MOUTH = list(0,-4), OFFSET_PANTS = list(0,0), \
		OFFSET_SHIRT = list(0,0), OFFSET_ARMOR = list(0,0), OFFSET_HANDS = list(0,-3), \
		OFFSET_ID_F = list(0,-5), OFFSET_GLOVES_F = list(0,-4), OFFSET_WRISTS_F = list(0,-4), OFFSET_HANDS_F = list(0,-4), \
		OFFSET_CLOAK_F = list(0,0), OFFSET_FACEMASK_F = list(0,-5), OFFSET_HEAD_F = list(0,-5), \
		OFFSET_FACE_F = list(0,-5), OFFSET_BELT_F = list(0,-4), OFFSET_BACK_F = list(0,-4), \
		OFFSET_NECK_F = list(0,-5), OFFSET_MOUTH_F = list(0,-5), OFFSET_BUTT = list(0,-4), OFFSET_PANTS_F = list(0,0), \
		OFFSET_SHIRT_F = list(0,0), OFFSET_ARMOR_F = list(0,0), OFFSET_UNDIES = list(0,0), OFFSET_UNDIES_F = list(0,0), \
		)
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	var/raceicon = "goblin"
	fixed_mut_color = "e8b59b"
	custom_clothes = TRUE
	use_f = TRUE
	clothes_id = "dwarf"


/datum/species/goblin/regenerate_icons(mob/living/carbon/human/H)
//	H.cut_overlays()
	H.icon_state = ""
	if(H.notransform)
		return 1
	H.update_inv_hands()
	H.update_inv_handcuffed()
	H.update_inv_legcuffed()
	H.update_fire()
	H.update_body()
	var/mob/living/carbon/human/species/goblin/G = H
	G.update_wearable()
	H.update_transform()
	return TRUE

/mob/living/carbon/human/species/goblin/update_body()
	remove_overlay(BODY_LAYER)
	if(!dna || !dna.species)
		return
	var/datum/species/goblin/G = dna.species
	if(!istype(G))
		return
	icon_state = ""
	var/list/standing = list()
	var/mutable_appearance/body_overlay
	var/obj/item/bodypart/chesty = get_bodypart("chest")
	var/obj/item/bodypart/headdy = get_bodypart("head")
	if(!headdy)
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "goblin_skel_decap", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]_decap", -BODY_LAYER)
	else
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "goblin_skel", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]", -BODY_LAYER)

	if(body_overlay)
		standing += body_overlay
	if(standing.len)
		overlays_standing[BODY_LAYER] = standing

	apply_overlay(BODY_LAYER)
	dna.species.update_damage_overlays()

/mob/living/carbon/human/species/goblin/proc/update_wearable()
	remove_overlay(ARMOR_LAYER)

	var/list/standing = list()
	var/mutable_appearance/body_overlay
	if(wear_armor)
		body_overlay = mutable_appearance(icon, "[wear_armor.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(wear_pants)
		body_overlay = mutable_appearance(icon, "[wear_pants.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(head)
		body_overlay = mutable_appearance(icon, "[head.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(standing.len)
		overlays_standing[ARMOR_LAYER] = standing

	apply_overlay(ARMOR_LAYER)

/mob/living/carbon/human/species/goblin/update_inv_head()
	update_wearable()
/mob/living/carbon/human/species/goblin/update_inv_pants()
  	update_wearable()
/mob/living/carbon/human/species/goblin/update_inv_armor()
	update_wearable()

/datum/species/goblin/update_damage_overlays(mob/living/carbon/human/H)
	return

/mob/living/carbon/human/species/goblin/Initialize()
	if(prob(50))
		gender = FEMALE
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)

/mob/living/carbon/human/species/goblin/handle_combat()
	if(mode == AI_HUNT)
		if(prob(2))
			emote("laugh")
	. = ..()

/mob/living/carbon/human/species/goblin/after_creation()
	..()
	if(src.dna && src.dna.species)
		src.dna.species.soundpack_m = new /datum/voicepack/male/goblin()
		src.dna.species.soundpack_f = new /datum/voicepack/male/goblin()
		var/obj/item/headdy = get_bodypart("head")
		if(headdy)
			headdy.icon = 'icons/roguetown/mob/monster/goblins.dmi'
			headdy.icon_state = "[src.dna.species.id]_head"
			headdy.sellprice = bounty
	src.grant_language(/datum/language/orcish)
	var/obj/item/organ/eyes/eyes = src.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(src,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/wild_goblin
	eyes.Insert(src)
	if(src.charflaw)
		QDEL_NULL(src.charflaw)
	update_body()
	faction = list("orcs")
	name = "goblin"
	real_name = "goblin"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
//	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)
//	blue breathes underwater, need a new specific one for this maybe organ cheque
//	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	if(gob_outfit)
		var/datum/outfit/O = new gob_outfit
		if(O)
			equipOutfit(O)

/datum/component/rot/corpse/goblin/process()
	var/amt2add = 10 //1 second
	if(last_process)
		amt2add = ((world.time - last_process)/10) * amt2add
	last_process = world.time
	amount += amt2add
	var/mob/living/carbon/C = parent
	if(!C)
		qdel(src)
		return
	if(C.stat != DEAD)
		qdel(src)
		return
	var/should_update = FALSE
	if(amount > 8 MINUTES)
		C.visible_message(span_notice("The Goblin decomposes..."))
		qdel(C)
		/*
		for(var/obj/item/bodypart/B in C.bodyparts)
			if(!B.skeletonized)
				B.skeletonized = TRUE
				should_update = TRUE*/
	else if(amount > 4 MINUTES)
		for(var/obj/item/bodypart/B in C.bodyparts)
			if(!B.rotted)
				B.rotted = TRUE
				should_update = TRUE
			if(B.rotted)
				var/turf/open/T = C.loc
				if(istype(T))
					T.add_pollutants(/datum/pollutant/rot, 1)
	if(should_update)
		if(amount > 8 MINUTES)
			C.update_body()
			qdel(src)
			return
		else if(amount > 4 MINUTES)
			C.update_body()

/////
////
////
//// OUTFGITS						//////////////////
////
///

/datum/outfit/job/roguetown/npc/goblin/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 8
	if(is_species(H, /datum/species/goblin/moon))
		H.STASPD = 15
	else
		H.STASPD = 13
	H.STACON = 6
	H.STAEND = 15
	if(is_species(H, /datum/species/goblin/moon))
		H.STAINT = 9
	else
		H.STAINT = 7
	var/loadout = rand(1,6)
	switch(loadout)

		if(1) //spear
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
			r_hand = /obj/item/rogueweapon/spear
			armor = /obj/item/clothing/suit/roguetown/armor/leather/goblin
			pants = /obj/item/clothing/under/roguetown/loincloth/goblinloin
			if(prob(80))
				head = /obj/item/clothing/head/roguetown/helmet/leather/goblin
			if(prob(50))
				l_hand = /obj/item/rogueweapon/shield/wood

		if(2) //axe
			H.change_stat("strength", 1)
			H.change_stat("speed", -1)
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
			r_hand = /obj/item/rogueweapon/stoneaxe/handaxe
			armor = /obj/item/clothing/suit/roguetown/armor/leather/goblin
			pants = /obj/item/clothing/under/roguetown/loincloth/goblinloin
			if(prob(80))
				head = /obj/item/clothing/head/roguetown/helmet/leather/goblin
			if(prob(50))
				l_hand = /obj/item/rogueweapon/shield/wood

		if(3) //maces
			H.change_stat("strength", 2)
			H.change_stat("speed", -2)
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE) //Just in case a player takes over an npc
			r_hand = /obj/item/rogueweapon/mace
			armor = /obj/item/clothing/suit/roguetown/armor/leather/goblin
			pants = /obj/item/clothing/under/roguetown/loincloth/goblinloin
			if(prob(80))
				head = /obj/item/clothing/head/roguetown/helmet/leather/goblin
			if(prob(50))
				l_hand = /obj/item/rogueweapon/shield/wood

		if(4) //knives
			H.change_stat("strength", -1)
			H.change_stat("speed", 1)
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 2, TRUE)
			r_hand = /obj/item/rogueweapon/huntingknife/idagger
			armor = /obj/item/clothing/suit/roguetown/armor/leather/goblin
			pants = /obj/item/clothing/under/roguetown/loincloth/goblinloin
			if(prob(80))
				head = /obj/item/clothing/head/roguetown/helmet/leather/goblin
			if(prob(50))
				l_hand = /obj/item/rogueweapon/huntingknife/idagger
			else
				if(prob(50))
					l_hand = /obj/item/rogueweapon/shield/wood

		if(5) //swords
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
			r_hand = /obj/item/rogueweapon/sword/iron
			armor = /obj/item/clothing/suit/roguetown/armor/leather/goblin
			pants = /obj/item/clothing/under/roguetown/loincloth/goblinloin
			if(prob(80))
				head = /obj/item/clothing/head/roguetown/helmet/leather/goblin
			if(prob(50))
				l_hand = /obj/item/rogueweapon/shield/wood

		if(6) //tribal club with rope for lewd
			r_hand = /obj/item/rogueweapon/mace/woodclub
			l_hand = /obj/item/rope
			//pants = /obj/item/clothing/under/roguetown/loincloth/goblinloin //lewd goblins don't need lioncloths i guess
			H.seeksfuck = TRUE

/mob/living/carbon/human/species/goblin/npc/sergeant
	name = "goblin sergeant" //Heavy Armored Sergeants
	bounty = 50
	gob_outfit = /datum/outfit/job/roguetown/npc/goblin/sergeant

/mob/living/carbon/human/species/goblin/npc/moon/sergeant
	name = "goblin sergeant" //Mooned
	bounty = 50
	gob_outfit = /datum/outfit/job/roguetown/npc/goblin/sergeant

/datum/outfit/job/roguetown/npc/goblin/sergeant/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 11
	if(is_species(H, /datum/species/goblin/moon))
		H.STASPD = 15
	else
		H.STASPD = 13
	H.STACON = 6
	H.STAEND = 15
	if(is_species(H, /datum/species/goblin/moon))
		H.STAINT = 9
	else
		H.STAINT = 7
	var/loadout = rand(1,4)
	switch(loadout)

		if(1) //swords
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/goblin
			head = /obj/item/clothing/head/roguetown/helmet/goblin
			r_hand = /obj/item/rogueweapon/sword/sabre
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE) //They lived through enough raids to get experience that matters
			l_hand = /obj/item/rogueweapon/shield/wood
			pants = /obj/item/clothing/under/roguetown/loincloth/goblinloin

		if(2) //spears
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/goblin
			head = /obj/item/clothing/head/roguetown/helmet/goblin
			r_hand =/obj/item/rogueweapon/eaglebeak
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
			pants = /obj/item/clothing/under/roguetown/loincloth/goblinloin

		if(3) //maces
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/goblin
			head = /obj/item/clothing/head/roguetown/helmet/goblin
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
			r_hand = /obj/item/rogueweapon/mace/steel
			l_hand = /obj/item/rogueweapon/shield/wood
			pants = /obj/item/clothing/under/roguetown/loincloth/goblinloin

		if(4) //axes
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/goblin
			head = /obj/item/clothing/head/roguetown/helmet/goblin
			if(H.mind)
				H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
			r_hand = /obj/item/rogueweapon/stoneaxe/battle
			l_hand = /obj/item/rogueweapon/shield/wood
			pants = /obj/item/clothing/under/roguetown/loincloth/goblinloin

///
///
///
/// INVADER ZIM
///
///
///

/obj/structure/gob_portal
	name = "Gob Portal"
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "shitportal"
	max_integrity = 200
	anchored = TRUE
	density = FALSE
	layer = BELOW_OBJ_LAYER
	var/gobs = 0
	var/maxgobs = 3
	var/sergeants = 0 //You there, check out that noise
	var/datum/looping_sound/boneloop/soundloop
	var/spawning = FALSE
	var/moon_goblins = 0
	attacked_sound = 'sound/vo/mobs/ghost/skullpile_hit.ogg'

/obj/structure/gob_portal/Initialize()
	. = ..()
	soundloop = new(list(src), FALSE)
	soundloop.start()
	spawn_gob()

/obj/structure/gob_portal/attack_ghost(mob/dead/observer/user)
	if(QDELETED(user))
		return
	if(!in_range(src, user))
		return
	if(gobs >= (maxgobs+1))
		to_chat(user, span_danger("Too many Gobs."))
		return
	gobs++
	var/mob/living/carbon/human/species/goblin/npc/N = new (get_turf(src))
	N.key = user.key
	qdel(user)


/obj/structure/gob_portal/proc/creategob()
	if(QDELETED(src))
		return
	if(!spawning)
		return
	spawning = FALSE
	if(sergeants == 0)
		if(prob(50))
			if(GLOB.tod == "night") //100% chance
				new /mob/living/carbon/human/species/goblin/npc/moon/sergeant(get_turf(src))
			else
				new /mob/living/carbon/human/species/goblin/npc/sergeant(get_turf(src))
		else
			new	/mob/living/carbon/human/species/halforc/orc_raider/npc(get_turf(src))
		sergeants++
		gobs++
	if(moon_goblins == 0)
		if(GLOB.tod == "night")
			if(prob(30))
				moon_goblins = 1
			else
				moon_goblins = 2
	if(moon_goblins == 1)
		new /mob/living/carbon/human/species/goblin/npc/moon(get_turf(src))
	else
		new /mob/living/carbon/human/species/goblin/npc(get_turf(src))
	gobs++
	update_icon()
	if(gobs < maxgobs)
		spawn_gob()

/obj/structure/gob_portal/proc/spawn_gob()
	if(QDELETED(src))
		return
	if(spawning)
		return
	spawning = TRUE
	update_icon()
	addtimer(CALLBACK(src, PROC_REF(creategob)), 2 SECONDS)

/obj/structure/gob_portal/Destroy()
	soundloop.stop()
	. = ..()

//gotta not randomize the sizes cuz bandaid fix, also to give them their proper organs.
/mob/living/carbon/human/species/goblin/give_genitals()
	erpable = TRUE
	if(sexcon == null)
		sexcon = new /datum/sex_controller(src)
	if(!issimple(src))
		var/mob/living/carbon/human/species/user = src
		if(!user.getorganslot(ORGAN_SLOT_ANUS))
			var/obj/item/organ/filling_organ/anus/ass = user.getorganslot(ORGAN_SLOT_ANUS)
			ass = new /obj/item/organ/filling_organ/anus
			ass.Insert(user, TRUE)
		if(gender == MALE)
			var/obj/item/organ/filling_organ/testicles/testicles = user.getorganslot(ORGAN_SLOT_TESTICLES)
			if(!show_genitals)
				testicles = new /obj/item/organ/filling_organ/testicles/internal
			else
				testicles = new  ball_organ
			testicles.Insert(user, TRUE)
			var/obj/item/organ/penis/penis = user.getorganslot(ORGAN_SLOT_PENIS)
			if(!show_genitals)
				penis = new /obj/item/organ/penis/internal
			else
				penis = new penis_organ
			penis.Insert(user, TRUE)
		if(gender == FEMALE)
			var/obj/item/organ/butt/buttie = user.getorganslot(ORGAN_SLOT_BUTT)
			if(!show_genitals)
				buttie = new /obj/item/organ/butt/internal
			else
				buttie = new ass_organ
			if(buttie)
				buttie.Insert(user, TRUE)
			var/obj/item/organ/filling_organ/breasts/breasts = user.getorganslot(ORGAN_SLOT_BREASTS)
			if(!show_genitals)
				breasts = new /obj/item/organ/filling_organ/breasts/internal
			else
				breasts = new breast_organ
			breasts.organ_size = rand(3,4)
			breasts.Insert(user, TRUE)
			var/obj/item/organ/filling_organ/vagina/vagina = user.getorganslot(ORGAN_SLOT_VAGINA)
			if(!show_genitals)
				vagina = new /obj/item/organ/filling_organ/vagina/internal
			else
				vagina = new /obj/item/organ/filling_organ/vagina/goblin
			vagina.Insert(user, TRUE)
			if(prob(3)) //3 chance to be dickgirl.
				var/obj/item/organ/filling_organ/testicles/testicles = user.getorganslot(ORGAN_SLOT_TESTICLES)
				if(!show_genitals)
					testicles = new /obj/item/organ/filling_organ/testicles/internal
				else
					testicles = new ball_organ
				testicles.Insert(user, TRUE)
				var/obj/item/organ/penis/penis = user.getorganslot(ORGAN_SLOT_PENIS)
				if(!show_genitals)
					penis = new /obj/item/organ/penis/internal
				else
					penis = new penis_organ
				penis.Insert(user, TRUE)
//	src.sexcon.manual_arousal = SEX_MANUAL_AROUSAL_MAX


//custom genital slop, could not do it a better way.

/obj/item/organ/butt/goblin
	name = "goblin butt"
	accessory_type = /datum/sprite_accessory/butt/goblin

/datum/sprite_accessory/butt/goblin
	name = "goblin butt"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblin"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/penis/goblin
	name = "goblin penis"
	accessory_type = /datum/sprite_accessory/penis/goblin

/datum/sprite_accessory/penis/goblin
	name = "goblin penis"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblin"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/testicles/goblin
	name = "goblin testicles"
	accessory_type = /datum/sprite_accessory/testicles/goblin

/datum/sprite_accessory/testicles/goblin
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinballs"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/breasts/goblin
	name = "goblin breasts"
	accessory_type = /datum/sprite_accessory/breasts/goblin

/datum/sprite_accessory/breasts/goblin
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinbreasts"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/vagina/goblin
	name = "goblin vagina"
	accessory_type = /datum/sprite_accessory/vagina/goblin

/datum/sprite_accessory/vagina/goblin
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinpussy"
	color_key_defaults = list(KEY_SKIN_COLOR)

//

/obj/item/organ/butt/goblin/sea
	name = "goblin butt"
	accessory_type = /datum/sprite_accessory/butt/goblin/sea

/datum/sprite_accessory/butt/goblin/sea
	name = "goblin butt"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinsea"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/penis/goblin/sea
	name = "goblin penis"
	accessory_type = /datum/sprite_accessory/penis/goblin/sea

/datum/sprite_accessory/penis/goblin/sea
	name = "goblin penis"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinsea"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/testicles/goblin/sea
	name = "goblin testicles"
	accessory_type = /datum/sprite_accessory/testicles/goblin/sea

/datum/sprite_accessory/testicles/goblin/sea
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinseaballs"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/breasts/goblin/sea
	name = "goblin breasts"
	accessory_type = /datum/sprite_accessory/breasts/goblin/sea

/datum/sprite_accessory/breasts/goblin/sea
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinseabreasts"
	color_key_defaults = list(KEY_SKIN_COLOR)

//

/obj/item/organ/butt/goblin/cave
	name = "goblin butt"
	accessory_type = /datum/sprite_accessory/butt/goblin/cave

/datum/sprite_accessory/butt/goblin/cave
	name = "goblin butt"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblincave"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/penis/goblin/cave
	name = "goblin penis"
	accessory_type = /datum/sprite_accessory/penis/goblin/cave

/datum/sprite_accessory/penis/goblin/cave
	name = "goblin penis"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblincave"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/testicles/goblin/cave
	name = "goblin testicles"
	accessory_type = /datum/sprite_accessory/testicles/goblin/cave

/datum/sprite_accessory/testicles/goblin/cave
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblincaveballs"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/breasts/goblin/cave
	name = "goblin breasts"
	accessory_type = /datum/sprite_accessory/breasts/goblin/cave

/datum/sprite_accessory/breasts/goblin/cave
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblincavebreasts"
	color_key_defaults = list(KEY_SKIN_COLOR)
//

/obj/item/organ/butt/goblin/hell
	name = "goblin butt"
	accessory_type = /datum/sprite_accessory/butt/goblin/hell

/datum/sprite_accessory/butt/goblin/hell
	name = "goblin butt"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinhell"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/penis/goblin/hell
	name = "goblin penis"
	accessory_type = /datum/sprite_accessory/penis/goblin/hell

/datum/sprite_accessory/penis/goblin/hell
	name = "goblin penis"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinhell"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/testicles/goblin/hell
	name = "goblin testicles"
	accessory_type = /datum/sprite_accessory/testicles/goblin/hell

/datum/sprite_accessory/testicles/goblin/hell
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinhellballs"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/breasts/goblin/hell
	name = "goblin breasts"
	accessory_type = /datum/sprite_accessory/breasts/goblin/hell

/datum/sprite_accessory/breasts/goblin/hell
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinhellbreasts"
	color_key_defaults = list(KEY_SKIN_COLOR)

//

/obj/item/organ/butt/goblin/moon
	name = "goblin butt"
	accessory_type = /datum/sprite_accessory/butt/goblin/moon

/datum/sprite_accessory/butt/goblin/moon
	name = "goblin butt"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinmoon"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/penis/goblin/moon
	name = "goblin penis"
	accessory_type = /datum/sprite_accessory/penis/goblin/moon

/datum/sprite_accessory/penis/goblin/moon
	name = "goblin penis"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinmoon"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/testicles/goblin/moon
	name = "goblin testicles"
	accessory_type = /datum/sprite_accessory/testicles/goblin/moon

/datum/sprite_accessory/testicles/goblin/moon
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinmoonballs"
	color_key_defaults = list(KEY_SKIN_COLOR)

/obj/item/organ/filling_organ/breasts/goblin/moon
	name = "goblin breasts"
	accessory_type = /datum/sprite_accessory/breasts/goblin/moon

/datum/sprite_accessory/breasts/goblin/moon
	name = "goblin"
	icon = 'modular_stonehedge/icons/roguetown/mob/monster/goblinbits.dmi'
	icon_state = "goblinmoonbreasts"
	color_key_defaults = list(KEY_SKIN_COLOR)

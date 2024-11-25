//based on hearthstone sea raiders.
//funny modifications By Vide noir.

/mob/living/carbon/human/species/human/friendlynpc
	aggressive=1
	mode = AI_IDLE
	faction = list("Station")
	bodyparts = list(/obj/item/bodypart/chest, /obj/item/bodypart/head, /obj/item/bodypart/l_arm,
					 /obj/item/bodypart/r_arm, /obj/item/bodypart/r_leg, /obj/item/bodypart/l_leg)
	ambushable = FALSE
	dodgetime = 30
	flee_in_pain = TRUE
	possible_rmb_intents = list()
	wander = TRUE
	erpable = TRUE
	var/list/friendlyfactions = list("Station", "neutral")
	var/list/friendlyjobs
	//quotes from skyrim cause we love skyrim.
	var/list/calmmessages = list()
	var/list/aggromessages = list()

/mob/living/carbon/human/species/human/friendlynpc/should_target(mob/living/L)
	if(L.stat != CONSCIOUS)
		return FALSE
	if(ishuman(L))
		var/mob/living/carbon/human/madafaka = L
		if(friendlyfactions)
			if(friendlyfactions)
				if(madafaka.faction[1] in friendlyfactions && target != madafaka)
					return FALSE
		if(friendlyjobs)
			if(madafaka.job in friendlyjobs && target != madafaka)
				return FALSE
		if(madafaka.Adjacent(src))
			if(prob(10))
				say(pick(calmmessages))
	. = ..()

/mob/living/carbon/human/species/human/friendlynpc/townguard
	calmmessages = list(
		"Let me guess... someone stole your sweetroll.", 
		"I used to be an adventurer like you. Then I took an arrow in the knee...", 
		"Disrespect the law, and you disrespect me.", 
		"What do you need?", 
		"Trouble?",
		"What is it?",
		"No lollygaggin'.",
		"My cousin's out fighting dragons, and what do I get? Guard duty.",
		"Gotta keep my eyes open. Damn dragons could swoop down at any time.",
		"Fear not. Come dragon or giant, we'll be ready.",
		"Brigands I can handle, but this talk of dragons? World's gone mad, I say.",
		"Everything's in order.",
		"Staying safe I hope.",
		"Everything all right?",
		"Could sure use a warm bed right about now...",
		"I'd be a lot warmer and a lot happier with a bellyful of mead...",
		"I mostly deal with petty thievery and drunken brawls. Been too long since we've had a good bandit raid.",
		"What is it? Dragons?",
		"Watch the skies, traveler.",
		"No matter what else happens, the guards will always be grateful for everything you've done.",
		"I fear the night. Because the werewolves and vampires don't.",
		"Just a few more hours and I can crawl under some furs...",
		)
	aggromessages = list(
		"Never should have come here!",
		"Then let me speed your passage to Yamais' hands!",
		"Then pay with your blood!",
		"That can be arranged!",
		"So be it!",
		"You have sealed your fate!",
		"You cannot escape the righteous!",
		"Fool!",
		"You will pay, with your blood!",
		)

/mob/living/carbon/human/species/human/friendlynpc/townguard/brute

/mob/living/carbon/human/species/human/friendlynpc/townguard/brute/after_creation()
	equipOutfit(new /datum/outfit/job/roguetown/human/species/human/friendlynpc/townguard/brute)


/mob/living/carbon/human/species/human/friendlynpc/townguard/retaliate(mob/living/L)
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
		if(target != newtarg)
			say(pick(aggromessages))
			linepoint(target)

/mob/living/carbon/human/species/human/friendlynpc/townguard/Initialize()
	. = ..()
	set_species(/datum/species/elf)
	spawn(10)
		after_creation()
	//addtimer(CALLBACK(src, PROC_REF(after_creation)), 10)

/mob/living/carbon/human/species/human/friendlynpc/townguard/after_creation()
	..()
	job = "Town Guardsman"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/human/species/human/friendlynpc/townguard)
	var/obj/item/organ/eyes/organ_eyes = getorgan(/obj/item/organ/eyes)
	if(organ_eyes)
		organ_eyes.eye_color = pick("27becc", "35cc27", "000000")
	update_hair()
	update_body()

/mob/living/carbon/human/species/human/friendlynpc/townguard/npc_idle()
	if(m_intent == MOVE_INTENT_SNEAK)
		return
	if(world.time < next_idle)
		return
	next_idle = world.time + rand(30, 70)
	if((mobility_flags & MOBILITY_MOVE) && isturf(loc) && wander)
		if(prob(20))
			var/turf/T = get_step(loc,pick(GLOB.cardinals))
			if(!istype(T, /turf/open/transparent/openspace))
				Move(T)
		else
			face_atom(get_step(src,pick(GLOB.cardinals)))
	if(!wander && prob(10))
		face_atom(get_step(src,pick(GLOB.cardinals)))

/mob/living/carbon/human/species/human/friendlynpc/townguard/handle_combat()
	if(mode == AI_HUNT)
		if(prob(50))
			emote("rage")
	. = ..()

/datum/outfit/job/roguetown/human/species/human/friendlynpc/townguard/pre_equip(mob/living/carbon/human/H)
	if(prob(50))
		wrists = /obj/item/clothing/wrists/roguetown/bracers
	cloak = /obj/item/clothing/cloak/templar/dendor
	gloves = /obj/item/clothing/gloves/roguetown/forestergauntlets
	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/foresterarmor
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
	if(prob(50))
		shirt = /obj/item/clothing/suit/roguetown/shirt/tunic
	pants = /obj/item/clothing/under/roguetown/tights
	head = /obj/item/clothing/head/roguetown/helmet/foresterhelmet
	H.STASPD = 8
	H.STACON = 4
	H.STAEND = 15
	H.STAINT = 1
	H.STASTR = rand(11,16)
	if(prob(50))
		r_hand = /obj/item/rogueweapon/sword
	else
		r_hand = /obj/item/rogueweapon/stoneaxe/battle
	l_hand = /obj/item/rogueweapon/shield/wood
	shoes = /obj/item/clothing/shoes/roguetown/boots/forestershoes
	if(prob(30))
		neck = /obj/item/clothing/neck/roguetown/chaincoif
		H.eye_color = pick("27becc", "35cc27", "000000")
	H.hair_color = pick ("4f4f4f", "61310f", "faf6b9")
	H.facial_hair_color = H.hair_color
	if(H.gender == MALE)
		H.name = pick( world.file2list("strings/rt/names/human/humnorm.txt") )
		H.real_name = H.name
	else
		H.name = pick( world.file2list("strings/rt/names/human/humnorf.txt") )
		H.real_name = H.name

/datum/outfit/job/roguetown/human/species/human/friendlynpc/townguard/brute/pre_equip(mob/living/carbon/human/H)
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	cloak = /obj/item/clothing/cloak/templar/dendor
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	shirt = /obj/item/clothing/suit/roguetown/shirt/tunic
	pants = /obj/item/clothing/under/roguetown/chainlegs
	head = /obj/item/clothing/head/roguetown/helmet/elfbarbutewings
	if(prob(60))
		mask = /obj/item/clothing/mask/rogue/facemask
	gloves = /obj/item/clothing/gloves/roguetown/chain
	H.STASPD = 9
	H.STACON = 8
	H.STAEND = 15
	H.STAINT = 1
	H.STASTR = rand(15,18)
	if(prob(50))
		r_hand = /obj/item/rogueweapon/halberd/bardiche
	else
		r_hand = /obj/item/rogueweapon/greatsword
	shoes = /obj/item/clothing/shoes/roguetown/boots/armoriron
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	if(H.gender == MALE)
		H.name = pick( world.file2list("strings/rt/names/human/humnorm.txt") )
		H.real_name = H.name
	else
		H.name = pick( world.file2list("strings/rt/names/human/humnorf.txt") )
		H.real_name = H.name

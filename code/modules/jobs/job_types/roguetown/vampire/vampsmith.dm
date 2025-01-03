/datum/job/roguetown/vampire/vampsmith
	title = "Underdark Smithy"
	flag = VAMPSMITH
	department_flag = VAMPIRE
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	show_in_credits = FALSE		//Stops Scom from announcing their arrival.
	spells = list(/obj/effect/proc_holder/spell/self/convertrole/vampire,
	/obj/effect/proc_holder/spell/targeted/shapeshift/bat)
	tutorial = "You studied for many decades under your master with a few other apprentices to become an Armorer, a trade that certainly has seen a boom in revenue in recent times with many a bannerlord seeing the importance in maintaining a well-equipped army."
	whitelist_req = FALSE
	outfit = /datum/outfit/job/roguetown/vampsmith
	display_order = JDO_VAMPSMITH
	min_pq = 5
	max_pq = null
	cmode_music = 'sound/music/combat_vamp.ogg'

/datum/outfit/job/roguetown/vampsmith/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list(
		"Weaponsmith", //Weapons
		"Armorsmith", //Armor
		)

	var/classchoice = input("Choose your specialization", "Available styles") as anything in classes


	switch(classchoice)

		if("Weaponsmith")
			H.set_blindness(0)
			ADD_TRAIT(H, TRAIT_WEAPONSMITH, TRAIT_GENERIC)

		if("Armorsmith")
			H.set_blindness(0)
			ADD_TRAIT(H, TRAIT_ARMORSMITH, TRAIT_GENERIC)

	head = /obj/item/clothing/head/roguetown/hatfur
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/hatblu
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/blacksmithing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/smelting, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)

	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/trou
		shoes = /obj/item/clothing/shoes/roguetown/boots/leather
		shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/rogueweapon/hammer = 1, /obj/item/rogueweapon/tongs = 1)
		belt = /obj/item/storage/belt/rogue/leather
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/roguekey/blacksmith
		cloak = /obj/item/clothing/cloak/apron/blacksmith
	else
		pants = /obj/item/clothing/under/roguetown/trou
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/gen/random
		backr = /obj/item/storage/backpack/rogue/satchel
		backpack_contents = list(/obj/item/rogueweapon/hammer = 1, /obj/item/rogueweapon/tongs = 1)
		shoes = /obj/item/clothing/shoes/roguetown/shortboots
		belt = /obj/item/storage/belt/rogue/leather
		cloak = /obj/item/clothing/cloak/apron/blacksmith
		beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
		beltr = /obj/item/roguekey/blacksmith
	H.change_stat("strength", 2)
	H.change_stat("intelligence", 1)
	H.change_stat("endurance", 2)
	H.change_stat("constitution", 2)

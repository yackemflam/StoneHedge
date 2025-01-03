//shield
/datum/advclass/cleric
	name = "Cleric"
	tutorial = "Clerics are wandering warriors of the Gods, an asset to any party."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	vampcompat = FALSE
	outfit = /datum/outfit/job/roguetown/adventurer/cleric
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/combat_clergy.ogg'

/datum/outfit/job/roguetown/adventurer/cleric
	allowed_patrons = ALL_CLERIC_PATRONS

/datum/outfit/job/roguetown/adventurer/cleric/pre_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE
	switch(H.patron?.type)
		if(/datum/patron/divine/elysius)
			neck = /obj/item/clothing/neck/roguetown/psicross/astrata
		if(/datum/patron/inhumen/levishth)
			neck = /obj/item/clothing/neck/roguetown/psicross/skull
		if(/datum/patron/divine/lune)
			neck = /obj/item/clothing/neck/roguetown/psicross/noc
		if(/datum/patron/divine/sylvarn)
			neck = /obj/item/clothing/neck/roguetown/psicross/dendor
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/druidic, 2, TRUE) // enough to craft druid mask, at least
		if(/datum/patron/divine/yamais)
			neck = /obj/item/clothing/neck/roguetown/psicross/necra
		if(/datum/patron/divine/hermeir)
			neck = /obj/item/clothing/neck/roguetown/psicross/pestra
		if(/datum/patron/divine/viiritri) //Eora content from Stonekeep
			neck = /obj/item/clothing/neck/roguetown/psicross/eora

	// CLASS ARCHETYPES
	H.adjust_blindness(-3)
	var/classes = list("Life Cleric","War Cleric","Nature Cleric", "Temple Devout")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Life Cleric")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a cleric of the life domain. Well versed in the arts of healing and magic."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 4, TRUE)
			H.change_stat("intelligence", 2)
			H.change_stat("speed", 1) // More intelligence and no speed penalty for Life Clerics.
			H.change_stat("strength", 1)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 2)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/guidance5e)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		if("War Cleric")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a cleric of the war domain. Experienced in both the granting of life and the taking of it. Unfortunately your study of warcraft has weakened your divine abilities..."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/shields, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
			H.change_stat("intelligence", 1)
			H.change_stat("strength", 2)
			H.change_stat("constitution", 2)
			H.change_stat("endurance", 2) // Stronger but less intelligent/quick compared to life clerics.
			H.change_stat("speed", -1)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/targeted/churn)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/bladeward5e)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/conjure/createbonfire5e)
		if("Nature Cleric")
			H.set_blindness(0)
			to_chat(H, span_warning("You are a cleric of the nature domain."))
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/druidic, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 1, TRUE)
			H.change_stat("intelligence", 2)
			H.change_stat("strength", 1)
			H.change_stat("constitution", 1)
			H.change_stat("endurance", 2)
			H.change_stat("speed", 1)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			ADD_TRAIT(H, TRAIT_KNEESTINGER_IMMUNITY, TRAIT_GENERIC)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/conjure_glowshroom)
		// HEARTHSTONE ADD: cloistered cleric subclass (lighter armored and equipped)
		if("Temple Devout")
			// Devout start without the typical cleric heavy armor shtick and without much in the way of weapons or skills to use them.
			// They're better with miracles and regenerate devotion passively like the Priest does, however.
			H.set_blindness(0)
			to_chat(H, span_warning("You are a Temple cleric, a devout traveller whom has engressed into distant lands to spread the word of your chosen Patron. Having secluded yourself for many years, your body has suffered... But you have gained great insight as a result!"))
			H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 5, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 3, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 4, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank_up_to(/datum/skill/combat/maces, 2, TRUE)
			H.change_stat("intelligence", 4)
			H.change_stat("strength", -2)
			H.change_stat("perception", 2)
			H.change_stat("speed", 1)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/guidance5e)
			H.mind.AddSpell(new	/obj/effect/proc_holder/spell/targeted/churn)
			H.mind.AddSpell(new /obj/effect/proc_holder/spell/self/light5e)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
		// HEARTHSTONE ADDITION END

	armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/mace
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogueweapon/shield/wood
	backpack_contents = list(/obj/item/rogueweapon/huntingknife)
	// everything about this sucks - we should really make a subclass datum or something
	if(classchoice == "Nature Cleric")
		beltr = /obj/item/rogueweapon/sword
		armor = /obj/item/clothing/suit/roguetown/armor/leather
		pants = /obj/item/clothing/under/roguetown/trou
		cloak = /obj/item/clothing/cloak/raincloak/furcloak
		shoes = /obj/item/clothing/shoes/roguetown/boots
	// HEARTHSTONE ADD: cloistered devout custom outfits
	else if (classchoice == "Temple Devout")
		// do the generic stuff first then replace it w/ patron specific things... if it exists
		// for reference, cloistered devouts are lightly armored/unarmored but get patron-specific stuff (if applicable) and a devo regen
		head = /obj/item/clothing/head/roguetown/roguehood/black
		armor = /obj/item/clothing/suit/roguetown/shirt/robe
		shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
		wrists = null
		beltr = null
		backr = /obj/item/rogueweapon/woodstaff
		pants = /obj/item/clothing/under/roguetown/tights
		shoes = /obj/item/clothing/shoes/roguetown/boots
		// apply patron-specific outfit alterations
		switch(H.patron?.type)
			if(/datum/patron/divine/elysius)
				head = /obj/item/clothing/head/roguetown/roguehood/astrata
				armor = /obj/item/clothing/suit/roguetown/shirt/robe/astrata
				beltr = /obj/item/flashlight/flare/torch/lantern // you are the lightbringer
			if(/datum/patron/divine/lune)
				head =  /obj/item/clothing/head/roguetown/roguehood/nochood
				armor = /obj/item/clothing/suit/roguetown/shirt/robe/noc
				pants = /obj/item/clothing/under/roguetown/tights/black
				belt = /obj/item/storage/belt/rogue/leather/black
			if(/datum/patron/divine/yamais)
				head = /obj/item/clothing/head/roguetown/necrahood
				armor = /obj/item/clothing/suit/roguetown/shirt/robe/necra
				pants = /obj/item/clothing/under/roguetown/trou/leather/mourning
			if(/datum/patron/divine/sylvarn)
				head = /obj/item/clothing/head/roguetown/dendormask
				armor = /obj/item/clothing/suit/roguetown/shirt/robe/dendor
				pants = /obj/item/clothing/under/roguetown/loincloth
				belt = /obj/item/storage/belt/rogue/leather/rope
				shoes = /obj/item/clothing/shoes/roguetown/sandals
			if(/datum/patron/divine/onder)
				head = /obj/item/clothing/head/roguetown/roguehood/tricksterhood
			if(/datum/patron/old_god)
				head = /obj/item/clothing/head/roguetown/psydonhood
				armor = /obj/item/clothing/suit/roguetown/shirt/robe/psydonrobe
			if(/datum/patron/divine/viiritri)
				armor = /obj/item/clothing/suit/roguetown/shirt/robe/eora
			if(/datum/patron/divine/jayx)
				armor = /obj/item/clothing/suit/roguetown/shirt/robe
				if(H.mind)
					H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 1, TRUE)
					H.mind.adjust_spellpoints(1)
	// HEARTHSTONE ADDITION END
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	// HEARTHSTONE ADDITION: cloistered devout devo regen & tier buff
	if (classchoice == "Temple Devout")
		C.grant_spells_devout(H)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/arcane, 1, TRUE)
		H.mind.adjust_spellpoints(2)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
		ADD_TRAIT(H, TRAIT_USEMAGIC, TRAIT_GENERIC) //can get magic from spellpoints but no more.
	else
		C.grant_spells_cleric(H)
	// HEARTHSTONE ADDITION END
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)
	if(H.mind?.get_skill_level(/datum/skill/magic/arcane))
		H.verbs += list(/mob/living/carbon/human/proc/magicreport, /mob/living/carbon/human/proc/magiclearn)

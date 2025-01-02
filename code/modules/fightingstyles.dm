/mob/living/carbon/human/proc/give_fightingstyle(two = FALSE)
	var/list/fightingstyles = list(
		"Dirty Fighting",
		"Shield Master",
		"Tavern Brawler",
		"Unarmed Fighting",
		"Thrown Weapon Fighting",
		"Mariner",
		"Martial Artist",
		"Weapon Master",
		"Wrestler")

	var/stylechoice = input("Choose your first fighting style", "Available fighting styles") as anything in fightingstyles
	trygivefightingstyle(stylechoice)
	if(two)
		fightingstyles.Remove(stylechoice)
		var/stylechoice_two = input("Choose your second fighting style", "Available fighting styles") as anything in fightingstyles
		trygivefightingstyle(stylechoice_two)

/mob/living/carbon/human/proc/trygivefightingstyle(T)
	switch(T)
		if("Dirty Fighting")
			ADD_TRAIT(src, TRAIT_NUTCRACKER, TRAIT_GENERIC)
			src.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)

		if("Shield Master")
			src.mind.adjust_skillrank(/datum/skill/combat/shields, 2, TRUE)

		if("Tavern Brawler")
			ADD_TRAIT(src, TRAIT_CIVILIZEDBARBARIAN, TRAIT_GENERIC)

		if("Unarmed Fighting")
			ADD_TRAIT(src, TRAIT_PUGILIST, TRAIT_GENERIC)
			src.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)

		if("Thrown Weapon Fighting")
			ADD_TRAIT(src, TRAIT_STRONGTHROW, TRAIT_GENERIC)
			src.change_stat("perception", 2)

		if("Mariner")
			src.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
			src.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)

		if("Martial Artist")
			ADD_TRAIT(src, TRAIT_MARTIALARTIST, TRAIT_GENERIC)
			src.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)

		if("Weapon Master")
			if(src.mind.get_skill_level(/datum/skill/combat/swords) < 4)
				src.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			if(src.mind.get_skill_level(/datum/skill/combat/polearms) < 4)
				src.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
			if(src.mind.get_skill_level(/datum/skill/combat/maces) < 4)
				src.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
			if(src.mind.get_skill_level(/datum/skill/combat/axes) < 4)
				src.mind.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE)
			if(src.mind.get_skill_level(/datum/skill/combat/knives) < 4)
				src.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)

		if("Wrestler")
			ADD_TRAIT(src, TRAIT_STRONG_GRABBER, TRAIT_GENERIC)
			src.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)

/mob/living/carbon/human/proc/give_smithingstyle
	var/list/smithingstyles = list(
		"Weaponsmith",
		"Armorsmith",
		)

	var/smithingstylechoice = input("Choose your smithing specialization", "Available smithing specialization") as anything in smithingstyles
	trygivesmithinggstyle(stylechoice)

/mob/living/carbon/human/proc/trygivefightingstyle(T)
	switch(T)
		if("Weaponsmith")
			ADD_TRAIT(src, TRAIT_WEAPONSMITH, TRAIT_GENERIC)

		if("Armorsmith")
			ADD_TRAIT(src, TRAIT_ARMORSMITH, TRAIT_GENERIC)

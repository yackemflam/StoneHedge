/datum/job/roguetown/bogguardsman
	title = "Hedge Knight"
	flag = BOGGUARD
	department_flag = GARRISON
	faction = "Station"
	total_positions = 10
	spawn_positions = 10
	selection_color = JCOLOR_SOLDIER
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED, AGE_OLD)
	tutorial = " You decided to protect the dream dales oneday, and you joined the hedgecademy within the rangers keep. Learning from the best you can muster, you're a certified monster hunter as much as you are a ranger and guard. Keeping these woodlands safe is your duty."
	display_order = JDO_TOWNGUARD
	whitelist_req = FALSE
	outfit = /datum/outfit/job/roguetown/bogguardsman
	give_bank_account = 60
	min_pq = 5
	max_pq = null

	cmode_music = 'sound/music/combat_bog.ogg'

/datum/job/roguetown/bogguardsman/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/bog))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "bogman tabard ([index])"

/datum/outfit/job/roguetown/bogguardsman/pre_equip(mob/living/carbon/human/H)
	. = ..()
	head = /obj/item/clothing/head/roguetown/helmet/leather
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	cloak = /obj/item/clothing/cloak/raincloak/green
	neck = /obj/item/clothing/neck/roguetown/bervor
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	beltl = /obj/item/quiver/arrows
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/sword/silver/sabre/elf
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	id = /obj/item/scomstone
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/silver/elvish = 1, /obj/item/signal_horn = 1, /obj/item/flashlight/flare/torch/lantern =1,)
	if(H.mind)
		assign_skills(H)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_WILD_EATER, TRAIT_GENERIC)

/*Design philosophy: These are rangers and the closest concept to guards; Referred to as Hedge Knights for lore reason on dreamkeep. They can do medicine, archery and track the forests really well. They are also competent with daggers and swords and some wilderness skills to make use of aspects.*/
/datum/outfit/job/roguetown/bogguardsman/proc/assign_skills(mob/living/carbon/human/H)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/bows, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/unarmed, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/axes, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/polearms, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/cooking, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/labor/butchering, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/swimming, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/riding, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/tracking, 4, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/craft/tanning, 2, TRUE)
	H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 1, TRUE) //So they can make leather and gambeson armors and slight alterations on their own as ranger-types.
	H.change_stat("strength", 3)
	H.change_stat("perception", 2)
	H.change_stat("constitution", 2)
	H.change_stat("endurance", 2)
	H.change_stat("speed", 1)

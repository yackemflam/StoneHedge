/datum/job/roguetown/tribalshaman
	title = "Tribal Shaman"
	flag = TRIBALSHAMAN
	department_flag = TRIBAL
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	tutorial = "A tribal druidic shaman that works with shaman magic to heal the wounded and bring even dead back. Their prowess with druidic magic allows them to grow crops and guide the tribe with their wisdoms."
	display_order = JDO_TRIBALSHAMAN
	spells = list(/obj/effect/proc_holder/spell/self/convertrole/tribal, /obj/effect/proc_holder/spell/invoked/cure_rot, /obj/effect/proc_holder/spell/invoked/heal/shaman, /obj/effect/proc_holder/spell/invoked/revive/shaman)
	outfit = /datum/outfit/job/roguetown/tribalshaman
	min_pq = 15
	max_pq = null
	cmode_music = 'sound/music/combat_gronn.ogg'

/datum/outfit/job/roguetown/tribalshaman
	name = "Tribal Shaman"
	jobtype = /datum/job/roguetown/tribalshaman
	allowed_patrons = list(/datum/patron/divine/sylvarn)

/obj/effect/proc_holder/spell/invoked/heal/shaman
	name = "Mend Wounds"

/obj/effect/proc_holder/spell/invoked/revive/shaman
	name = "Restore Life"

/datum/outfit/job/roguetown/tribalshaman/pre_equip(mob/living/carbon/human/H)
	. = ..()
	H.verbs |= /mob/living/carbon/human/proc/tribalannouncement
	H.verbs |= /mob/living/carbon/human/proc/tribalopenslot
	belt = /obj/item/storage/belt/rogue/bone/skullbelt
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	backl = /obj/item/storage/backpack/rogue/satchel
	beltr = /obj/item/clothing/mask/rogue/facemask
	wrists = /obj/item/clothing/wrists/roguetown/bracers/carapace
	neck = /obj/item/clothing/neck/roguetown/psicross/dendor
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/tribalcloak
	armor = /obj/item/clothing/suit/roguetown/armor/bone/chestplate
	shoes = /obj/item/clothing/shoes/roguetown/boots/carapace
	shirt = /obj/item/clothing/suit/roguetown/shirt/tribalrag
	head = /obj/item/clothing/head/roguetown/helmet/carapacecap
	pants = /obj/item/clothing/under/roguetown/trou/leather/advanced
	r_hand = /obj/item/rogueweapon/woodstaff
	backpack_contents = list(/obj/item/roguekey/tribe = 1, /obj/item/reagent_containers/glass/mortar = 1, /obj/item/scrying = 1, /obj/item/rogueweapon/huntingknife/idagger/silver =1,)

	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/holy, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/farming, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/masonry, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/magic/druidic, 2, TRUE) //This does nothing, but maybe one day it will.
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/cure_rot)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/heal/shaman)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/revive/shaman)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/shapeshift)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/magic/druidic, 1, TRUE)
		H.change_stat("intelligence", 4)
		H.change_stat("endurance", 2)
		H.change_stat("speed", 2)
	ADD_TRAIT(H, TRAIT_BOG_TREKKING, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NASTY_EATER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_PERFECT_TRACKER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ALCHEMYKNOWLEDGE, TRAIT_GENERIC)
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells_priest(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/obj/effect/proc_holder/spell/self/convertrole/tribal
	name = "Recruit Tribemember"
	new_role = "Tribe Member"
	recruitment_faction = "Tribals"
	recruitment_message = "Serve the tribe, %RECRUIT!"
	accept_message = "FOR THE TRIBE!"
	refuse_message = "I refuse."

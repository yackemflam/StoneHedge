/datum/advclass/towndoctor
	name = "Barber Surgeon"
	tutorial = "You are the closest thing to a doctor that the townsfolk here will ever meet. Wielding crude tools and accumulated knowledge, you have probably cut into as many people as the average Knight."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDSPLUS
	outfit = /datum/outfit/job/roguetown/adventurer/doctor
	category_tags = list(CTAG_PILGRIM, CTAG_TOWNER)
	traits_applied = list(TRAIT_EMPATH, TRAIT_SELF_AWARE, TRAIT_NOSTINK, TRAIT_ALCHEMYKNOWLEDGE)
	cmode_music = 'sound/music/combat_physician.ogg'

/datum/outfit/job/roguetown/adventurer/doctor
	allowed_patrons = ALL_CLERIC_PATRONS

/datum/outfit/job/roguetown/adventurer/doctor/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/mask/rogue/feldmask
	head = /obj/item/clothing/head/roguetown/roguehood/feldhood
	neck = /obj/item/storage/belt/rogue/pouch/coins/rich /// they are a fine dressed doctor. no one else gonna pay em. psycross removed since it was a hold over for secular
	gloves = /obj/item/clothing/gloves/roguetown/feldgloves
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/huntingknife/cleaver /// proper self defense an tree aquiring
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	backl = /obj/item/storage/backpack/rogue/backpack
	backpack_contents = list(
		/obj/item/reagent_containers/glass/alembic = 1,
		/obj/item/storage/fancy/ifak = 1,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot = 1, // tempted to make this ambrosia, but docs dont need to be able to do EVERYTHING...
		/obj/item/clothing/mask/rogue/physician = 1,
		/obj/item/storage/box/matches = 1, /// for carterizer and ring.
		/obj/item/flashlight/flare/torch/lantern/ring = 1, //lantern+
		/obj/item/storage/fancy/skit = 1,
	)
	if(H.gender == MALE)
		armor = /obj/item/clothing/suit/roguetown/shirt/robe/surgrobe
		pants = /obj/item/clothing/under/roguetown/trou
		shirt = /obj/item/clothing/suit/roguetown/armor/gambeson // for the unruly zombies. won't protect neck or head, but loadout item a coif for that.
		head = /obj/item/clothing/head/roguetown/nightman
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress
		shirt = /obj/item/clothing/suit/roguetown/armor/armordress // see above.
		head = /obj/item/clothing/head/roguetown/armingcap

	ADD_TRAIT(H, TRAIT_STEELHEARTED, "[type]")
	if(H.mind)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/knives, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/crafting, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/craft/carpentry, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/labor/lumberjacking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/medicine, 5, TRUE) // 5 is minimum for head attaching, i think... should be able to do all medical tasks
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/sewing, 5, TRUE)
		H.mind.adjust_skillrank_up_to(/datum/skill/misc/alchemy, 4, TRUE)
		H.change_stat("intelligence", 2) /// bumped these up by one and added some con. I cant rework everyclass but this one made me sad.
		H.change_stat("fortune", 1)
		H.change_stat("constitution", 2) // regular health checks to self. I dunno man give em something. miricles already shits all over surgery healin.
		H.change_stat("speed", 2) // to get to the scene of injuries faster
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/diagnose/secular)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/docheal)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/stable)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/purge)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/debride)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/cpr)

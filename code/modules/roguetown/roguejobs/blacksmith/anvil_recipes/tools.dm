/datum/anvil_recipe/tools
	appro_skill = /datum/skill/craft/blacksmithing
	craftdiff = 1

// --------- IRON -----------
/datum/anvil_recipe/tools/surgery/surgerytools
	name = "Surgery Kit (+1 iron +1 cloth)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/ingot/iron, /obj/item/natural/cloth)
	created_item = /obj/item/storage/fancy/skit
	i_type = "Tools"

/datum/anvil_recipe/tools/surgery/lpick
	name = "Pick Set"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/lockpickring/mundane
	i_type = "Tools"

/datum/anvil_recipe/tools/torch
	name = "Torches 5x (+1 Coal)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/rogueore/coal)
	created_item = list(/obj/item/flashlight/flare/torch/metal, /obj/item/flashlight/flare/torch/metal, /obj/item/flashlight/flare/torch/metal, /obj/item/flashlight/flare/torch/metal, /obj/item/flashlight/flare/torch/metal)
	i_type = "General"

/datum/anvil_recipe/tools/scissors
	name = "Scissors"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/huntingknife/scissors
	i_type = "Tools"

/datum/anvil_recipe/tools/pan
	name = "Frypan"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/cooking/pan
	i_type = "Tools"

/datum/anvil_recipe/tools/keyring
	name = "Keyrings 3x"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/storage/keyring, /obj/item/storage/keyring, /obj/item/storage/keyring)
	i_type = "General"

/datum/anvil_recipe/tools/needle
	name = "Sewing Needles 5x"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/needle, /obj/item/needle, /obj/item/needle, /obj/item/needle, /obj/item/needle)
	i_type = "General"

/datum/anvil_recipe/tools/shovel
	name = "Shovel (+2 Sticks)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/shovel
	i_type = "Tools"

/datum/anvil_recipe/tools/hammer
	name = "Hammer (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/hammer
	i_type = "Tools"

/datum/anvil_recipe/tools/tongs
	name = "Tongs"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/tongs
	i_type = "Tools"

/datum/anvil_recipe/tools/sickle
	name = "Sickle (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/sickle
	i_type = "Tools"

/datum/anvil_recipe/tools/pick
	name = "Pickaxe (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/pick
	i_type = "Tools"

/datum/anvil_recipe/tools/hoe
	name = "Hoe (+2 Sticks)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/hoe
	i_type = "Tools"

/datum/anvil_recipe/tools/pitchfork
	name = "Pitchfork (+2 Sticks)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/pitchfork
	i_type = "Tools"

/datum/anvil_recipe/tools/lamptern
	name = "Lamptern"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/flashlight/flare/torch/lantern
	i_type = "General"

/datum/anvil_recipe/tools/steelbelt
	name = "Steel Belt"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/storage/belt/rogue/leather/hand
	i_type = "General"

/datum/anvil_recipe/tools/chains
	name = "Chains"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rope/chain
	i_type = "General"

/datum/anvil_recipe/tools/mantrap
	name = "Mantraps 2x"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/natural/fibers, /obj/item/natural/fibers, /obj/item/grown/log/tree/small)
	created_item = list(/obj/item/restraints/legcuffs/beartrap/crafted, /obj/item/restraints/legcuffs/beartrap/crafted)

/datum/anvil_recipe/tools/cups
	name = "Cups 3x"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/reagent_containers/glass/cup,/obj/item/reagent_containers/glass/cup,/obj/item/reagent_containers/glass/cup)
	i_type = "General"

/datum/anvil_recipe/tools/cogiron
	name = "Cogs 3x"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/roguegear, /obj/item/roguegear, /obj/item/roguegear)
	i_type = "General"

/datum/anvil_recipe/tools/locks
	name = "Locks 5x"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/customlock, /obj/item/customlock, /obj/item/customlock, /obj/item/customlock, /obj/item/customlock)
	i_type = "General"

/datum/anvil_recipe/tools/keys
	name = "Keys 5x"
	req_bar = /obj/item/ingot/iron
	created_item = list(/obj/item/customblank, /obj/item/customblank, /obj/item/customblank, /obj/item/customblank, /obj/item/customblank)
	i_type = "General"

/datum/anvil_recipe/tools/thresher
	name = "Thresher (+1 Stick)"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/thresher
	i_type = "Tools"

/datum/anvil_recipe/tools/pote
	name = "Iron pot"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/reagent_containers/glass/bucket/pot
	craftdiff = 0

/datum/anvil_recipe/tools/iron_arm_left
	name = "Iron arm (L)"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/bodypart/l_arm/rprosthetic/iron
	additional_items = list(/obj/item/roguegear)
	i_type = "General"

/datum/anvil_recipe/tools/iron_arm_right
	name = "Iron arm (R)"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/bodypart/r_arm/rprosthetic/iron
	additional_items = list(/obj/item/roguegear)
	i_type = "General"

/datum/anvil_recipe/tools/iron_leg_left
	name = "Iron leg (L)"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/bodypart/l_leg/rprosthetic/iron
	additional_items = list(/obj/item/roguegear)
	i_type = "General"

/datum/anvil_recipe/tools/iron_leg_right
	name = "Iron leg (R)"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/bodypart/r_leg/rprosthetic/iron
	additional_items = list(/obj/item/roguegear)
	i_type = "General"

// --------- Steel -----------

/datum/anvil_recipe/tools/steelpick
	name = "Pickaxe (+1 Stick)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/pick/steel
	i_type = "Tools"

/datum/anvil_recipe/tools/steelscissors
	name = "Scissors"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/huntingknife/scissors/steel
	i_type = "Tools"

/datum/anvil_recipe/tools/surgery/syringes
	name = "Syringes x5"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/reagent_containers/syringe/steel, /obj/item/reagent_containers/syringe/steel, /obj/item/reagent_containers/syringe/steel, /obj/item/reagent_containers/syringe/steel, /obj/item/reagent_containers/syringe/steel)
	i_type = "Tools"

/*
//those shit were so expensive one by one nobody ever used them unless they spawn with them.
/datum/anvil_recipe/tools/surgery/scalpel
	name = "Scalpel"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/surgery/scalpel
	i_type = "Tools"

/datum/anvil_recipe/tools/surgery/saw
	name = "Surgical Saw"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/surgery/saw
	i_type = "Tools"

/datum/anvil_recipe/tools/surgery/hemostat
	name = "Forceps"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/surgery/hemostat
	i_type = "Tools"

/datum/anvil_recipe/tools/surgery/retractor
	name = "Speculum"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/surgery/retractor
	i_type = "Tools"

/datum/anvil_recipe/tools/surgery/bonesetter
	name = "Bone Forceps"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/surgery/bonesetter
	i_type = "Tools"

/datum/anvil_recipe/tools/surgery/cautery
	name = "Cautery Iron"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/rogueweapon/surgery/cautery
	i_type = "Tools"
*/

/datum/anvil_recipe/tools/cupssteel
	name = "Goblets 3x"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/reagent_containers/glass/cup/steel, /obj/item/reagent_containers/glass/cup/steel, /obj/item/reagent_containers/glass/cup/steel)
	i_type = "General"

/datum/anvil_recipe/tools/cogsteel
	name = "Cogs 3x"
	req_bar = /obj/item/ingot/steel
	created_item = list(/obj/item/roguegear, /obj/item/roguegear, /obj/item/roguegear)
	i_type = "General"

/datum/anvil_recipe/tools/steel_arm_left
	name = "Steel arm (L)"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/bodypart/l_arm/rprosthetic/steel
	additional_items = list(/obj/item/roguegear)
	i_type = "General"

/datum/anvil_recipe/tools/steel_arm_right
	name = "Steel arm (R)"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/bodypart/r_arm/rprosthetic/steel
	additional_items = list(/obj/item/roguegear)
	i_type = "General"

/datum/anvil_recipe/tools/steel_leg_left
	name = "Steel leg (L)"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/bodypart/l_leg/rprosthetic/steel
	additional_items = list(/obj/item/roguegear)
	i_type = "General"

/datum/anvil_recipe/tools/steel_leg_right
	name = "Steel leg (R)"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/bodypart/r_leg/rprosthetic/steel
	additional_items = list(/obj/item/roguegear)
	i_type = "General"

// --------- SILVER -----------

/datum/anvil_recipe/tools/cupssil
	name = "Goblets 3x"
	req_bar = /obj/item/ingot/silver
	created_item = list(/obj/item/reagent_containers/glass/cup/silver, /obj/item/reagent_containers/glass/cup/silver, /obj/item/reagent_containers/glass/cup/silver)
	i_type = "General"

// --------- GOLD -----------

/datum/anvil_recipe/tools/cupsgold
	name = "Goblets 3x"
	req_bar = /obj/item/ingot/gold
	created_item = list(/obj/item/reagent_containers/glass/cup/golden, /obj/item/reagent_containers/glass/cup/golden, /obj/item/reagent_containers/glass/cup/golden)
	i_type = "General"

/datum/anvil_recipe/tools/clock_arm_left
	name = "Clockwork arm (L)"
	req_bar = /obj/item/ingot/gold
	created_item = /obj/item/bodypart/l_arm/rprosthetic/clock
	additional_items = list(/obj/item/roguegear,/obj/item/roguegear,/obj/item/roguegear)
	i_type = "General"

/datum/anvil_recipe/tools/clock_arm_right
	name = "Clockwork arm (R)"
	req_bar = /obj/item/ingot/gold
	created_item = /obj/item/bodypart/r_arm/rprosthetic/clock
	additional_items = list(/obj/item/roguegear,/obj/item/roguegear,/obj/item/roguegear)
	i_type = "General"

/datum/anvil_recipe/tools/clock_leg_left
	name = "Clockwork leg (L)"
	req_bar = /obj/item/ingot/gold
	created_item = /obj/item/bodypart/l_leg/rprosthetic/clock
	additional_items = list(/obj/item/roguegear,/obj/item/roguegear,/obj/item/roguegear)
	i_type = "General"

/datum/anvil_recipe/tools/clock_leg_right
	name = "Clockwork leg (R)"
	req_bar = /obj/item/ingot/gold
	created_item = /obj/item/bodypart/r_leg/rprosthetic/clock
	additional_items = list(/obj/item/roguegear,/obj/item/roguegear,/obj/item/roguegear)
	i_type = "General"

/datum/anvil_recipe/tools/alembic        ////////// yes I know the sprites copper. chill.
	name = "Alembic"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/reagent_containers/glass/alembic
	i_type = "Tools"

/datum/anvil_recipe/tools/glassbottles
	name = "5x glass bottles" //more efficent cuz u smith em ig
	created_item = list(/obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/bottle)
	req_bar = /obj/item/ingot/glass
	craftdiff = 1
	i_type = "General"

/datum/anvil_recipe/tools/glasssyringes
	name = "5x glass syringes" //more efficent cuz u smith em ig
	created_item = list(/obj/item/reagent_containers/syringe, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/syringe)
	req_bar = /obj/item/ingot/glass
	craftdiff = 2
	i_type = "General"

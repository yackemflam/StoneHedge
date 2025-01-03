
/datum/crafting_recipe/roguetown/leather/bedroll
	name = "bedroll"
	result = /obj/item/bedroll
	reqs = list(/obj/item/natural/hide = 2,
				/obj/item/rope = 1)
	tools = list(/obj/item/needle)
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 0
	sellprice = 20	//Costs about ~16 to make.

/datum/crafting_recipe/roguetown/leather/pouch
	name = "leather pouch (x2)"
	result = list(/obj/item/storage/belt/rogue/pouch,
				/obj/item/storage/belt/rogue/pouch)
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fibers = 1)
	sellprice = 5	//Gives 2 at 5 mammon each (12 total mammon worth), takes ~7 mammon to make

/datum/crafting_recipe/roguetown/leather/foodbag
	name = "food bag"
	result = list(/obj/item/storage/foodbag)
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fibers = 2)
	craftdiff = 0

/datum/crafting_recipe/roguetown/leather/waterskin
	name = "waterskin"
	result = /obj/item/reagent_containers/glass/bottle/waterskin
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fibers = 2)
	craftdiff = 1	//Slightly harder craft.
	sellprice = 14	//Costs about ~8 to make. High sale price for that, still.

/datum/crafting_recipe/roguetown/leather/quiver
	name = "quiver"
	result = /obj/item/quiver
	reqs = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fibers = 2)
	sellprice = 30

/datum/crafting_recipe/roguetown/leather/gwstrap
	name = "Greatweapon Strap"
	result = /obj/item/gwstrap
	reqs = list(/obj/item/natural/hide = 2,
				/obj/item/rope = 1)
	sellprice = 30

/datum/crafting_recipe/roguetown/leather/gloves
	name = "leather gloves (x2)"
	result = list(/obj/item/clothing/gloves/roguetown/leather,
	/obj/item/clothing/gloves/roguetown/leather)
	reqs = list(/obj/item/natural/hide = 1)
	sellprice = 5	//Costs about ~6 to make, gives 2 gloves selling for 5 each. Total of 10; 4 profit.

/datum/crafting_recipe/roguetown/leather/heavygloves
	name = "heavy leather gloves"
	result = /obj/item/clothing/gloves/roguetown/leather/angle
	reqs = list(/obj/item/natural/fur = 1)
	craftdiff = 1	//Slightly harder craft.
	sellprice = 15	//Costs about ~10 to make, sells well.

/datum/crafting_recipe/roguetown/leather/heavygloves/advanced
	name = "hardened heavy leather gloves"
	result = /obj/item/clothing/gloves/roguetown/leather/angle/advanced
	reqs = list(/obj/item/natural/fur = 2)
	craftdiff = 4
	sellprice = 30

/datum/crafting_recipe/roguetown/leather/bracers
	name = "leather bracers (x2)"
	result = list(/obj/item/clothing/wrists/roguetown/bracers/leather,
			/obj/item/clothing/wrists/roguetown/bracers/leather)
	reqs = list(/obj/item/natural/hide = 1)
	sellprice = 5	//Costs about ~6 to make, gives 2 bracers selling for 5 each. Total of 10; 4 profit.

/datum/crafting_recipe/roguetown/leather/pants
	name = "leather pants"
	result = list(/obj/item/clothing/under/roguetown/trou/leather)
	reqs = list(/obj/item/natural/hide = 1)
	sellprice = 10	//Costs about ~6 to make, sells well.

/datum/crafting_recipe/roguetown/leather/leatherskirt
	name = "leather skirt"
	result = list(/obj/item/clothing/under/roguetown/trou/skirt)
	reqs = list(/obj/item/natural/hide = 1)
	sellprice = 10

/datum/crafting_recipe/roguetown/leather/shoes
	name = "leather shoes (x3)"
	result = list(/obj/item/clothing/shoes/roguetown/simpleshoes,
				/obj/item/clothing/shoes/roguetown/simpleshoes,
				/obj/item/clothing/shoes/roguetown/simpleshoes)
	reqs = list(/obj/item/natural/hide = 1)
	sellprice = 3	//Costs about ~6 to make, gives 3 shoes selling for 3 each.

/datum/crafting_recipe/roguetown/leather/boots
	name = "leather boots"
	result = /obj/item/clothing/shoes/roguetown/boots/leather
	reqs = list(/obj/item/natural/hide = 1)
	sellprice = 10	//Costs about ~6 to make, sells well.

/datum/crafting_recipe/roguetown/leather/boots/gladiator
	name = "leather soleae"
	result = /obj/item/clothing/shoes/roguetown/gladiator

/datum/crafting_recipe/roguetown/leather/shoes/sandals
	name = "leather sandals (x3)"
	result = list(/obj/item/clothing/shoes/roguetown/sandals,
				/obj/item/clothing/shoes/roguetown/sandals,
				/obj/item/clothing/shoes/roguetown/sandals)

/datum/crafting_recipe/roguetown/leather/helmet
	name = "leather helmet"
	result = /obj/item/clothing/head/roguetown/helmet/leather
	reqs = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fibers = 1)
	sellprice = 19	//Costs about ~13 to make, very good resale.
	craftdiff = 1	//Slightly harder craft.

/datum/crafting_recipe/roguetown/leather/bandana
	name = "leather bandana"
	result = /obj/item/clothing/head/roguetown/helmet/bandana
	reqs = list(/obj/item/natural/hide = 1)
	sellprice = 27

/datum/crafting_recipe/roguetown/leather/tricorn
	name = "leather tricorn"
	result = /obj/item/clothing/head/roguetown/helmet/tricorn
	reqs = list(/obj/item/natural/hide = 1)
	sellprice = 27

/datum/crafting_recipe/roguetown/leather/hood
	name = "leather hood"
	result = /obj/item/clothing/head/roguetown/roguehood
	reqs = list(/obj/item/natural/hide = 1)
	sellprice = 8	//Costs about ~6 to make, doesn't sell great.

/datum/crafting_recipe/roguetown/leather/vest
	name = "thick leather vest"
	result = /obj/item/clothing/suit/roguetown/armor/leather/vest
	reqs = list(/obj/item/natural/hide = 2)
	sellprice = 16	//Costs about ~12 to make.

/datum/crafting_recipe/roguetown/leather/armor
	name = "leather armor"
	result = /obj/item/clothing/suit/roguetown/armor/leather
	reqs = list(/obj/item/natural/hide = 2)
	sellprice = 18	//Costs about ~12 to make.
	craftdiff = 1	//Slightly harder craft.

/datum/crafting_recipe/roguetown/leather/leathervest
	name = "leather vest"
	result = /obj/item/clothing/suit/roguetown/armor/leathervest
	reqs = list(/obj/item/natural/hide = 2)
	sellprice = 26

/datum/crafting_recipe/roguetown/leather/bikini
	name = "leather bikini armor"
	result = /obj/item/clothing/suit/roguetown/armor/leather/bikini
	reqs = list(/obj/item/natural/hide = 2)
	sellprice = 24	//Costs about ~12 to make.

/datum/crafting_recipe/roguetown/leather/bra
	name = "leather bra armor"
	result = /obj/item/clothing/suit/roguetown/armor/leather/bikini/bra
	reqs = list(/obj/item/natural/hide = 2)
	sellprice = 26

/datum/crafting_recipe/roguetown/leather/hidearmor
	name = "hide armor"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fur = 1)
	sellprice = 28	//Costs about ~16 to make. So, HIGH resale.
	craftdiff = 2	//Harder craft.

/datum/crafting_recipe/roguetown/sewing/shoes
	name = "simple shoes"
	result = list(/obj/item/clothing/shoes/roguetown/simpleshoes)
	reqs = list(/obj/item/natural/hide/cured = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/bearfur
	name = "bear fur"
	result = /obj/item/clothing/suit/roguetown/armor/hide/bearfur
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fur = 2)
	sellprice = 26

/datum/crafting_recipe/roguetown/leather/hidebikini
	name = "hide bikini armor"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide/bikini
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fur = 1)
	sellprice = 28	//Costs about ~16 to make. So, HIGH resale.
	craftdiff = 2	//Harder craft.

/datum/crafting_recipe/roguetown/leather/hidebra
	name = "hide bra armor"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide/bikini/bra
	reqs = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fur = 1)
	sellprice = 26

/datum/crafting_recipe/roguetown/hunting
	tools = list(/obj/item/rogueweapon/huntingknife)
	skillcraft = /datum/skill/craft/hunting

//Survival type crafting belongs here!
//It no longer requires a structure

/datum/crafting_recipe/roguetown/hunting/cloak
	name = "leather cloak"
	result = /obj/item/clothing/cloak/raincloak/brown
	reqs = list(/obj/item/natural/hide/cured = 2)
	sellprice = 18	//Costs about ~12 to make.

/datum/crafting_recipe/roguetown/hunting/belt
	name = "leather belt"
	result = /obj/item/storage/belt/rogue/leather
	reqs = list(/obj/item/natural/hide/cured = 1)

/datum/crafting_recipe/roguetown/hunting/gloves
	name = "leather gloves"
	result = list(/obj/item/clothing/gloves/roguetown/leather)
	reqs = list(/obj/item/natural/hide/cured = 1)

/datum/crafting_recipe/roguetown/hunting/bracers
	name = "leather bracers"
	result = list(/obj/item/clothing/wrists/roguetown/bracers/leather)
	reqs = list(/obj/item/natural/hide/cured = 1)

/datum/crafting_recipe/roguetown/hunting/pants
	name = "leather trousers"
	result = list(/obj/item/clothing/under/roguetown/trou/leather)
	reqs = list(/obj/item/natural/hide/cured = 2)

/datum/crafting_recipe/roguetown/hunting/boots
	name = "leather boots"
	result = /obj/item/clothing/shoes/roguetown/boots/armor/leather
	reqs = list(/obj/item/natural/hide/cured = 1)

/datum/crafting_recipe/roguetown/hunting/helmet
	name = "leather helmet"
	result = /obj/item/clothing/head/roguetown/helmet/leather
	reqs = list(/obj/item/natural/hide/cured = 1)

/datum/crafting_recipe/roguetown/hunting/studhood
	name = "leather padded hood"
	result = /obj/item/clothing/head/roguetown/helmet/leather/armorhood
	reqs = list(/obj/item/natural/hide/cured = 2)
	craftdiff = 2

/datum/crafting_recipe/roguetown/hunting/armor
	name = "leather armor"
	result = /obj/item/clothing/suit/roguetown/armor/leather
	reqs = list(/obj/item/natural/hide/cured = 2)

/datum/crafting_recipe/roguetown/hunting/pouch
	name = "leather pouch"
	result = list(/obj/item/storage/belt/rogue/pouch)
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 6

/datum/crafting_recipe/roguetown/hunting/satchel
	name = "leather satchel"
	result = list(/obj/item/storage/backpack/rogue/satchel)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	sellprice = 13

/datum/crafting_recipe/roguetown/hunting/backpack
	name = "leather backpack"
	result = /obj/item/storage/backpack/rogue/backpack
	reqs = list(/obj/item/natural/hide/cured = 3,
				/obj/item/natural/fibers = 1)
	sellprice = 19	//Costs about ~13 to make.
	craftdiff = 1	//Slightly harder craft.

/obj/item/clothing/cloak/raincloak/brown
	sellprice = 3

/datum/crafting_recipe/roguetown/hunting/waterskin
	name = "waterskin"
	result = /obj/item/reagent_containers/glass/bottle/waterskin
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 2)
	sellprice = 15

/datum/crafting_recipe/roguetown/hunting/quiver
	name = "quiver"
	result = /obj/item/quiver
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 2)
	sellprice = 28
/datum/crafting_recipe/roguetown/leather/cloakfur
	name = "fur cloak"
	result = /obj/item/clothing/cloak/raincloak/furcloak
	reqs = list(/obj/item/natural/hide = 2, /obj/item/natural/fur = 1)
	sellprice = 33	//Costs about ~22 to make.
	craftdiff = 1	//Slightly harder craft.

/datum/crafting_recipe/roguetown/leather/papakha
	name = "papakha hat"
	result = /obj/item/clothing/head/roguetown/papakha
	reqs = list(/obj/item/natural/fur = 1, /obj/item/natural/fibers = 2)
	sellprice = 16	//Costs about ~12 to make.

/datum/crafting_recipe/roguetown/leather/tribalcloak
	name = "heavy fur cloak"
	result = /obj/item/clothing/cloak/raincloak/furcloak/tribalcloak
	reqs = list(/obj/item/natural/hide = 2,/obj/item/natural/fur = 1)

/datum/crafting_recipe/roguetown/leather/saddle
	name = "saddle"
	result = /obj/item/natural/saddle
	reqs = list(/obj/item/natural/hide = 2)
	sellprice = 24	//Costs about ~12 to make. Higher resale for skill. Plus, cumbersome. Takes both hands.
	craftdiff = 2	//Harder craft.

/datum/crafting_recipe/roguetown/leather/whip
	name = "leather whip"
	result = /obj/item/rogueweapon/whip
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/stone = 1)
	sellprice = 26	//Costs about ~14 to make, resells very well.
	craftdiff = 3	//Harder craft.

/datum/crafting_recipe/roguetown/hunting/saddle
	name = "saddle"
	result = /obj/item/natural/saddle
	reqs = list(/obj/item/natural/hide/cured = 2)
	sellprice = 26

/datum/crafting_recipe/roguetown/hunting/whip
	name = "leather whip"
	result = /obj/item/rogueweapon/whip
	reqs = list(/obj/item/natural/hide/cured = 2,/obj/item/natural/stone = 1)
	sellprice = 28

/datum/crafting_recipe/roguetown/hunting/drum
	name = "Drum"
	result = /obj/item/rogue/instrument/drum
	reqs = list(/obj/item/natural/hide = 1,/obj/item/grown/log/tree/small = 1)
	sellprice = 16	//Costs about ~10 to make.
	craftdiff = 1	//Slightly harder craft.

/datum/crafting_recipe/roguetown/leather/vest/sailor
	name = "leather sea jacket"
	result = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	reqs = list(/obj/item/natural/hide = 2)

/datum/crafting_recipe/roguetown/leather/volfhelm
	name = "volf helmet"
	result = /obj/item/clothing/head/roguetown/helmet/leather/volfhelm
	reqs = list(/obj/item/natural/volf_head = 1, /obj/item/natural/hide = 2)
	sellprice = 34	//Costs about ~27 to make. Not great resale.
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/volfhead
	name = "volf head"
	result = /obj/item/clothing/head/roguetown/helmet/leather/volfhelm
	reqs = list(/obj/item/natural/volf_head = 1, /obj/item/natural/hide = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/furlinedboots
	name = "fur-lined boots"
	result = /obj/item/clothing/shoes/roguetown/boots/furlinedboots
	reqs = list(/obj/item/natural/hide = 1,/obj/item/natural/fur = 1)
	sellprice = 22	//Costs about ~16 to make.
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/furlinedanklets
	name = "fur-lined anklets"
	result = /obj/item/clothing/shoes/roguetown/boots/furlinedanklets
	reqs = list(/obj/item/natural/hide = 1,/obj/item/natural/fur = 1)
	sellprice = 22	//Costs about ~16 to make.
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/carapacecuirass
	name = "carapace cuirass"
	result = list(/obj/item/clothing/suit/roguetown/armor/carapace/cuirass)
	reqs = list(/obj/item/natural/carapace = 2,
				/obj/item/natural/fibers = 4)
	craftdiff = 2
	sellprice = 22	//Costs about ~32 to make! Not great resale, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapacearmor
	name = "carapace armor"
	result = list(/obj/item/clothing/suit/roguetown/armor/carapace)
	reqs = list(/obj/item/natural/carapace = 4,
				/obj/item/natural/fibers = 6)
	craftdiff = 2
	sellprice = 42	//Costs about ~62 to make! Not great resale at ALL, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapacelegs
	name = "carapace chausses"
	result = list(/obj/item/clothing/under/roguetown/carapacelegs)
	reqs = list(/obj/item/natural/carapace = 1,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	sellprice = 10	//Costs about ~16 to make. Not great resale, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapaceskirt
	name = "carapace skirt"
	result = list(/obj/item/clothing/under/roguetown/carapacelegs/skirt)
	reqs = list(/obj/item/natural/carapace = 1,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	sellprice = 10	//Costs about ~16 to make. Not great resale, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapacecap
	name = "carapace cap"
	result = list(/obj/item/clothing/head/roguetown/helmet/carapacecap)
	reqs = list(/obj/item/natural/carapace = 1,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	sellprice = 10	//Costs about ~16 to make. Not great resale, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapacehelm
	name = "carapace helmet"
	result = list(/obj/item/clothing/head/roguetown/helmet/carapacehelm)
	reqs = list(/obj/item/natural/carapace = 2,
				/obj/item/natural/fibers = 4)
	craftdiff = 2
	sellprice = 22	//Costs about ~32 to make. Not great resale, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapaceboots
	name = "carapace boots"
	result = list(/obj/item/clothing/shoes/roguetown/boots/carapace)
	reqs = list(/obj/item/natural/carapace = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	sellprice = 20	//Costs about ~30 to make. Not great resale, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapacegloves
	name = "carapace gauntlets"
	result = list(/obj/item/clothing/gloves/roguetown/carapace)
	reqs = list(/obj/item/natural/carapace = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 2
	sellprice = 20	//Costs about ~30 to make. Not great resale, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapacebracers
	name = "carapace bracers"
	result = list(/obj/item/clothing/wrists/roguetown/bracers/carapace)
	reqs = list(/obj/item/natural/carapace = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 2
	sellprice = 20	//Costs about ~30 to make. Not great resale, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapacecuirass/dragon
	name = "dragon cuirass"
	result = list(/obj/item/clothing/suit/roguetown/armor/carapace/dragon/cuirass)
	reqs = list(/obj/item/natural/carapace/dragon = 2,
				/obj/item/natural/fibers = 4)
	craftdiff = 2
	sellprice = 22	//Costs about ~32 to make! Not great resale, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapacearmor/dragon
	name = "dragon armor"
	result = list(/obj/item/clothing/suit/roguetown/armor/carapace/dragon)
	reqs = list(/obj/item/natural/carapace/dragon = 4,
				/obj/item/natural/fibers = 6)
	craftdiff = 2
	sellprice = 42	//Costs about ~62 to make! Not great resale at ALL, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapacelegs/dragon
	name = "dragon chausses"
	result = list(/obj/item/clothing/under/roguetown/carapacelegs/dragon)
	reqs = list(/obj/item/natural/carapace/dragon = 1,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	sellprice = 10	//Costs about ~16 to make. Not great resale, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapaceskirt/dragon
	name = "dragon skirt"
	result = list(/obj/item/clothing/under/roguetown/carapacelegs/dragon/skirt)
	reqs = list(/obj/item/natural/carapace/dragon = 1,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	sellprice = 10	//Costs about ~16 to make. Not great resale, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapacecap/dragon
	name = "dragon cap"
	result = list(/obj/item/clothing/head/roguetown/helmet/carapacecap/dragon)
	reqs = list(/obj/item/natural/carapace/dragon = 1,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	sellprice = 10	//Costs about ~16 to make. Not great resale, though.. good armor.
/datum/crafting_recipe/roguetown/leather/carapacehelm/dragon
	name = "dragon helmet"
	result = list(/obj/item/clothing/head/roguetown/helmet/carapacehelm/dragon)
	reqs = list(/obj/item/natural/dragon_head = 1,
				/obj/item/natural/fibers = 4)
	craftdiff = 2
	sellprice = 22	//Costs about ~32 to make. Not great resale, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapaceboots/dragon
	name = "dragon boots"
	result = list(/obj/item/clothing/shoes/roguetown/boots/carapace/dragon)
	reqs = list(/obj/item/natural/carapace/dragon = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 1
	sellprice = 20	//Costs about ~30 to make. Not great resale, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapacegloves/dragon
	name = "dragon gauntlets"
	result = list(/obj/item/clothing/gloves/roguetown/carapace/dragon)
	reqs = list(/obj/item/natural/carapace/dragon = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 2
	sellprice = 20	//Costs about ~30 to make. Not great resale, though.. good armor.

/datum/crafting_recipe/roguetown/leather/carapacebracers/dragon
	name = "dragon bracers"
	result = list(/obj/item/clothing/wrists/roguetown/bracers/carapace/dragon)
	reqs = list(/obj/item/natural/carapace/dragon = 2,
				/obj/item/natural/fibers = 2)
	craftdiff = 2
	sellprice = 20	//Costs about ~30 to make. Not great resale, though.. good armor.

/datum/crafting_recipe/roguetown/leather/hidecloak
	name = "hide cloak"
	result = /obj/item/clothing/cloak/hidecloak
	reqs = list(/obj/item/natural/hide = 3)

/datum/crafting_recipe/roguetown/leather/blackleatherbelt
	name = "black leather belt"
	result = /obj/item/storage/belt/rogue/leather/blackleather
	reqs = list(/obj/item/natural/hide = 1)

//firearm slop
/datum/crafting_recipe/roguetown/leather/firepowderflask
	name = "firepowder flask"
	result = /obj/item/powderflask
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fibers = 1,
				/obj/item/reagent_containers/powder/gunpowder = 1,
				)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/bulletpouch
	name = "bullet pouch"
	result = /obj/item/ammopouch
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fibers = 1,
				)
	craftdiff = 1


/// ADVANCED LEATHER

/datum/crafting_recipe/roguetown/leather/advboots
	name = "hardened leather boots"
	result = /obj/item/clothing/shoes/roguetown/boots/armor/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/leather/advgloves
	name = "hardened leather gloves"
	result = /obj/item/clothing/gloves/roguetown/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/leather/advcoat
	name = "hardened leather coat"
	result = /obj/item/clothing/suit/roguetown/armor/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/leather/advhelmet
	name = "hardened leather helmet"
	result = /obj/item/clothing/head/roguetown/helmet/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/leather/advneck
	name = "hardened leather gorget"
	result = /obj/item/clothing/neck/roguetown/gorget/leather
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/datum/crafting_recipe/roguetown/leather/advchausses
	name = "hardened leather chausses"
	result = /obj/item/clothing/under/roguetown/trou/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	craftdiff = 4

/// MASTERWORK

/datum/crafting_recipe/roguetown/leather/advboots/masterwork
	name = "masterwork leather boots"
	result = /obj/item/clothing/shoes/roguetown/boots/armor/leather/masterwork
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/leather/advgloves/masterwork
	name = "masterwork leather gloves"
	result = /obj/item/clothing/gloves/roguetown/leather/masterwork
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/leather/advbracers/masterwork
	name = "masterwork leather bracers"
	result = /obj/item/clothing/wrists/roguetown/bracers/leather/masterwork
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/leather/advcoat/masterwork
	name = "masterwork leather coat"
	result = /obj/item/clothing/suit/roguetown/armor/leather/masterwork
	reqs = list(/obj/item/natural/hide/cured = 4,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/leather/advhelmet/masterwork
	name = "masterwork leather helmet"
	result = /obj/item/clothing/head/roguetown/helmet/leather/masterwork
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/leather/advstudhood/masterwork
	name = "masterwork leather studded hood"
	result = /obj/item/clothing/head/roguetown/helmet/leather/armorhood/masterwork
	reqs = list(/obj/item/clothing/head/roguetown/helmet/leather/armorhood/advanced = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 5

/datum/crafting_recipe/roguetown/leather/advchausses/masterwork
	name = "masterwork leather chausses"
	result = /obj/item/clothing/under/roguetown/trou/leather/masterwork
	reqs = list(/obj/item/natural/hide/cured = 3,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 5

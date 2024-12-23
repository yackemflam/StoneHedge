
/// WOOD

/datum/crafting_recipe/roguetown/turfs/woodfloor
	name = "wooden floor"
	result = /turf/open/floor/rogue/ruinedwood
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 0

/datum/crafting_recipe/roguetown/turfs/woodfloor/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		if(!istype(T, /turf/open/transparent/openspace))
			if(!istype(T, /turf/open/water))
				return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/woodwall
	name = "wooden wall"
	result = /turf/closed/wall/mineral/rogue/wood
	reqs = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/woodwall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/fancywwall
	name = "fancy wooden wall"
	result = /turf/closed/wall/mineral/rogue/decowood
	reqs = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/fancywwall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/woodwindow
	name = "wooden murder hole"
	result = /turf/closed/wall/mineral/rogue/wood/window
	reqs = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/woodwindow/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/// STONE

/datum/crafting_recipe/roguetown/turfs/stonefloor
	name = "stone floor"
	result = /turf/open/floor/rogue/blocks
	reqs = list(/obj/item/natural/stone = 1)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 0

/datum/crafting_recipe/roguetown/turfs/stonefloor/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		if(!istype(T, /turf/open/transparent/openspace))
			if(!istype(T, /turf/open/water))
				return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stonewall
	name = "stone wall"
	result = /turf/closed/wall/mineral/rogue/stone
	reqs = list(/obj/item/natural/stone = 2)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/stonewall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/fancyswall
	name = "fancy stone wall"
	result = /turf/closed/wall/mineral/rogue/decostone
	reqs = list(/obj/item/natural/stone = 2)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/fancyswall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/craftstone
	name = "craftstone wall"
	result = /turf/closed/wall/mineral/rogue/craftstone
	reqs = list(/obj/item/natural/stone = 3)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 4

/datum/crafting_recipe/roguetown/turfs/craftstonewindow
	name = "craftstone murder hole"
	result = /turf/closed/wall/mineral/rogue/craftstone/window
	reqs = list(/obj/item/natural/stone = 3)
	skillcraft = /datum/skill/craft/masonry
	craftsound = 'sound/foley/Building-01.ogg'
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 4

/datum/crafting_recipe/roguetown/turfs/craftstonewindow/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/fancyswall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stonewindow
	name = "stone murder hole"
	result = /turf/closed/wall/mineral/rogue/stone/window
	reqs = list(/obj/item/natural/stone = 2)
	skillcraft = /datum/skill/craft/masonry
	craftsound = 'sound/foley/Building-01.ogg'
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 2

/// WINDOWS

/datum/crafting_recipe/roguetown/turfs/roguewindow
	name = "wooden window"
	result = /obj/structure/roguewindow
	reqs = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	craftsound = 'sound/foley/Building-01.ogg'
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/fancywindow/openclose
	name = "fancy window"
	result = /obj/structure/roguewindow/openclose
	reqs = list(
	  /obj/item/grown/log/tree/small = 2,
	  /obj/item/natural/stone = 1,
	  /obj/item/ash = 1,
	  /obj/item/natural/dirtclod = 1,
	)
	skillcraft = /datum/skill/craft/carpentry
	craftsound = 'sound/foley/Building-01.ogg'
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/reinforcedwindow/openclose
	name = "reinforced window"
	result = /obj/structure/roguewindow/openclose/reinforced
	reqs = list(
	  /obj/item/grown/log/tree/small = 2,
	  /obj/item/ingot/iron = 1,
	  /obj/item/ash = 1,
	  /obj/item/natural/dirtclod = 1,
	)
	skillcraft = /datum/skill/craft/blacksmithing
	craftsound = 'sound/items/bsmith1.ogg'
	verbage_simple = "build"
	verbage = "builds"
	craftdiff = 2

/// TWIG AND TENT

/datum/crafting_recipe/roguetown/turfs/twig
	name = "twig floor"
	result = /turf/open/floor/rogue/twig
	reqs = list(/obj/item/grown/log/tree/stick = 2)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "assemble"
	verbage = "assembles"
	craftdiff = 0

/datum/crafting_recipe/roguetown/turfs/twig/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		if(!istype(T, /turf/open/transparent/openspace))
			if(!istype(T, /turf/open/water))
				return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/tentwall
	name = "tent wall"
	result = /turf/closed/wall/mineral/rogue/tent
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/cloth = 1)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "set up"
	verbage = "sets up"
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/tentwall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/tentdoor
	name = "tent door"
	result = /obj/structure/roguetent
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/cloth = 1)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "set up"
	verbage = "sets up"
	craftdiff = 1

/datum/crafting_recipe/roguetown/turfs/tentdoor/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return ..()


/// GLASS

/datum/crafting_recipe/roguetown/turfs/glasswindow
	name = "glass window"
	result = /obj/structure/roguewindow
	reqs = list(/obj/item/ingot/glass = 1, /obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/glasswindow/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/// DURT
/datum/crafting_recipe/roguetown/turfs/nrich
	name = "soil plot"
	result = /turf/open/floor/rogue/dirt/nrich
	reqs = list(/obj/item/ash = 1,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/dirtclod = 2)
	skillcraft = /datum/skill/labor/farming
	verbage_simple = "set up"
	verbage = "sets up"
	craftdiff = 2

/datum/crafting_recipe/roguetown/turfs/nrich/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/glasswindowopenclose
	name = "glass openable window"
	result = /obj/structure/roguewindow/openclose
	reqs = list(/obj/item/ingot/glass = 1, /obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/glasswindow/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/glasswindowsilver
	name = "glass stained silver window"
	result = /obj/structure/roguewindow/stained/silver
	reqs = list(/obj/item/ingot/glass = 1, /obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/glasswindow/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/glasswindowyellow
	name = "glass stained yellow window"
	result = /obj/structure/roguewindow/stained/yellow
	reqs = list(/obj/item/ingot/glass = 1, /obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "construct"
	verbage = "constructs"
	craftdiff = 3

/datum/crafting_recipe/roguetown/turfs/glasswindow/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

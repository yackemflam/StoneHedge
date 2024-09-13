/obj/item/reagent_containers/food/snacks/rogue/mothercheese
	name = "breastmilk cheese"
	desc = "A ball of cheese with a similar consistency to feta, consumed as part of certain Eoran fertility rites, or more rarely as a private indulgence between partners."
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "freshcheese"
	bitesize = 1
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("cheese" = 1)
	foodtype = GRAIN
	eat_effect = null
	rotprocess = 20 MINUTES
	become_rot_type = null
	slice_path = null
	tastes = list("soft cheese" = 1)

/obj/item/reagent_containers/food/snacks/rogue/cheddar
	name = "wheel of cheddar"
	desc = "A golden wheel of cheddar cheese."
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "cheesewheel"
	bitesize = 6
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("cheese" = 1)
	eat_effect = null
	rotprocess = 20 MINUTES
	slices_num = 6
	slice_batch = TRUE
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/cheddarwedge
	become_rot_type = /obj/item/reagent_containers/food/snacks/rogue/cheddar/aged

/obj/item/reagent_containers/food/snacks/rogue/mothercheese/wheel
	name = "wheel of breastmilk cheese"
	desc = "A pale wheel of breastmilk cheese, typically left to cure for long-term storage."
	icon_state = "blue_cheese"
	bitesize = 6
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("cheese" = 1)
	eat_effect = null
	rotprocess = 20 MINUTES
	slices_num = 6
	slice_batch = TRUE
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/mothercheese/wedge
	become_rot_type = /obj/item/reagent_containers/food/snacks/rogue/mothercheese/wheel/aged

/obj/item/reagent_containers/food/snacks/rogue/cheddar/aged
	name = "wheel of aged cheese"
	desc = "A wheel with intricate patterns of several types of mold with a pungent aroma."
	icon_state = "blue_cheese_wheel"
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/cheddarwedge/aged
	become_rot_type = null
	rotprocess = null

/obj/item/reagent_containers/food/snacks/rogue/mothercheese/wheel/aged
	name = "wheel of cured breastmilk cheese"
	desc = "A shelf-stable wheel of breastmilk cheese that has developed a mild-tasting yellow rind"
	icon_state = "cheesewheel"
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/mothercheese/wedge/aged
	become_rot_type = null
	rotprocess = null

/obj/item/reagent_containers/food/snacks/rogue/cheddarwedge
	name = "wedge of cheese"
	desc = "An invigorating wedge of cheddar cheese."
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "cheese_wedge"
	bitesize = 3
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("cheese" = 1)
	eat_effect = null
	rotprocess = 20 MINUTES
	slices_num = 3
	slice_batch = TRUE
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/cheddarslice
	become_rot_type = /obj/item/reagent_containers/food/snacks/rogue/cheddarwedge/aged
	baitchance = 100
	fishloot = list(/obj/item/reagent_containers/food/snacks/fish/carp = 10,
					/obj/item/reagent_containers/food/snacks/fish/eel = 5,
					/obj/item/reagent_containers/food/snacks/fish/angler = 1)

/obj/item/reagent_containers/food/snacks/rogue/mothercheese/wedge
	name = "wedge of breastmilk cheese"
	desc = "An sweet-tasting wedge of breastmilk milk cheese"
	icon_state = "mothercheese_wedge"
	bitesize = 3
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("cheese" = 1)
	eat_effect = null
	rotprocess = 20 MINUTES
	slices_num = 3
	slice_batch = TRUE
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/mothercheese/slice
	become_rot_type = /obj/item/reagent_containers/food/snacks/rogue/mothercheese/wedge/aged

/obj/item/reagent_containers/food/snacks/rogue/cheddarwedge/aged
	name = "wedge of aged cheese"
	desc = "A dangerous piece of cheese for the brave."
	icon_state = "blue_cheese_wedge"
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/cheddarslice/aged
	become_rot_type = null
	rotprocess = null

/obj/item/reagent_containers/food/snacks/rogue/mothercheese/wedge/aged
	name = "wedge of cured breastmilk cheese"
	desc = "A wedge of breastmilk cheese that has developed a mild-tasting yellow rind. It is sometimes consumed by middle-aged women who are seeking heightened fertility."
	icon_state = "cheese_wedge"
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/mothercheese/slice/aged
	become_rot_type = null
	rotprocess = null

/obj/item/reagent_containers/food/snacks/rogue/cheddarslice
	name = "slice of cheese"
	desc = "A soft, creamy slice of cheddar cheese."
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "cheese_slice"
	bitesize = 1
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("cheese" = 1)
	eat_effect = null
	rotprocess = 20 MINUTES
	slices_num = null
	slice_path = null
	become_rot_type = null
	baitchance = 100
	fishloot = list(/obj/item/reagent_containers/food/snacks/fish/carp = 10,
					/obj/item/reagent_containers/food/snacks/fish/eel = 5)

/obj/item/reagent_containers/food/snacks/rogue/mothercheese/slice
	name = "slice of breastmilk cheese"
	desc = "A soft, sweet slice of breast milk cheese."
	bitesize = 1
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	w_class = WEIGHT_CLASS_TINY
	tastes = list("cheese" = 1)
	eat_effect = null
	rotprocess = 20 MINUTES
	slices_num = null
	slice_path = null
	become_rot_type = /obj/item/reagent_containers/food/snacks/rogue/mothercheese/slice/aged
	icon_state = "mothercheese_slice"

/obj/item/reagent_containers/food/snacks/rogue/mothercheese/slice/aged
	name = "slice of cured breastmilk cheese"
	desc = "A golden slice of breast milk cheese."
	icon_state = "cheese_slice"
	become_rot_type = null
	rotprocess = null

/obj/item/reagent_containers/food/snacks/rogue/cheddarslice/aged
	name = "slice of aged cheese"
	desc = "A dangerous slice of cheese."
	icon_state = "blue_cheese_slice"
	become_rot_type = null
	rotprocess = null

/datum/crafting_recipe/roguetown/cooking/cheese/mothersmilk
	name = "fresh mothers' cheese"
	reqs = list(
		/datum/reagent/consumable/breastmilk = 5,
		/obj/item/reagent_containers/powder/salt = 1)
	result = list(/obj/item/reagent_containers/food/snacks/rogue/mothercheese,
				/obj/item/reagent_containers/food/snacks/rogue/mothercheese,
				/obj/item/reagent_containers/food/snacks/rogue/mothercheese)

/datum/crafting_recipe/roguetown/cooking/cheesewheel
	name = "cheese wheel"
	reqs = list(/obj/item/reagent_containers/food/snacks/rogue/cheese = 6)
	result = /obj/item/reagent_containers/food/snacks/rogue/cheddar

	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/cooking/cheesewheel/mother
	name = "wheel of mothers' cheese"
	reqs = list(/obj/item/reagent_containers/food/snacks/rogue/mothercheese = 6)
	result = /obj/item/reagent_containers/food/snacks/rogue/mothercheese/wheel

	subtype_reqs = TRUE

/obj/item/reagent_containers/food/snacks/rogue/pie/mothersmilk/cooked
	icon_state = "pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/pieslice/mothersmilk
	slices_num = 6
	slice_batch = TRUE
	warming = 10 MINUTES
	eat_effect = null

/obj/item/reagent_containers/food/snacks/rogue/pie/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(!.) //if we're not being caught
		splat(hit_atom)

/obj/item/reagent_containers/food/snacks/rogue/pieslice/mothersmilk
	icon = 'icons/roguetown/items/food.dmi'
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	tastes = list("pie" = 1)
	name = "Eoran pie slice"
	desc = ""
	icon_state = "slice"
	filling_color = "#FFFFFF"
	foodtype = GRAIN | DAIRY | SUGAR
	warming = 10 MINUTES
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff

/obj/item/reagent_containers/food/snacks/rogue/piedough
	name = "pie dough"
	desc = ""
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "piedough"
	slices_num = 0
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("dough" = 1)
	foodtype = GRAIN
	eat_effect = /datum/status_effect/debuff/uncookedfood

/datum/crafting_recipe/roguetown/cooking/berrypie/mothersmilk
	name = "Eoran berry pie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough/mothersmilk = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/mothersmilk/berry


/datum/crafting_recipe/roguetown/cooking/applepie/mothersmilk
	name = "Eoran apple pie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/apple = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough/mothersmilk = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/grown/apple = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/mothersmilk/apple

/obj/item/reagent_containers/food/snacks/rogue/pie/mothersmilk/berry
	name = "Eoran berry pie"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/mothersmilk/cooked/berry
	eat_effect = /datum/status_effect/debuff/uncookedfood

/obj/item/reagent_containers/food/snacks/rogue/pie/mothersmilk/cooked/berry
	name = "Eoran berry pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("berries" = 1)

/obj/item/reagent_containers/food/snacks/rogue/pie/mothersmilk/apple
	name = "Eoran apple pie"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/mothersmilk/cooked/apple
	eat_effect = /datum/status_effect/debuff/uncookedfood


/obj/item/reagent_containers/food/snacks/rogue/pie/mothersmilk/cooked/apple
	name = "Eoran apple pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("apples" = 1)

// cum stuff
/obj/item/reagent_containers/food/snacks/rogue/pie/cum/cooked
	icon_state = "pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/pieslice/cum
	slices_num = 6
	slice_batch = TRUE
	warming = 10 MINUTES
	eat_effect = null

/obj/item/reagent_containers/food/snacks/rogue/pieslice/cum
	icon = 'icons/roguetown/items/food.dmi'
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	tastes = list("pie" = 1)
	name = "Slimy eoran pie slice"
	desc = ""
	icon_state = "slice"
	filling_color = "#FFFFFF"
	foodtype = GRAIN | DAIRY | SUGAR
	warming = 10 MINUTES
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff

/datum/crafting_recipe/roguetown/cooking/berrypie/cum
	name = "Slimy eoran berry pie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough/cum = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/grown/berries/rogue = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/cum/berry


/datum/crafting_recipe/roguetown/cooking/applepie/cum
	name = "Slimy eoran apple pie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/apple = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough/cum = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/grown/apple = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/cum/apple

/obj/item/reagent_containers/food/snacks/rogue/pie/cum/berry
	name = "Slimy eoran berry pie"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cum/cooked/berry
	eat_effect = /datum/status_effect/debuff/uncookedfood

/obj/item/reagent_containers/food/snacks/rogue/pie/cum/cooked/berry
	name = "Slimy eoran berry pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("berries" = 1)

/obj/item/reagent_containers/food/snacks/rogue/pie/cum/apple
	name = "Slimy eoran apple pie"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cum/cooked/apple
	eat_effect = /datum/status_effect/debuff/uncookedfood


/obj/item/reagent_containers/food/snacks/rogue/pie/cum/cooked/apple
	name = "Slimy eoran apple pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("apples" = 1)

/datum/crafting_recipe/roguetown/cooking/piedough/cum
	name = "Slimy eoran pie dough"
	reqs = list(
		/datum/reagent/water = 10,
		/obj/item/reagent_containers/powder/flour= 2,
		/datum/reagent/consumable/cum = 15,
		/obj/item/reagent_containers/powder/salt = 1,

	)
	result = /obj/item/reagent_containers/food/snacks/rogue/piedough/cum

/obj/item/reagent_containers/food/snacks/rogue/piedough/cum
	name = "Slimy eoran pie dough"
	desc = "Pie dough produced with mothers' milk and salt instead of butter, used to make meals that are intended as an indulgence between loving couples."
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "piedough"
	slices_num = 0
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cum/cooked
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("sweet dough" = 1)
	foodtype = GRAIN
	eat_effect = /datum/status_effect/debuff/uncookedfood

/datum/crafting_recipe/roguetown/cooking/piedough/mothersmilk
	name = "Eoran pie dough"
	reqs = list(
		/datum/reagent/water = 10,
		/obj/item/reagent_containers/powder/flour= 2,
		/datum/reagent/consumable/breastmilk = 15,
		/obj/item/reagent_containers/powder/salt = 1,

	)
	result = /obj/item/reagent_containers/food/snacks/rogue/piedough/mothersmilk

/obj/item/reagent_containers/food/snacks/rogue/piedough/mothersmilk
	name = "Eoran pie dough"
	desc = "Pie dough produced with mothers' milk and salt instead of butter, used to make meals that are intended as an indulgence between loving couples."
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "piedough"
	slices_num = 0
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/mothersmilk/cooked
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("sweet dough" = 1)
	foodtype = GRAIN
	eat_effect = /datum/status_effect/debuff/uncookedfood

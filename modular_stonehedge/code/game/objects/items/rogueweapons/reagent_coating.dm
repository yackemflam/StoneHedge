//By Vide Noir https://github.com/EaglePhntm.
//reagent coating for weapons that apply on successful hit through armor.

/*todo
- splash or dropper reagent apply
- wash reagent clear
- unarmored hit detection to apply reagent
*/

//component procs
/datum/component/reagent_coatable

	///Reagents holder
	var/datum/reagents/reagents = null
	var/reagent_apply_amt

/datum/component/reagent_coatable/Initialize(...)
	. = ..()
	if(isitem(parent))
		RegisterSignal(parent, COMSIG_APPLY_REAGENTS, PROC_REF(apply_reagents))
		RegisterSignal(parent, COMSIG_COMPONENT_CLEAN_ACT, PROC_REF(clean_react))

/datum/component/reagent_coatable/proc/apply_reagents(mob/living/H)
	if(!H || !istype(H, /mob/living))
		return
	if(reagents.total_volume)
		var/available_reagent_amount = min(reagents.total_volume, reagent_apply_amt)
		reagents.trans_to(H, available_reagent_amount, 1, no_react = FALSE)
		H.visible_message(span_green("[H] shudders with pain!"),span_boldgreen("I feel a burning pain on my wound!"))
		log_admin("[H] was struck with [english_list(reagents.reagent_list)] using a poisoned weapon.")

/datum/component/reagent_coatable/proc/clean_react()
	if(reagents.total_volume)
		reagents.remove_all(reagents.total_volume) //buh bye reagents.

//general weapon procs
/obj/item/rogueweapon
	var/datum/component/reagent_coatable/reagent_coatable
	///incase you want to set something non blunt uncoatable anyways.
	var/uncoatable = FALSE

/obj/item/rogueweapon/Initialize()
	. = ..()
	if(sharpness != IS_BLUNT && !uncoatable)
		reagent_coatable = new /datum/component/reagent_coatable()
		reagent_coatable.reagents = new /datum/reagents(w_class*5, TRANSPARENT|REFILLABLE) //weapon size equals more coatable.
		reagent_coatable.reagent_apply_amt = 5/w_class //smaller weapons will apply more poison at once.

/obj/item/rogueweapon/attackby(obj/item/I, mob/living/user, params)
	. = ..()
	if(reagent_coatable && istype(I, /obj/item/reagent_containers))
		var/waterbuse = 0
		for(var/datum/reagent/water/waterussy in I.reagents.reagent_list)
			waterbuse = waterussy.volume
		reagent_coatable.reagents.remove_all(waterbuse) //buh bye reagents water washes it
		I.reagents.remove_all_type(/datum/reagent/water, waterbuse)
		if(user.used_intent?.type == INTENT_SPLASH) //tries to add everything.
			I.reagents.trans_to(reagent_coatable.reagents, min(I.reagents.total_volume, (reagent_coatable.reagents.maximum_volume - reagent_coatable.reagents.total_volume)))
		else if(user.used_intent?.type == INTENT_FILL) //adds 5 units at most
			I.reagents.trans_to(reagent_coatable.reagents, min((I.reagents.total_volume < 6), (reagent_coatable.reagents.maximum_volume - reagent_coatable.reagents.total_volume)))
		//we dont want water coated weapons so last failsafe
		reagent_coatable.reagents.remove_all_type(/datum/reagent/water, reagent_coatable.reagents.total_volume)

/obj/item/rogueweapon/examine(mob/user)
	. = ..()
	if(reagent_coatable && reagent_coatable.reagents.total_volume)
		if(user.can_see_reagents() || (user.Adjacent(src) && user.mind?.get_skill_level(/datum/skill/misc/alchemy) >= 2)) //Show each individual reagent
			. += "It is coated with:"
			for(var/datum/reagent/R in reagent_coatable.reagents.reagent_list)
				. += "[round(R.volume / 3, 0.1)] oz of <font color=[R.color]>[R.name]</font>"
		else //Otherwise, just show the total volume
			var/total_volume = 0
			var/reagent_color
			for(var/datum/reagent/R in reagent_coatable.reagents.reagent_list)
				total_volume += R.volume
			reagent_color = mix_color_from_reagents(reagent_coatable.reagents.reagent_list)
			if(total_volume / 3 < 1)
				. += "It seems to be coated with less than 1 oz of <font color=[reagent_color]>something.</font>"
			else
				. += "It seems to be coated with [round(total_volume / 3)] oz of <font color=[reagent_color]>something.</font>"

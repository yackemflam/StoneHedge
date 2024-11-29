//By Vide Noir https://github.com/EaglePhntm.
//reagent coating for weapons that apply on successful hit through armor.

/*todo
- splash or dropper reagent apply
- wash reagent clear
- unarmored hit detection to apply reagent
*/

/obj/item/rogueweapon
	var/coatable = TRUE
	var/reagent_cap
	var/reagent_apply_amt

/obj/item/rogueweapon/Initialize()
	. = ..()
	if(coatable && sharpness == IS_BLUNT)
		reagent_cap = w_class*10 //weapon size equals more coatable.
		reagent_apply_amt = 10/w_class //smaller weapons will apply more poison at once.
		create_reagents(reagent_cap, TRANSPARENT|REFILLABLE)

/obj/item/rogueweapon/

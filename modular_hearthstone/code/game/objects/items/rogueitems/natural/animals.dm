/obj/item/hearthnatural/beespider_fang
	name = "beespider fang"
	icon_state = "beespider_fang"
	desc = "The torn fang of a venomous beespider."
	dropshrink = 0.90
	force = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = FLAMMABLE
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
	sellprice = 20
	dropshrink = 0.50
	var/venomamount = 5

/obj/item/hearthnatural/beespider_fang/Initialize()
	. = ..()
	create_reagents(venomamount, DRAINABLE|DRAWABLE) //you can drain it or take with syringes but can not put anything inside.
	reagents.add_reagent(/datum/reagent/toxin/venom, venomamount)

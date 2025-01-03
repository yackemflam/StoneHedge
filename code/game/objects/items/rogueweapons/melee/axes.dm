/obj/item/rogueweapon/stoneaxe
	slot_flags = ITEM_SLOT_HIP | ITEM_SLOT_BACK
	force = 18
	force_wielded = 20
	possible_item_intents = list(/datum/intent/axe/chop/stone)
	name = "stone axe"
	desc = "A rough stone axe. Badly balanced."
	icon_state = "stoneaxe"
	icon = 'icons/roguetown/weapons/32.dmi'
	item_state = "axe"
	lefthand_file = 'icons/mob/inhands/weapons/rogue_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/rogue_righthand.dmi'
	//dropshrink = 0.75
	parrysound = list('sound/combat/parry/wood/parrywood (1).ogg', 'sound/combat/parry/wood/parrywood (2).ogg', 'sound/combat/parry/wood/parrywood (3).ogg')
	swingsound = BLADEWOOSH_MED
	associated_skill = /datum/skill/combat/axes
	max_blade_int = 100
	minstr = 8
	wdefense = 1
	w_class = WEIGHT_CLASS_BULKY
	wlength = WLENGTH_SHORT
	pickup_sound = 'sound/foley/equip/rummaging-03.ogg'
	gripped_intents = list(/datum/intent/axe/chop/stone)


/obj/item/rogueweapon/stoneaxe/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,
"sx" = -15,
"sy" = -12,
"nx" = 9,
"ny" = -11,
"wx" = -11,
"wy" = -11,
"ex" = 1,
"ey" = -12,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 0,
"nturn" = 90,
"sturn" = -90,
"wturn" = -90,
"eturn" = 90,
"nflip" = 0,
"sflip" = 8,
"wflip" = 8,
"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,
"sx" = -15,
"sy" = -1,
"nx" = 10,
"ny" = 0,
"wx" = -13,
"wy" = -1,
"ex" = 2,
"ey" = -1,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 0,
"nturn" = 0,
"sturn" = 0,
"wturn" = 0,
"eturn" = 0,
"nflip" = 0,
"sflip" = 8,
"wflip" = 8,
"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
	return ..()

/datum/intent/axe/chop/stone
	penfactor = 5

/datum/intent/axe/cut
	name = "cut"
	icon_state = "incut"
	blade_class = BCLASS_CUT
	attack_verb = list("cuts", "slashes")
	hitsound = list('sound/combat/hits/bladed/smallslash (1).ogg', 'sound/combat/hits/bladed/smallslash (2).ogg', 'sound/combat/hits/bladed/smallslash (3).ogg')
	animname = "cut"
	penfactor = 10
	chargetime = 0
	item_d_type = "slash"

/datum/intent/axe/chop
	name = "chop"
	icon_state = "inchop"
	blade_class = BCLASS_CHOP
	attack_verb = list("chops", "hacks")
	animname = "chop"
	hitsound = list('sound/combat/hits/bladed/genchop (1).ogg', 'sound/combat/hits/bladed/genchop (2).ogg', 'sound/combat/hits/bladed/genchop (3).ogg')
	penfactor = 20
	swingdelay = 10
	item_d_type = "slash"

/datum/intent/axe/strike
	name = "shaft strike"
	icon_state = "instrike"
	attack_verb = list("bashes", "clubs", "strikes")
	animname = "strike"
	blade_class = BCLASS_BLUNT
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	chargetime = 0
	penfactor = 20
	swingdelay = 5
	damfactor = 0.8
	item_d_type = "blunt"

/datum/intent/axe/chop/battle
	penfactor = 40		//Was 70, 40 is near-equal to spear. This is same pen as an arrow basically; be greatful.
	damfactor = 1.2 	//36 base damage on battleaxe; scales with strength.

/datum/intent/axe/cut/battle
	penfactor = 30		//10 less than chop, and 0.2 less damage than chop. But less stamina cost.

/obj/item/rogueweapon/stoneaxe/battle
	force = 25
	force_wielded = 30
	possible_item_intents = list(/datum/intent/axe/cut/battle, /datum/intent/axe/chop/battle)
	name = "battle axe"
	desc = "A steel battleaxe of war. Has a wicked edge."
	icon_state = "battleaxe"
	max_blade_int = 300
	smeltresult = /obj/item/ingot/steel
	gripped_intents = list(/datum/intent/axe/cut/battle ,/datum/intent/axe/chop/battle)
	minstr = 12
	wdefense = 4

/obj/item/rogueweapon/stoneaxe/battle/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -9,"sy" = -8,"nx" = 9,"ny" = -7,"wx" = -7,"wy" = -8,"ex" = 3,"ey" = -8,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 3,"sy" = -7,"nx" = -6,"ny" = -3,"wx" = 3,"wy" = -4,"ex" = 4,"ey" = -3,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -44,"sturn" = 45,"wturn" = 47,"eturn" = 33,"nflip" = 8,"sflip" = 0,"wflip" = 0,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
	return ..()

/obj/item/rogueweapon/stoneaxe/battle/equipped(mob/user, slot, initial = FALSE)
	. = ..()
	pickup_sound = pick("modular_helmsguard/sound/sheath_sounds/draw_polearm.ogg", "modular_helmsguard/sound/sheath_sounds/draw_spear.ogg")
	sheathe_sound = 'sound/items/wood_sharpen.ogg'

/obj/item/rogueweapon/stoneaxe/woodcut
	name = "axe"
	force = 20
	force_wielded = 26
	possible_item_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop)
	desc = "A regular iron woodcutting axe."
	icon_state = "axe"
	max_blade_int = 400
	smeltresult = /obj/item/ingot/iron
	gripped_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop)
	wdefense = 2

/obj/item/rogueweapon/stoneaxe/woodcut/equipped(mob/user, slot, initial = FALSE)
	pickup_sound = pick("modular_helmsguard/sound/sheath_sounds/draw_polearm.ogg", "modular_helmsguard/sound/sheath_sounds/draw_spear.ogg")
	sheathe_sound = 'sound/items/wood_sharpen.ogg'
	. = ..()

/obj/item/rogueweapon/stoneaxe/handaxe
	force = 19
	possible_item_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop)
	name = "hatchet"
	desc = "An iron hand axe."
	icon_state = "hatchet"
	minstr = 1
	max_blade_int = 400
	smeltresult = /obj/item/ingot/iron
	gripped_intents = null
	wdefense = 2


/obj/item/rogueweapon/stoneaxe/handaxe/equipped(mob/user, slot, initial = FALSE)
	pickup_sound = pick("modular_helmsguard/sound/sheath_sounds/draw_polearm.ogg", "modular_helmsguard/sound/sheath_sounds/draw_spear.ogg")
	sheathe_sound = 'sound/items/wood_sharpen.ogg'
	. = ..()


/obj/item/rogueweapon/stoneaxe/woodcut/steel
	icon_state = "saxe"
	force_wielded = 28
	desc = "A steel woodcutting axe. Performs much better than its iron counterpart."
	max_blade_int = 500
	smeltresult = /obj/item/ingot/steel
	wdefense = 3

/obj/item/rogueweapon/stoneaxe/woodcut/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -9,"sy" = -8,"nx" = 9,"ny" = -7,"wx" = -7,"wy" = -8,"ex" = 3,"ey" = -8,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 2,"sy" = -8,"nx" = -6,"ny" = -3,"wx" = 3,"wy" = -4,"ex" = 4,"ey" = -3,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -44,"sturn" = 45,"wturn" = 47,"eturn" = 33,"nflip" = 8,"sflip" = 0,"wflip" = 0,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/stoneaxe/boneaxe
	slot_flags = ITEM_SLOT_HIP | ITEM_SLOT_BACK
	force = 18
	force_wielded = 22
	possible_item_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop)
	name = "bone axe"
	desc = "A rough axe made of bones"
	icon_state = "boneaxe"
	lefthand_file = 'icons/mob/inhands/weapons/rogue_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/rogue_righthand.dmi'
	//dropshrink = 0.75
	parrysound = list('sound/combat/parry/wood/parrywood (1).ogg', 'sound/combat/parry/wood/parrywood (2).ogg', 'sound/combat/parry/wood/parrywood (3).ogg')
	swingsound = BLADEWOOSH_MED
	associated_skill = /datum/skill/combat/axes
	max_blade_int = 100
	minstr = 8
	wdefense = 1
	w_class = WEIGHT_CLASS_BULKY
	wlength = WLENGTH_SHORT
	pickup_sound = 'sound/foley/equip/rummaging-03.ogg'
	gripped_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop)

/obj/item/rogueweapon/stoneaxe/boneaxe/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -9,"sy" = -8,"nx" = 9,"ny" = -7,"wx" = -7,"wy" = -8,"ex" = 3,"ey" = -8,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 3,"sy" = -7,"nx" = -6,"ny" = -3,"wx" = 3,"wy" = -4,"ex" = 4,"ey" = -3,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -44,"sturn" = 45,"wturn" = 47,"eturn" = 33,"nflip" = 8,"sflip" = 0,"wflip" = 0,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
	return ..()
/obj/item/rogueweapon/greataxe
	force = 20
	force_wielded = 40
	possible_item_intents = list(/datum/intent/axe/chop/battle, /datum/intent/sword/strike) //strike is for nonlethal takedowns, only targets limbs
	gripped_intents = list(/datum/intent/axe/cut/great, /datum/intent/axe/chop/great,  /datum/intent/axe/strike/great)
	name = "greataxe"
	desc = "Might be able to chop anything in half!"
	icon_state = "greataxe"
	icon = 'icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	minstr = 10
	smeltresult = /obj/item/ingot/steel
	associated_skill = /datum/skill/combat/axes
	max_blade_int = 300
	wdefense = 2

/datum/intent/axe/cut/great
	penfactor = 15

/datum/intent/axe/chop/great
	penfactor = 30

/datum/intent/axe/strike/great
	penfactor = 30
	damfactor = 0.6

/obj/item/rogueweapon/greataxe/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/greataxe/bearded
	name = "bearded axe"
	icon_state = "beardedaxe"

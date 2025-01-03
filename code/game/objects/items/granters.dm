
///books that teach things (intrinsic actions like bar flinging, spells like fireball or smoke, or martial arts)///

/obj/item/book/granter
	due_date = 0 // Game time in deciseconds
	unique = 1   // 0  Normal book, 1  Should not be treated as normal book, unable to be copied, unable to be modified
	var/list/remarks = list() //things to read about while learning.
	var/pages_to_mastery = 3 //Essentially controls how long a mob must keep the book in his hand to actually successfully learn
	var/reading = FALSE //sanity
	var/oneuse = TRUE //default this is true, but admins can var this to 0 if we wanna all have a pass around of the rod form book
	var/used = FALSE //only really matters if oneuse but it might be nice to know if someone's used it for admin investigations perhaps
	var/required_trait = null
	var/required_learn_trait = null

/obj/item/book/granter/proc/turn_page(mob/user)
	playsound(user, pick('sound/blank.ogg'), 30, TRUE)
	if(do_after(user,50, user))
		if(remarks.len)
			to_chat(user, span_notice("[pick(remarks)]"))
		else
			to_chat(user, span_notice("I keep reading..."))
		return TRUE
	return FALSE

/obj/item/book/granter/proc/recoil(mob/user) //nothing so some books can just return

/obj/item/book/granter/proc/already_known(mob/user)
	return FALSE

/obj/item/book/granter/proc/on_reading_start(mob/user)
	to_chat(user, span_notice("I start absorbing knowledge of [name]..."))

/obj/item/book/granter/proc/on_reading_stopped(mob/user)
	to_chat(user, span_notice("I stop absorbing knowledge..."))

/obj/item/book/granter/proc/on_reading_finished(mob/user)
	to_chat(user, span_notice("I finish absorbing from the [name]!"))

/obj/item/book/granter/proc/onlearned(mob/user)
	used = TRUE


/obj/item/book/granter/attack_self(mob/living/user)
	if(user.attunement_points_used + attunement_cost > user.attunement_points_max)
		to_chat(user, span_warning("A sharp arcyne pain stops me from using this currently!"))
		return FALSE
	if(reading)
		to_chat(user, span_warning("You're already using this!"))
		return FALSE
//	if(!user.can_read(src))
//		return FALSE
	if(already_known(user))
		return FALSE
//	if(!user.can_read(src))
//		return FALSE
	if(user.STAINT < 8)
		to_chat(user, span_warning("You can't make sense of the sprawling runes, you are just too dumb!"))
		return FALSE
	if(required_learn_trait)
		if(!HAS_TRAIT(user, required_learn_trait))
			to_chat(user, span_warning("You can't figure out a way to use this!"))
			return FALSE
	if(used)
		if(oneuse)
			recoil(user)
			to_chat(user, span_warning("The essence of this crystal is completely drained."))
		return FALSE
	else
		on_reading_start(user)
		reading = TRUE
		for(var/i=1, i<=pages_to_mastery, i++)
			if(!turn_page(user))
				on_reading_stopped()
				reading = FALSE
				return
		if(do_after(user,50, user))
			on_reading_finished(user)
		reading = FALSE
	return TRUE

///TRAITS///

/obj/item/book/granter/trait
	var/granted_trait
	var/granted_trait2
	var/traitname = "being cool"
	var/list/crafting_recipe_types = list()
	desc = "A fragmented crystal shard, imbuded with magicks unknown. If held tight, they will share their knowledge with the beholder."
	oneuse = TRUE
	icon = 'icons/obj/crystal.dmi'
	icon_state ="Crystal"
	light_range = 1.5
	light_power = 150
	sellprice = 20
	drop_sound = 'sound/items/gem.ogg'
	pickup_sound =  list('sound/vo/mobs/ghost/whisper (1).ogg','sound/vo/mobs/ghost/whisper (2).ogg','sound/vo/mobs/ghost/whisper (3).ogg')
	attunement_cost = 3

/obj/item/book/granter/trait/already_known(mob/user)
	if(!granted_trait)
		return TRUE
	if(HAS_TRAIT(user, granted_trait) && HAS_TRAIT(user, granted_trait2))
		to_chat(user, "<span class ='notice'>You already have all the insight you need from [traitname].")
		return TRUE
	return FALSE

/obj/item/book/granter/trait/on_reading_start(mob/user)
	to_chat(user, "<span class='notice'>Voices fill your head, imbuing you with the power of [traitname].</span>")
	playsound(user, pick('sound/vo/mobs/ghost/whisper (1).ogg','sound/vo/mobs/ghost/whisper (2).ogg','sound/vo/mobs/ghost/whisper (3).ogg'), 30, TRUE)

/obj/item/book/granter/trait/on_reading_finished(mob/living/user)
	if((user.attunement_points_max - user.attunement_points_used) + attunement_cost > 0)
		. = ..()
		to_chat(user, "<span class='notice'>The shard dims, granting you knowledge of [traitname]!</span>")
		if(!HAS_TRAIT(user, granted_trait))
			ADD_TRAIT(user, granted_trait, SHARD_TRAIT)
		if(!HAS_TRAIT(user, granted_trait2))
			ADD_TRAIT(user, granted_trait2, SHARD_TRAIT)
		name = "drained crystal shard"
		desc = "The essence of this crystal is completely drained."
		color = null
		light_range = 0
		light_power = 0
		icon_state ="Crystal2"
		if(!user.mind)
			return
		for(var/crafting_recipe_type in crafting_recipe_types)
			var/datum/crafting_recipe/R = crafting_recipe_type
			user.mind.teach_crafting_recipe(crafting_recipe_type)
			to_chat(user,"<span class='notice'>You learned how to make [initial(R.name)].</span>")
		user.attunement_points_used += attunement_cost
		user.check_attunement_points()
		onlearned(user)
	else
		to_chat(user, "<span class='notice'>The shard refuses me, I can not attune to more..</span>")
		return

/obj/item/book/granter/trait/mobility
	light_color = "#32CD32"
	color = "#32CD32"
/obj/item/book/granter/trait/mobility/bogtrek
	name = "Fragment of the Swamp"
	granted_trait = TRAIT_BOG_TREKKING
	traitname = "the swamp"
	remarks = list("<font color='#32CD32'>The forest will guide you.", "<font color='#32CD32'>March with haste, there is no fear.", "<font color='#32CD32'>Be one with your surroundings.", "<font color='#32CD32'>What are you doing in my swamp?", "<font color='#32CD32'>Step light, step quick.</font>",)
/obj/item/book/granter/trait/mobility/kneestinger
	name = "Fragment of Sylvarhn"
	granted_trait = TRAIT_KNEESTINGER_IMMUNITY
	traitname = "Dendor"
	remarks = list("<font color='#32CD32'>Nature guides me.", "<font color='#32CD32'>You feel a shiver up your spine.", "<font color='#32CD32'>Your feet go numb.", "<font color='#32CD32'>Dendor watches my path.", "<font color='#32CD32'>I walk without fear...</font>",)

/obj/item/book/granter/trait/defense
	light_color = "#4f83ff"
	color = "#4f83ff"
/obj/item/book/granter/trait/defense/mediumarmor
	name = "Fragment of the Old Guard"
	granted_trait = TRAIT_MEDIUMARMOR
	traitname = "medium armor"
	remarks = list("<font color='#4f83ff'>Medium armor offers both mobility and protection.", "<font color='#4f83ff'>Wearing medium armor will give you an edge.", "<font color='#4f83ff'>Medium armor has been used since the dawn of time.", "<font color='#4f83ff'>A warrior knows when to strike.", "<font color='#4f83ff'>A warrior knows when to move.</font>",)
/obj/item/book/granter/trait/defense/heavyarmor
	name = "Fragment of the Forgotten Knight"
	granted_trait = TRAIT_HEAVYARMOR
	traitname = "heavy armor"
	remarks = list("<font color='#4f83ff'>Everything or nothing.", "<font color='#4f83ff'>Heavy armor is for the most couragious.", "<font color='#4f83ff'>If you choose to wear heavy armor, you choose to stand your ground.", "Clad in shiny armor, I am a beckon of power.", "<font color='#4f83ff'>Heavy metal is for the brave.</font>",)


/obj/item/book/granter/trait/war
	light_color = "#d40303fb"
	color = "#d40303fb"
/obj/item/book/granter/trait/war/undying
	name = "Fragment of the Undying"
	granted_trait = TRAIT_NOPAIN
	granted_trait2 = TRAIT_BLOODLOSS_IMMUNE
	traitname = "the undying"
	remarks = list("<span class ='colossus'>Curse, bless, me now with your fierce tears, I pray.</span>", "<span class ='colossus'>Rage, rage against the dying of the light.</span>", "<span class ='colossus'>Grave men, near death, who see with blinding sight.</span>", "<span class ='colossus'>Do not go gentle into that good night.</span>",)
	attunement_cost = 5

/obj/item/book/granter/trait/war/relentless
	name = "Fragment of the Relentless"
	granted_trait = TRAIT_NOROGSTAM
	traitname = "the relentless"
	remarks = list("<span class ='colossus'>Death can have me, when I am done.", "<span class ='colossus'>Rip and tear.", "<span class ='colossus'>This is where we hold them. This is where they die.", "<span class ='colossus'>Let go of everything.", "<span class ='colossus'>No surrender. No retreat.</span>",)
	attunement_cost = 5

/obj/item/book/granter/trait/acrobat
	name = "Fragment of the Acrobat"
	light_color = "#f3fd2bfb"
	color = "#f3fd2bfb"
	granted_trait = TRAIT_NOFALLDAMAGE1
	granted_trait2 = TRAIT_ZJUMP
	traitname = "the acrobat"
	remarks = list("<font color='#f3fd2bfb'>Nothing stops the fleetfooted!", "<font color='#f3fd2bfb'>Which way is up? I forgot!", "<font color='#f3fd2bfb'>The sky is the limits!", "<font color='#f3fd2bfb'>Always land on your feet!", "<font color='#f3fd2bfb'>Who needs stairs?!</font>",)

/obj/item/book/granter/trait/succubus
	name = "Fragment of the Succubus"
	light_color = "#b028fffb"
	color = "#b028fffb"
	granted_trait = TRAIT_DEATHBYSNOOSNOO
	granted_trait2 = TRAIT_GOODLOVER
	sellprice = 50
	traitname = "the succubus"
	remarks = list("<font color='#b028fffb'>They like what they see.", "<font color='#b028fffb'>I can't wait to hear you scream.", "<font color='#b028fffb'>So many hearts to break, so little time.","<font color='#b028fffb'>Without pain, how would they know pleasure?</font>",)
	attunement_cost = 2

/obj/item/book/granter/trait/north
	name = "Fragment of the North"
	light_color = "#28d8fffb"
	color = "#28d8fffb"
	granted_trait = TRAIT_VIKINGCAMP
	sellprice = 150
	traitname = "the north"
	remarks = list("<font color='#28d8fffb'>It is important to stay warm.", "<font color='#28d8fffb'>Sail em high.", "<font color='#28d8fffb'>Plug the holes of your ship with a finger.","<font color='#28d8fffb'>Just follow the North Star.</font>",)
	attunement_cost = 2
///ACTION BUTTONS///

/obj/item/book/granter/action
	var/granted_action
	var/actionname = "catching bugs" //might not seem needed but this makes it so you can safely name action buttons toggle this or that without it fucking up the granter, also caps

/obj/item/book/granter/action/already_known(mob/user)
	if(!granted_action)
		return TRUE
	for(var/datum/action/A in user.actions)
		if(A.type == granted_action)
			to_chat(user, span_warning("I already know all about [actionname]!"))
			return TRUE
	return FALSE

/obj/item/book/granter/action/on_reading_start(mob/user)
	to_chat(user, span_notice("I start reading about [actionname]..."))

/obj/item/book/granter/action/on_reading_finished(mob/user)
	to_chat(user, span_notice("I feel like you've got a good handle on [actionname]!"))
	var/datum/action/G = new granted_action
	G.Grant(user)
	onlearned(user)

/obj/item/book/granter/action/origami
	granted_action = /datum/action/innate/origami
	name = "The Art of Origami"
	desc = ""
	icon_state = "origamibook"
	actionname = "origami"
	oneuse = TRUE
	remarks = list("Dead-stick stability...", "Symmetry seems to play a rather large factor...", "Accounting for crosswinds... really?", "Drag coefficients of various paper types...", "Thrust to weight ratios?", "Positive dihedral angle?", "Center of gravity forward of the center of lift...")

/datum/action/innate/origami
	name = "Origami Folding"
	desc = ""
	button_icon_state = "origami_off"
	check_flags = NONE

/datum/action/innate/origami/Activate()
	to_chat(owner, span_notice("I will now fold origami planes."))
	button_icon_state = "origami_on"
	active = TRUE
	UpdateButtonIcon()

/datum/action/innate/origami/Deactivate()
	to_chat(owner, span_notice("I will no longer fold origami planes."))
	button_icon_state = "origami_off"
	active = FALSE
	UpdateButtonIcon()

///SPELLS///

/obj/item/book/granter/spell
	var/spell
	var/spellname = "conjure bugs"
	var/spell_slot_cost = 1
	//Can this be one-casted by non learnables?
	var/castable = TRUE
	var/usable_times = 10
	required_trait = TRAIT_USEMAGIC
	required_learn_trait = TRAIT_LEARNMAGIC
	//should help us not remove spells from people that have em memorized.
	var/user_has_spell_already = FALSE

/obj/item/book/granter/spell/Initialize()
	. = ..()
	desc = "The arcyne ink on it is at pristine condition and may be cast off of [usable_times] times."

/obj/item/book/granter/spell/equipped(mob/user, slot, initial)
	. = ..()
	if(spell && castable && HAS_TRAIT(user, required_trait) && !HAS_TRAIT(user, required_learn_trait))
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			for(var/obj/effect/proc_holder/spell/knownspell in user.mind.spell_list)
				if(knownspell == spell)
					user_has_spell_already = TRUE
					return
			if(H.mind)
				H.mind.AddSpell(new spell)

/obj/item/book/granter/spell/dropped(mob/user, silent)
	. = ..()
	if(spell && castable && HAS_TRAIT(user, required_trait) && !user_has_spell_already && !HAS_TRAIT(user, required_learn_trait))
		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			if(H.mind)
				H.mind.RemoveSpell(spell)
	user_has_spell_already = FALSE //reset

/obj/item/book/granter/spell/already_known(mob/user)
	if(!spell)
		return TRUE
	for(var/obj/effect/proc_holder/spell/knownspell in user.mind.spell_list)
		if(knownspell.type == spell)
			if(user.mind)
				if(iswizard(user))
					to_chat(user,span_warning("You're already far more versed in this spell than this flimsy how-to book can provide!"))
				else
					to_chat(user,span_warning("You've already read this one!"))
			return TRUE
	return FALSE

/obj/item/book/granter/spell/on_reading_start(mob/user)
	to_chat(user, span_notice("I start reading about casting [spellname]..."))

/obj/item/book/granter/spell/on_reading_finished(mob/living/user)
	user.calculate_spell_slots()
	if(user.spell_slots - spell_slot_cost >= 0)
		to_chat(user, span_notice("I feel like you've experienced enough to cast [spellname]!"))
		var/obj/effect/proc_holder/spell/S = new spell
		user.spell_slots_used += 1
		user.calculate_spell_slots(TRUE)
		user.mind.AddSpell(S)
		user.log_message("learned the spell [spellname] ([S])", LOG_ATTACK, color="orange")
		onlearned(user)
	else
		to_chat(user, span_notice("I can't memorize any more spells looks like..."))
		return

/obj/item/book/granter/spell/recoil(mob/user)
	user.visible_message(span_warning("[src] glows in a black light!"))

/obj/item/book/granter/spell/onlearned(mob/user)
	..()
	if(oneuse)
		user.visible_message(span_warning("[src] glows dark for a second!"))

/obj/item/book/granter/spell/fireball
	spell = /obj/effect/proc_holder/spell/aimed/fireball
	spellname = "fireball"
	icon_state ="bookfireball"
	desc = ""
	remarks = list("Aim...AIM, FOOL!", "Just catching them on fire won't do...", "Accounting for crosswinds... really?", "I think I just burned my hand...", "Why the dumb stance? It's just a flick of the hand...", "OMEE... ONI... Ugh...", "What's the difference between a fireball and a pyroblast...")

/obj/item/book/granter/spell/fireball/recoil(mob/user)
	..()
	explosion(user.loc, 1, 0, 2, 3, FALSE, FALSE, 2)
	qdel(src)

/obj/item/book/granter/spell/sacredflame
	spell = /obj/effect/proc_holder/spell/targeted/sacred_flame
	spellname = "sacred flame"
	icon_state ="booksacredflame"
	desc = ""
	remarks = list("Well, it's one way to stop an attacker...", "I'm gonna need some good gear to stop myself from burning to death...", "Keep a fire extinguisher handy, got it...", "I think I just burned my hand...", "Apply flame directly to chest for proper ignition...", "No pain, no gain...", "One with the flame...")

/obj/item/book/granter/spell/smoke
	spell = /obj/effect/proc_holder/spell/targeted/smoke
	spellname = "smoke"
	icon_state ="booksmoke"
	desc = ""
	remarks = list("Smoke Bomb! Heh...", "Smoke bomb would do just fine too...", "Wait, there's a machine that does the same thing in chemistry?", "This book smells awful...", "Why all these weed jokes? Just tell me how to cast it...", "Wind will ruin the whole spell, good thing we're in space... Right?", "So this is how the spider clan does it...")

/obj/item/book/granter/spell/smoke/lesser //Chaplain smoke book
	spell = /obj/effect/proc_holder/spell/targeted/smoke/lesser

/obj/item/book/granter/spell/smoke/recoil(mob/user)
	..()
	to_chat(user,span_warning("My stomach rumbles..."))
	if(user.nutrition)
		user.set_nutrition(200)
		if(user.nutrition <= 0)
			user.set_nutrition(0)

/obj/item/book/granter/spell/blind
	spell = /obj/effect/proc_holder/spell/targeted/trigger/blind
	spellname = "blind"
	icon_state ="bookblind"
	desc = ""
	remarks = list("Well I can't learn anything if I can't read the damn thing!", "Why would you use a dark font on a dark background...", "Ah, I can't see an Oh, I'm fine...", "I can't see my hand...!", "I'm manually blinking, damn you book...", "I can't read this page, but somehow I feel like I learned something from it...", "Hey, who turned off the lights?")

/obj/item/book/granter/spell/blind/recoil(mob/user)
	..()
	to_chat(user,span_warning("I go blind!"))
	user.blind_eyes(10)

/obj/item/book/granter/spell/mindswap
	spell = /obj/effect/proc_holder/spell/targeted/mind_transfer
	spellname = "mindswap"
	icon_state ="bookmindswap"
	desc = ""
	var/mob/stored_swap //Used in used book recoils to store an identity for mindswaps
	remarks = list("If you mindswap from a mouse, they will be helpless when you recover...", "Wait, where am I...?", "This book is giving me a horrible headache...", "This page is blank, but I feel words popping into my head...", "GYNU... GYRO... Ugh...", "The voices in my head need to stop, I'm trying to read here...", "I don't think anyone will be happy when I cast this spell...")

/obj/item/book/granter/spell/mindswap/onlearned()
	spellname = pick("fireball","smoke","blind","forcewall","knock","barnyard","charge")
	icon_state = "book[spellname]"
	name = "spellbook of [spellname]" //Note, desc doesn't change by design
	..()

/obj/item/book/granter/spell/mindswap/recoil(mob/user)
	..()
	if(stored_swap in GLOB.dead_mob_list)
		stored_swap = null
	if(!stored_swap)
		stored_swap = user
		to_chat(user,span_warning("For a moment you feel like you don't even know who you are anymore."))
		return
	if(stored_swap == user)
		to_chat(user,span_notice("I stare at the book some more, but there doesn't seem to be anything else to learn..."))
		return
	var/obj/effect/proc_holder/spell/targeted/mind_transfer/swapper = new
	if(swapper.cast(list(stored_swap), user, TRUE, TRUE))
		to_chat(user,span_warning("You're suddenly somewhere else... and someone else?!"))
		to_chat(stored_swap,span_warning("Suddenly you're staring at [src] again... where are you, who are you?!"))
	else
		user.visible_message(span_warning("[src] fizzles slightly as it stops glowing!")) //if the mind_transfer failed to transfer mobs, likely due to the target being catatonic.

	stored_swap = null

/obj/item/book/granter/spell/forcewall
	spell = /obj/effect/proc_holder/spell/targeted/forcewall
	spellname = "forcewall"
	icon_state ="bookforcewall"
	desc = ""
	remarks = list("I can go through the wall! Neat.", "Why are there so many mime references...?", "This would cause much grief in a hallway...", "This is some surprisingly strong magic to create a wall nobody can pass through...", "Why the dumb stance? It's just a flick of the hand...", "Why are the pages so hard to turn, is this even paper?", "I can't mo Oh, i'm fine...")

/obj/item/book/granter/spell/forcewall/recoil(mob/living/user)
	..()
	to_chat(user,span_warning("I suddenly feel very solid!"))
	user.Stun(40, ignore_canstun = TRUE)
	user.petrify(30)

/obj/item/book/granter/spell/knock
	spell = /obj/effect/proc_holder/spell/aoe_turf/knock
	spellname = "knock"
	icon_state ="bookknock"
	desc = ""
	remarks = list("Open Sesame!", "So THAT'S the magic password!", "Slow down, book. I still haven't finished this page...", "The book won't stop moving!", "I think this is hurting the spine of the book...", "I can't get to the next page, it's stuck t- I'm good, it just turned to the next page on it's own.", "Yeah, staff of doors does the same thing. Go figure...")

/obj/item/book/granter/spell/knock/recoil(mob/living/user)
	..()
	to_chat(user,span_warning("You're knocked down!"))
	user.Paralyze(40)

/obj/item/book/granter/spell/barnyard
	spell = /obj/effect/proc_holder/spell/targeted/barnyardcurse
	spellname = "barnyard"
	icon_state ="bookhorses"
	desc = ""
	remarks = list("Moooooooo!","Moo!","Moooo!", "NEEIIGGGHHHH!", "NEEEIIIIGHH!", "NEIIIGGHH!", "HAAWWWWW!", "HAAAWWW!", "Oink!", "Squeeeeeeee!", "Oink Oink!", "Ree!!", "Reee!!", "REEE!!", "REEEEE!!")

/obj/item/book/granter/spell/barnyard/recoil(mob/living/carbon/user)
	if(ishuman(user))
		to_chat(user,"<font size='15' color='red'><b>HORSIE HAS RISEN</b></font>")
		var/obj/item/clothing/magichead = new /obj/item/clothing/mask/horsehead/cursed(user.drop_location())
		if(!user.dropItemToGround(user.wear_mask))
			qdel(user.wear_mask)
		user.equip_to_slot_if_possible(magichead, SLOT_WEAR_MASK, TRUE, TRUE)
		qdel(src)
	else
		to_chat(user,span_notice("I say thee neigh")) //It still lives here

/obj/item/book/granter/spell/charge
	spell = /obj/effect/proc_holder/spell/targeted/charge
	spellname = "charge"
	icon_state ="bookcharge"
	desc = ""
	remarks = list("I feel ALIVE!", "I CAN TASTE THE MANA!", "What a RUSH!", "I'm FLYING through these pages!", "THIS GENIUS IS MAKING IT!", "This book is ACTION PAcKED!", "HE'S DONE IT", "LETS GOOOOOOOOOOOO")

/obj/item/book/granter/spell/charge/recoil(mob/user)
	..()
	to_chat(user,span_warning("[src] suddenly feels very warm!"))
	empulse(src, 1, 1)

/obj/item/book/granter/spell/summonitem
	spell = /obj/effect/proc_holder/spell/targeted/summonitem
	spellname = "instant summons"
	icon_state ="booksummons"
	desc = ""
	remarks = list("I can't look away from the book!", "The words seem to pop around the page...", "I just need to focus on one item...", "Make sure to have a good grip on it when casting...", "Slow down, book. I still haven't finished this page...", "Sounds pretty great with some other magical artifacts...", "Magicians must love this one.")

/obj/item/book/granter/spell/summonitem/recoil(mob/user)
	..()
	to_chat(user,span_warning("[src] suddenly vanishes!"))
	qdel(src)

/obj/item/book/granter/spell/random
	icon_state = "random_book"

/obj/item/book/granter/spell/random/Initialize()
	. = ..()
	var/static/banned_spells = list(/obj/item/book/granter/spell/mimery_blockade, /obj/item/book/granter/spell/mimery_guns)
	var/real_type = pick(subtypesof(/obj/item/book/granter/spell) - banned_spells)
	new real_type(loc)
	return INITIALIZE_HINT_QDEL

///MARTIAL ARTS///

/obj/item/book/granter/martial
	var/martial
	var/martialname = "bug jitsu"
	var/greet = "You feel like you have mastered the art in breaking code. Nice work, jackass."


/obj/item/book/granter/martial/already_known(mob/user)
	if(!martial)
		return TRUE
	var/datum/martial_art/MA = martial
	if(user.mind.has_martialart(initial(MA.id)))
		to_chat(user,span_warning("I already know [martialname]!"))
		return TRUE
	return FALSE

/obj/item/book/granter/martial/on_reading_start(mob/user)
	to_chat(user, span_notice("I start reading about [martialname]..."))

/obj/item/book/granter/martial/on_reading_finished(mob/user)
	to_chat(user, "[greet]")
	var/datum/martial_art/MA = new martial
	MA.teach(user)
	user.log_message("learned the martial art [martialname] ([MA])", LOG_ATTACK, color="orange")
	onlearned(user)

/obj/item/book/granter/martial/cqc
	martial = /datum/martial_art/cqc
	name = "old manual"
	martialname = "close quarters combat"
	desc = ""
	greet = span_boldannounce("You've mastered the basics of CQC.")
	icon_state = "cqcmanual"
	remarks = list("Kick... Slam...", "Lock... Kick...", "Strike their abdomen, neck and back for critical damage...", "Slam... Lock...", "I could probably combine this with some other martial arts!", "Words that kill...", "The last and final moment is yours...")

/obj/item/book/granter/martial/cqc/onlearned(mob/living/carbon/user)
	..()
	if(oneuse == TRUE)
		to_chat(user, span_warning("[src] beeps ominously..."))

/obj/item/book/granter/martial/cqc/recoil(mob/living/carbon/user)
	to_chat(user, span_warning("[src] explodes!"))
	playsound(src,'sound/blank.ogg',40,TRUE)
	user.flash_act(1, 1)
	user.adjustBruteLoss(6)
	user.adjustFireLoss(6)
	qdel(src)

/obj/item/book/granter/martial/carp
	martial = /datum/martial_art/the_sleeping_carp
	name = "mysterious scroll"
	martialname = "sleeping carp"
	desc = ""
	greet = "<span class='sciradio'>I have learned the ancient martial art of the Sleeping Carp! Your hand-to-hand combat has become much more effective, and you are now able to deflect any projectiles \
	directed toward you. However, you are also unable to use any ranged weaponry. You can learn more about my newfound art by using the Recall Teachings verb in the Sleeping Carp tab.</span>"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "scroll2"
	remarks = list("I must prove myself worthy to the masters of the sleeping carp...", "Stance means everything...", "Focus... And you'll be able to incapacitate any foe in seconds...", "I must pierce armor for maximum damage...", "I don't think this would combine with other martial arts...", "Grab them first so they don't retaliate...", "I must prove myself worthy of this power...")

/obj/item/book/granter/martial/carp/onlearned(mob/living/carbon/user)
	..()
	if(oneuse == TRUE)
		desc = ""
		name = "empty scroll"
		icon_state = "blankscroll"

/obj/item/book/granter/martial/plasma_fist
	martial = /datum/martial_art/plasma_fist
	name = "frayed scroll"
	martialname = "plasma fist"
	desc = ""
	greet = "<span class='boldannounce'>I have learned the ancient martial art of Plasma Fist. Your combos are extremely hard to pull off, but include some of the most deadly moves ever seen including \
	the plasma fist, which when pulled off will make someone violently explode.</span>"
	icon = 'icons/obj/wizard.dmi'
	icon_state ="scroll2"
	remarks = list("Balance...", "Power...", "Control...", "Mastery...", "Vigilance...", "Skill...")

/obj/item/book/granter/martial/plasma_fist/onlearned(mob/living/carbon/user)
	..()
	if(oneuse == TRUE)
		desc = ""
		name = "empty scroll"
		icon_state = "blankscroll"

// I did not include mushpunch's grant, it is not a book and the item does it just fine.

//Crafting Recipe books

/obj/item/book/granter/crafting_recipe
	var/list/crafting_recipe_types = list()

/obj/item/book/granter/crafting_recipe/on_reading_finished(mob/user)
	. = ..()
	if(!user.mind)
		return
	for(var/crafting_recipe_type in crafting_recipe_types)
		var/datum/crafting_recipe/R = crafting_recipe_type
		user.mind.teach_crafting_recipe(crafting_recipe_type)
		to_chat(user,span_notice("I learned how to make [initial(R.name)]."))

//! --BLACKSTONE SCROLLS-- !/
/obj/item/book/granter/spell/blackstone/
    desc = "A scroll of potential known only to those that can decipher its secrets."
    icon = 'icons/roguetown/items/misc.dmi'
    oneuse = TRUE
    drop_sound = 'sound/foley/dropsound/paper_drop.ogg'
    pickup_sound =  'sound/blank.ogg'

/obj/item/book/granter/spell/blackstone/onlearned(mob/living/carbon/user)
	..()
	if(oneuse == TRUE)
		qdel(src) //no need this trash.
		user.visible_message(span_warning("[src] has had its magic ink ripped from the scroll, it disintegrates to dust!"))

/obj/item/book/granter/spell/blackstone/fireball
	name = "Scroll of Fireball"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/fireball
	spellname = "fireball"
	icon_state ="scrollred"
	remarks = list("Ignis et oleum..", "Flammam continere ad momentum..", "Flammam iactare..", "Sit flamma constructum..")

/obj/item/book/granter/spell/blackstone/greaterfireball
	name = "Scroll of Greater Fireball"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/fireball/greater
	spellname = "greater fireball"
	icon_state ="scrollred"
	remarks = list("Ignis et oleum..", "Flammam continere ad momentum..", "Flammam iactare..", "Sit flamma constructum..")

/obj/item/book/granter/spell/blackstone/lightning
	name = "Scroll of Lightning"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/lightningbolt
	spellname = "lightning"
	icon_state ="scrollyellow"
	remarks = list("Essentia fulgurum digitorum..", "Fulgur de nubibus desuper..", "Fulgur eiecit digitos..", "Praecipe intus aedificatur..")

/obj/item/book/granter/spell/blackstone/fetch
	name = "Scroll of Fetch"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/fetch
	spellname = "fetch"
	icon_state ="scrollpurple"
	remarks = list("Returnus Revico..", "Manus de reverti..", "Menus de returnus..")

/obj/item/book/granter/spell/blackstone/blindness
	name = "Scroll of Blindness"
	spell = /obj/effect/proc_holder/spell/invoked/blindness
	spellname = "blindness"
	icon_state ="scrollpurple"
	remarks = list("Occultare oculos..", "Vivus amoevtar..", "Visioner removan..")

/obj/item/book/granter/spell/blackstone/invisibility
	name = "Scroll of Invisibility"
	spell = /obj/effect/proc_holder/spell/invoked/invisibility
	spellname = "invisibility"
	icon_state ="scrollpurple"
	remarks = list("Pallium nihilum..", "Occultare veritatem..", "Veritatem removan menor..")

/obj/item/book/granter/spell/blackstone/skeleton
	name = "Scroll of Raise Skeleton"
	spell = /obj/effect/proc_holder/spell/invoked/raise_undead
	spellname = "Raise Skeleton"
	icon_state ="scrolldarkred"
	remarks = list("Redi damnatos..", "Exitio ad Necram scriptor exolvuntur..", "Ossa in propinquus..")

/obj/item/book/granter/spell/blackstone/sicknessray
	name = "Scroll of Sickness Ray"
	spell = /obj/effect/proc_holder/spell/invoked/projectile/sickness
	spellname = "Ray of Sickness"
	icon_state ="scrollgreen"
	remarks = list("Foe rubiginem meam..", "Pestilentia in terris..", "Trabes putrida..")

/obj/item/book/granter/spell/blackstone/strengthen_undead
	name = "Scroll of Bone Chill"
	spell = /obj/effect/proc_holder/spell/invoked/strengthen_undead
	spellname = "Bone Chill"
	icon_state ="scrolldarkred"
	remarks = list("Mediolanum ventis..", "Sana damnatorum..", "Frigidus ossa mortuorum..")

//scroll for giving the reader a spell point, this should be dungeon loot
/obj/item/book/granter/spell_points
	name = "Arcyne Insight"
	icon_state = "scrollpurple"
	icon = 'icons/roguetown/items/misc.dmi'
	oneuse = TRUE
	drop_sound = 'sound/foley/dropsound/paper_drop.ogg'
	pickup_sound =  'sound/blank.ogg'

/obj/item/book/granter/spell_points/on_reading_finished(mob/user)
	to_chat(user, span_notice("I absorb the insights on the scroll, and feel more adept at spellcraft!"))
	user.mind.adjust_spellpoints(1)
	onlearned(user)

/obj/item/book/granter/spell_points/onlearned(mob/living/carbon/user)
	..()
	if(oneuse == TRUE)
		qdel(src) //no need this trash.
		user.visible_message(span_warning("[src] has had its magic ink ripped from the scroll, it disintegrates to dust!"))

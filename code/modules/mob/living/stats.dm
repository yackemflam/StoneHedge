#define STAT_STRENGTH "strength"
#define STAT_PERCEPTION "perception"
#define STAT_INTELLIGENCE "intelligence"
#define STAT_CONSTITUTION "constitution"
#define STAT_ENDURANCE "endurance"
#define STAT_SPEED "speed"
#define STAT_FORTUNE "fortune"

/mob/living
	var/STASTR = 10
	var/STAPER = 10
	var/STAINT = 10
	var/STACON = 10
	var/STAEND = 10
	var/STASPD = 10
	var/STALUC = 10
	//buffers, the 'true' amount of each stat
	var/BUFSTR = 0
	var/BUFPER = 0
	var/BUFINT = 0
	var/BUFCON = 0
	var/BUFEND = 0
	var/BUFSPE = 0
	var/BUFLUC = 0
	var/statbuf = FALSE
	var/list/statindex = list()
	var/datum/patron/patron = /datum/patron/godless

	var/attunement_points_max = 0 //how many magic items can you wear, magic items cost 1 to 5
	var/attunement_points_used = 0 //adjusted when equipping magic items
	var/attunement_points_bonus = 0 //adjusted based on special roles, an artificer or antagonist should have this bonus, NOBODY ELSE...
	var/spell_slots = 0
	var/spell_slots_used = 0 //only spells that are learned by non spawn means.
	var/spell_slots_bonus = 0

/mob/living/proc/calculate_attunement_points()
	if(!mind)
		return
	attunement_points_max = max(STAINT - 4 + mind.get_skill_level(/datum/skill/magic/arcane) + attunement_points_bonus, 0) //never less than 0

/mob/living/proc/check_attunement_points()
	if(attunement_points_used > attunement_points_max)
		//debuff
		apply_status_effect(/datum/status_effect/buff/magic_sickness)
		visible_message(span_info("[src] begins to look sick."), span_warning("I feel sick all of the sudden."))
	else if(has_status_effect(/datum/status_effect/buff/magic_sickness))
		remove_status_effect(/datum/status_effect/buff/magic_sickness)
		visible_message(span_info("[src] looks like they feel a bit better."), span_info("My nausea fades away."))

/datum/status_effect/buff/magic_sickness
	id = "arcyne sickness"
	alert_type = /atom/movable/screen/alert/status_effect/buff/magic_sickness
	effectedstats = list("strength" = -2, "constitution" = -2, "endurance" = -2) //int is not effected because int effects attunement points themselves, that could trap you with arcyne sickness
	duration = -1

/atom/movable/screen/alert/status_effect/buff/magic_sickness
	name = "Arcyne Sickness"
	desc = "I am feeling sick due to powerful item enchantments."
	icon_state = "debuff"

/datum/status_effect/buff/magic_sickness/tick()
	var/mob/living/target = owner
	var/mob/living/carbon/M = target
	M.add_nausea(5) //it's a lot, but get the fucking items off. That's the point.

/mob/living/proc/init_faith()
	set_patron(/datum/patron/godless)

/mob/living/proc/set_patron(datum/patron/new_patron)
	if(!new_patron)
		return TRUE
	if(ispath(new_patron))
		new_patron = GLOB.patronlist[new_patron]
	if(!istype(new_patron))
		return TRUE
	if(istype(patron))
		patron.on_loss(src)
	patron = new_patron
	new_patron.on_gain(src)
	return TRUE

/datum/species
	// Associative list of stat (STAT_STRENGTH, etc) bonuses used to differentiate each race. They should ALWAYS be positive.
	var/list/race_bonus = list()

/mob/living/proc/roll_stats()
	STASTR = 10
	STAPER = 10
	STAINT = 10
	STACON = 10
	STAEND = 10
	STASPD = 10
	STALUC = 10
/*		Bye-bye stat drift RNG
	for(var/S in MOBSTATS)
		if(prob(33))
			change_stat(S, 1)
			if(prob(33))
				change_stat(S, -1)
		else
			change_stat(S, -1)
			if(prob(33))
				change_stat(S, 1)
*/
	if(ishuman(src))
		var/mob/living/carbon/human/H = src
		/* - Old way of handling race/gender stats, no longer used. See: Statpacks.
		if(H.dna.species)
			if(gender == FEMALE)
				for(var/S in H.dna.species.specstats_f)
					change_stat(S, H.dna.species.specstats_f[S])
			else
				for(var/S in H.dna.species.specstats)
					change_stat(S, H.dna.species.specstats[S])*/

		if (H.statpack)
			H.statpack.apply_to_human(H)
		if (H.dna?.species) // LETHALSTONE EDIT: apply our race bonus, if we have one
			var/datum/species/species = H.dna.species
			if (species.race_bonus)
				for (var/stat in species.race_bonus)
					var/amt = species.race_bonus[stat]
					H.change_stat(stat, amt)

		switch(H.age)
			if(AGE_MIDDLEAGED)
				change_stat("speed", -1)
				change_stat("endurance", 1)
			if(AGE_OLD)
				change_stat("strength", -1)
				change_stat("speed", -2)
				change_stat("perception", -1)
				change_stat("constitution", -2)
				change_stat("intelligence", 2)
		if(HAS_TRAIT(src, TRAIT_LEPROSY))
			change_stat("strength", -5)
			change_stat("speed", -5)
			change_stat("endurance", -2)
			change_stat("constitution", -2)
		if(HAS_TRAIT(src, TRAIT_PUNISHMENT_CURSE))
			change_stat("strength", -2)
			change_stat("speed", -2)
			change_stat("constitution", -3)
			change_stat("fortune", -5)
			H.voice_color = "c71d76"
			set_eye_color(H, "#c71d76", "#c71d76")

/mob/living/proc/change_stat(stat, amt, index)
	if(!stat)
		return
	if(amt == 0 && index)
		if(statindex[index])
			change_stat(statindex[index]["stat"], -1*statindex[index]["amt"])
			statindex[index] = null
			return
	if(!amt)
		return
	if(index)
		if(statindex[index])
			return //we cannot make a new index
		else
			statindex[index] = list("stat" = stat, "amt" = amt)
//			statindex[index]["stat"] = stat
//			statindex[index]["amt"] = amt
	var/newamt = 0
	switch(stat)
		if("strength")
			if(isseelie(src))
				STASTR = 1
				return
			newamt = STASTR + amt
			if(BUFSTR < 0)
				BUFSTR = BUFSTR + amt
				if(BUFSTR > 0)
					newamt = STASTR + BUFSTR
					BUFSTR = 0
			if(BUFSTR > 0)
				BUFSTR = BUFSTR + amt
				if(BUFSTR < 0)
					newamt = STASTR + BUFSTR
					BUFSTR = 0
			while(newamt < 1)
				newamt++
				BUFSTR--
			while(newamt > 20)
				newamt--
				BUFSTR++
			STASTR = newamt

		if("perception")
			newamt = STAPER + amt
			if(BUFPER < 0)
				BUFPER = BUFPER + amt
				if(BUFPER > 0)
					newamt = STAPER + BUFPER
					BUFPER = 0
			if(BUFPER > 0)
				BUFPER = BUFPER + amt
				if(BUFPER < 0)
					newamt = STAPER + BUFPER
					BUFPER = 0
			while(newamt < 1)
				newamt++
				BUFPER--
			while(newamt > 20)
				newamt--
				BUFPER++
			STAPER = newamt

			update_fov_angles()

		if("intelligence")
			newamt = STAINT + amt
			if(BUFINT < 0)
				BUFINT = BUFINT + amt
				if(BUFINT > 0)
					newamt = STAINT + BUFINT
					BUFINT = 0
			if(BUFINT > 0)
				BUFINT = BUFINT + amt
				if(BUFINT < 0)
					newamt = STAINT + BUFINT
					BUFINT = 0
			while(newamt < 1)
				newamt++
				BUFINT--
			while(newamt > 20)
				newamt--
				BUFINT++
			STAINT = newamt
			calculate_attunement_points() //recalculate attunement points

		if("constitution")
			newamt = STACON + amt
			if(BUFCON < 0)
				BUFCON = BUFCON + amt
				if(BUFCON > 0)
					newamt = STACON + BUFCON
					BUFCON = 0
			if(BUFCON > 0)
				BUFCON = BUFCON + amt
				if(BUFCON < 0)
					newamt = STACON + BUFCON
					BUFCON = 0
			while(newamt < 1)
				newamt++
				BUFCON--
			while(newamt > 20)
				newamt--
				BUFCON++
			STACON = newamt

		if("endurance")
			newamt = STAEND + amt
			if(BUFEND < 0)
				BUFEND = BUFEND + amt
				if(BUFEND > 0)
					newamt = STAEND + BUFEND
					BUFEND = 0
			if(BUFEND > 0)
				BUFEND = BUFEND + amt
				if(BUFEND < 0)
					newamt = STAEND + BUFEND
					BUFEND = 0
			while(newamt < 1)
				newamt++
				BUFEND--
			while(newamt > 20)
				newamt--
				BUFEND++
			STAEND = newamt

		if("speed")
			newamt = STASPD + amt
			if(BUFSPE < 0)
				BUFSPE = BUFSPE + amt
				if(BUFSPE > 0)
					newamt = STASPD + BUFSPE
					BUFSPE = 0
			if(BUFSPE > 0)
				BUFSPE = BUFSPE + amt
				if(BUFSPE < 0)
					newamt = STASPD + BUFSPE
					BUFSPE = 0
			while(newamt < 1)
				newamt++
				BUFSPE--
			while(newamt > 20)
				newamt--
				BUFSPE++
			STASPD = newamt

		if("fortune")
			newamt = STALUC + amt
			if(BUFLUC < 0)
				BUFLUC = BUFLUC + amt
				if(BUFLUC > 0)
					newamt = STALUC + BUFLUC
					BUFLUC = 0
			if(BUFLUC > 0)
				BUFLUC = BUFLUC + amt
				if(BUFLUC < 0)
					newamt = STALUC + BUFLUC
					BUFLUC = 0
			while(newamt < 1)
				newamt++
				BUFLUC--
			while(newamt > 20)
				newamt--
				BUFLUC++
			STALUC = newamt

/proc/generic_stat_comparison(userstat as num, targetstat as num)
	var/difference = userstat - targetstat
	if(difference > 1 || difference < -1)
		return difference * 10
	else
		return 0

/mob/living/proc/badluck(multi = 3)
	if(STALUC < 10)
		return prob((10 - STALUC) * multi)

/mob/living/proc/goodluck(multi = 3)
	if(STALUC > 10)
		return prob((STALUC - 10) * multi)

/mob/living/proc/calculate_spell_slots(report_slots = FALSE)
	if(!mind)
		return
	//the amount of spells you can memorize out of scrolls, seperate from spellpoints learnt ones.
	spell_slots = max(round(((STAINT/4) + mind.get_skill_level(/datum/skill/magic/arcane) + spell_slots_bonus) - spell_slots_used), 0)
	if(report_slots)
		to_chat(src, "I think i can learn [spell_slots] more spells.")

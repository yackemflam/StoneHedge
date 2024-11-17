/*****************************Survival Pod********************************/
/area/misc/survivalpod
	name = "\improper Emergency Shelter"
	icon_state = "away"
	static_lighting = TRUE
	requires_power = FALSE
	has_gravity = STANDARD_GRAVITY
	area_flags = BLOBS_ALLOWED | UNIQUE_AREA
	flags_1 = CAN_BE_DIRTY_1

//Survival Capsule
/obj/item/survivalcapsule
	name = "Tent Crystal"
	desc = "A simple tent with comfortable living conditions. beats sleeping on the hard ground. guitar included. brought to you by V."
	icon_state = "ros"
	icon = 'icons/roguetown/items/gems.dmi'
	w_class = WEIGHT_CLASS_TINY
	var/template_id = "shelter_tent"
	var/datum/map_template/shelter/template
	var/used = FALSE
	var/yeet_back = TRUE

/obj/item/survivalcapsule/proc/get_template()
	if(template)
		return
	template = SSmapping.shelter_templates[template_id]
	if(!template)
		WARNING("housing template ([template_id]) not found!")
		qdel(src)

/obj/item/survivalcapsule/Destroy()
	template = null 
	. = ..()

/obj/item/survivalcapsule/examine(mob/user)
	. = ..()
	get_template()
	. += "This crystal has the [template.name] stored."
	. += template.description

/obj/item/survivalcapsule/interact(mob/living/user)
	. = ..()
	if(.)
		return .

	get_template()
	if(used)
		return FALSE

	loc.visible_message(span_warning("[src] begins to shake. Stand back!"))
	used = TRUE
	addtimer(CALLBACK(src, PROC_REF(expand), user), 5 SECONDS)
	if(iscarbon(user))
		var/mob/living/carbon/carbon = user
		carbon.throw_mode_on(THROW_MODE_TOGGLE)
	return TRUE

/obj/item/survivalcapsule/proc/expand(mob/triggerer)
	if(QDELETED(src))
		return

	var/turf/deploy_location = get_turf(src)
	var/status = template.check_deploy(deploy_location, src, get_ignore_flags())
	if(status != SHELTER_DEPLOY_ALLOWED)
		fail_feedback(status)
		used = FALSE
		return

	if(yeet_back)
		yote_nearby(deploy_location)
	template.load(deploy_location, centered = TRUE)
	trigger_admin_alert(triggerer, deploy_location)
	playsound(src, 'sound/effects/phasein.ogg', 100, TRUE)
	new /obj/effect/particle_effect/fluid/smoke(get_turf(src))
	qdel(src)

/obj/item/survivalcapsule/proc/get_ignore_flags()
	return NONE

/obj/item/survivalcapsule/proc/fail_feedback(status)
	switch(status)
		if(SHELTER_DEPLOY_BAD_AREA)
			loc.visible_message(span_warning("[src] will not function in this area."))
		if(SHELTER_DEPLOY_BAD_TURFS, SHELTER_DEPLOY_ANCHORED_OBJECTS, SHELTER_DEPLOY_OUTSIDE_MAP, SHELTER_DEPLOY_BANNED_OBJECTS)
			loc.visible_message(span_warning("[src] doesn't have room to deploy! You need to clear a [template.width]x[template.height] area!"))

/obj/item/survivalcapsule/proc/yote_nearby(turf/deploy_location)
	var/width = template.width
	var/height = template.height
	var/base_x_throw_distance = ceil(width / 2)
	var/base_y_throw_distance = ceil(height / 2)
	for(var/mob/living/did_not_stand_back in range(loc, "[width]x[height]"))
		var/dir_to_center = get_dir(deploy_location, did_not_stand_back) || pick(GLOB.alldirs)
		var/throw_dist = 0
		var/x_component = abs(did_not_stand_back.x - deploy_location.x)
		var/y_component = abs(did_not_stand_back.y - deploy_location.y)
		if(ISDIAGONALDIR(dir_to_center))
			throw_dist = ceil(sqrt(base_x_throw_distance ** 2 + base_y_throw_distance ** 2) - (sqrt(x_component ** 2 + y_component ** 2)))
		else if(dir_to_center & (NORTH|SOUTH))
			throw_dist = base_y_throw_distance - y_component + 1
		else if(dir_to_center & (EAST|WEST))
			throw_dist = base_x_throw_distance - x_component + 1

		did_not_stand_back.Paralyze(3 SECONDS)
		did_not_stand_back.Knockdown(6 SECONDS)
		did_not_stand_back.throw_at(
			target = get_edge_target_turf(did_not_stand_back, dir_to_center),
			range = throw_dist,
			speed = 3,
			force = MOVE_FORCE_VERY_STRONG,
		)

//Non-default crystals

/obj/item/survivalcapsule/wiz
	name = "luxury home crystal."
	desc = "An exorbitantly expensive luxury stone house. every single thing you could possible need to start a new proper life of lonelyness, because you bought this for yourself. to sit in. alone. brought to you by V."
	template_id = "shelter_wiztower"

/obj/item/survivalcapsule/smith
	name = "Modest home crystal."
	desc = "A cozy wooden cottage at the flick of a wrist. a modest home and smithy for the starting homesteader. brought to you by V."
	template_id = "shelter_smith"

/*/obj/item/survivalcapsule/bathroom
	name = "emergency relief capsule"
	desc = "Provides vital emergency support to employees who are caught short in the field."
	template_id = "shelter_toilet"*/

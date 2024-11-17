///Map templates used for bluespace survival capsules.
/datum/map_template/shelter
	has_ceiling = TRUE
	ceiling_turf = /turf/open/floor/rogue/herringbone
	ceiling_baseturfs = list(/turf/open/floor/rogue/herringbone)
	///The id of the shelter template in the relative list from the mapping subsystem
	var/shelter_id
	///The description of the shelter, shown when examining survival capsule.
	var/description
	///If turf in the affected turfs is in this list, the survival capsule cannot be deployed.
	var/list/blacklisted_turfs
	///Areas where the capsule cannot be deployed.
	var/list/banned_areas
	///If any object in this list is found in the affected turfs, the capsule cannot deploy.
	var/list/banned_objects = list()

/datum/map_template/shelter/New()
	. = ..()
	blacklisted_turfs = typecacheof(/turf/closed)
	banned_areas = typecacheof(/area/shuttle)

/datum/map_template/shelter/proc/check_deploy(turf/deploy_location, obj/item/survivalcapsule/capsule, ignore_flags = NONE)
	var/affected = get_affected_turfs(deploy_location, centered=TRUE)
	for(var/turf/turf in affected)
		var/area/area = get_area(turf)
		if(is_type_in_typecache(area, banned_areas))
			return SHELTER_DEPLOY_BAD_AREA

		if(is_type_in_typecache(turf, blacklisted_turfs))
			return SHELTER_DEPLOY_BAD_TURFS

		for(var/obj/object in turf)
			if(!(ignore_flags & CAPSULE_IGNORE_ANCHORED_OBJECTS) && object.density && object.anchored)
				return SHELTER_DEPLOY_ANCHORED_OBJECTS
			if(!(ignore_flags & CAPSULE_IGNORE_BANNED_OBJECTS) && is_type_in_typecache(object, banned_objects))
				return SHELTER_DEPLOY_BANNED_OBJECTS

	// Check if the shelter sticks out of map borders
	var/shelter_origin_x = deploy_location.x - round(width/2)
	if(shelter_origin_x <= 1 || shelter_origin_x+width > world.maxx)
		return SHELTER_DEPLOY_OUTSIDE_MAP
	var/shelter_origin_y = deploy_location.y - round(height/2)
	if(shelter_origin_y <= 1 || shelter_origin_y+height > world.maxy)
		return SHELTER_DEPLOY_OUTSIDE_MAP

	return SHELTER_DEPLOY_ALLOWED

/datum/map_template/shelter/frugal
	name = "Crystal Frugal"
	shelter_id = "shelter_tent"
	description = "A simple tent for you to sleep in comfort \
		a hearth to keep warm and a bedroll to sleep\
		buy now and we will throw in a guitar for free!, \
		-brought to you by V"
	mappath = "_maps/templates/shelter_1.dmm"

/datum/map_template/shelter/alpha/New()
	. = ..()
	blacklisted_turfs -= typesof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)

/datum/map_template/shelter/smith
	name = "Crystal Modest"
	shelter_id = "shelter_smith"
	description = "A cozy wooden cottage at the flick of a wrist has\
		the amenities of home, a bed and table, cooking station \
		and a nice lil smithy area for you to begin your buisness and noy break the SHY!. \
		-brought to you by V"
	mappath = "_maps/templates/shelter_2.dmm"

/datum/map_template/shelter/beta/New()
	. = ..()
	blacklisted_turfs -= typesof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)

/datum/map_template/shelter/elite
	name = "Crystal Elite"
	shelter_id = "shelter_wiztower"
	description = "A luxury elite stone home\
		all the luxuries of a town in arms reach\
		premium quality living conditions at a not affordable price\
		-brought to you by V"
	mappath = "_maps/templates/shelter_3.dmm"

/datum/map_template/shelter/charlie/New()
	. = ..()
	blacklisted_turfs -= typesof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)

/*/datum/map_template/shelter/toilet
	name = "Emergency Relief Shelter"
	shelter_id = "shelter_toilet"
	description = "A stripped-down emergency shelter focused on providing \
		only the most essential amenities to unfortunate employees who find \
		themselves in need far from home."
	mappath = "_maps/templates/shelter_t.dmm"

/datum/map_template/shelter/toilet/New()
	. = ..()
	blacklisted_turfs -= typesof(/turf/closed/mineral)
	banned_objects = typecacheof(/obj/structure/stone_tile)*/

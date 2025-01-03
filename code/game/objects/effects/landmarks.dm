/obj/effect/landmark
	name = "landmark"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "x2"
	anchored = TRUE
	layer = MID_LANDMARK_LAYER
	invisibility = INVISIBILITY_ABSTRACT
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF

/obj/effect/landmark/singularity_act()
	return

// Please stop bombing the Observer-Start landmark.
/obj/effect/landmark/ex_act()
	return

/obj/effect/landmark/singularity_pull()
	return


INITIALIZE_IMMEDIATE(/obj/effect/landmark)

/obj/effect/landmark/Initialize()
	. = ..()
	GLOB.landmarks_list += src

/obj/effect/landmark/Destroy()
	GLOB.landmarks_list -= src
	return ..()

/obj/effect/landmark/start
	name = "start"
	icon = 'icons/mob/landmarks.dmi'
	icon_state = "x"
	anchored = TRUE
	layer = MOB_LAYER
	var/list/jobspawn_override = list()
	var/delete_after_roundstart = TRUE
	var/used = FALSE

/obj/effect/landmark/start/proc/after_round_start()
	if(delete_after_roundstart)
		qdel(src)

/obj/effect/landmark/start/Initialize()
	GLOB.start_landmarks_list += src
	if(jobspawn_override.len)
		for(var/X in jobspawn_override)
			LAZYADD(GLOB.jobspawn_overrides[X], src)
	. = ..()
	if(name != "start")
		tag = "start*[name]"

/obj/effect/landmark/start/Destroy()
	GLOB.start_landmarks_list -= src
	for(var/X in jobspawn_override)
		GLOB.jobspawn_overrides[X] -= src
	return ..()

/obj/effect/landmark/events/haunts
	name = "hauntz"
	icon_state = "generic_event"

/obj/effect/landmark/events/haunts/Initialize(mapload)
	. = ..()
	GLOB.hauntstart += src
	icon_state = ""


/obj/effect/landmark/events/testportal
	name = "testserverportal"
	icon_state = "x4"
	var/aportalloc = "a"

/obj/effect/landmark/events/testportal/Initialize(mapload)
	. = ..()
//	GLOB.hauntstart += loc
#ifdef TESTSERVER
	var/obj/structure/fluff/testportal/T = new /obj/structure/fluff/testportal(loc)
	T.aportalloc = aportalloc
	GLOB.testportals += T
#endif
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/start/adventurerlate
	name = "Adventurerlate"
	icon_state = "arrow"
	jobspawn_override = list("Adventurer")
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/wandererlate
	name = "Wandererlate"
	icon_state = "arrow"
	jobspawn_override = list("Skeleton", "Pilgrim", "Migrant")
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/banditlate
	name = "Bandit"
	icon_state = "arrow"
	jobspawn_override = list("Bandit")
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/bogguardlate
	name = "Bogguardlate"
	icon_state = "arrow"
	jobspawn_override = list("Hedgemaster", "Hedge Knight")
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/vagrantlate
	name = "Beggarlate"
	icon_state = "arrow"
	jobspawn_override = list("Low-life")
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/vagrantlate
	name = "Beggarlate"
	icon_state = "arrow"
	jobspawn_override = list("Beggar")
	delete_after_roundstart = FALSE


/obj/effect/landmark/start/vagabondlate
	name = "Vagabondlate"
	icon_state = "arrow"
	jobspawn_override = list("Vagabond")
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/mercenarylate
	name = "Mercenarylate"
	icon_state = "arrow"
	jobspawn_override = list("Mercenary",  "Sellsword")

/obj/effect/landmark/start/seelie
	name = "Forest Seelie"
	icon_state = "arrow"

/obj/effect/landmark/start/seelielate
	name = "Seelielate"
	icon_state = "arrow"
	jobspawn_override = list("Forest Seelie")
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/villagerlate
	name = "Townerlate"
	icon_state = "arrow"
	jobspawn_override = list("Towner")
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/lord
	name = "Monarch"
	icon_state = "arrow"

/obj/effect/landmark/start/knight
	name = "Knight"
	icon_state = "arrow"

/obj/effect/landmark/start/sheriff
	name = "Town Sheriff"
	icon_state = "arrow"

/obj/effect/landmark/start/guard_captain
	name = "Commander"
	icon_state = "arrow"

/obj/effect/landmark/start/noble
	name = "Noble Guest"
	icon_state = "arrow"

/obj/effect/landmark/start/barkeep
	name = "Innkeep"
	icon_state = "arrow"

/obj/effect/landmark/start/cook
	name = "Cook"
	icon_state = "arrow"

/obj/effect/landmark/start/steward
	name = "Guild Appraiser"
	icon_state = "arrow"

/obj/effect/landmark/start/clerk
	name = "Clerk"
	icon_state = "arrow"

/obj/effect/landmark/start/physician
	name = "Physician"
	icon_state = "arrow"

/obj/effect/landmark/start/guardsman
	name = "Watchman"
	icon_state = "arrow"

/obj/effect/landmark/start/royalguard
	name = "Royal Guard"
	icon_state = "arrow"

/obj/effect/landmark/start/judge
	name = "Law Mage"
	icon_state = "arrow"

/obj/effect/landmark/start/councillor
	name = "Councillor"
	icon_state = "arrow"

/obj/effect/landmark/start/veteran
	name = "Guildmaster"
	icon_state = "arrow"

/obj/effect/landmark/start/dungeoneer
	name = "Beastmaster"
	icon_state = "arrow"

/obj/effect/landmark/start/gatemaster
	name = "Gatemaster"
	icon_state = "arrow"

/obj/effect/landmark/start/watchman
	name = "Watchman"
	icon_state = "arrow"

/obj/effect/landmark/start/villager
	name = "Towner"
	icon_state = "arrow"

/obj/effect/landmark/start/woodsman
	name = "Village Elder"
	icon_state = "arrow"

/obj/effect/landmark/start/priest
	name = "Archpriest"
	icon_state = "arrow"

/obj/effect/landmark/start/cleric
	name = "Priest"
	icon_state = "arrow"

/obj/effect/landmark/start/monk
	name = "Monk"
	icon_state = "arrow"

/obj/effect/landmark/start/greatdruid
	name = "Great Druid"
	icon_state = "arrow"

/obj/effect/landmark/start/hedgewarden
	name = "Hedge Warden"
	icon_state = "arrow"

/obj/effect/landmark/start/grovedruid
	name = "Druid"
	icon_state = "arrow"

/obj/effect/landmark/start/hedgeknight
	name = "Hedge Knight"
	icon_state = "arrow"

/obj/effect/landmark/start/ovate
	name = "Ovate"
	icon_state = "arrow"

/obj/effect/landmark/start/templar
	name = "Temple Paladin"
	icon_state = "arrow"

/obj/effect/landmark/start/grandtemplar
	name = "Grandmaster"
	icon_state = "arrow"

/obj/effect/landmark/start/puritan
	name = "Wytcher Captain"
	icon_state = "arrow"

/obj/effect/landmark/start/shepherd
	name = "Confessor"
	icon_state = "arrow"

/obj/effect/landmark/start/nightman
	name = "Nightmaster"
	icon_state = "arrow"

/obj/effect/landmark/start/nightmaiden
	name = "Nightswain"
	icon_state = "arrow"

/obj/effect/landmark/start/henchman
	name = "Henchman"
	icon_state = "arrow"

/obj/effect/landmark/start/merchant
	name = "Merchant Prince"
	icon_state = "arrow"

/obj/effect/landmark/start/shophand
	name = "Shophand"
	icon_state = "arrow"

/obj/effect/landmark/start/grabber
	name = "Grabber"
	icon_state = "arrow"

/obj/effect/landmark/start/innkeep
	name = "Innkeep"
	icon_state = "arrow"

/obj/effect/landmark/start/weaponsmith
	name = "Weaponsmith"
	icon_state = "arrow"

/obj/effect/landmark/start/armorsmith
	name = "Armorer"
	icon_state = "arrow"

/obj/effect/landmark/start/blacksmith
	name = "Blacksmith"
	icon_state = "arrow"

/obj/effect/landmark/start/tailor
	name = "Tailor"
	icon_state = "arrow"

/obj/effect/landmark/start/alchemist
	name = "Alchemist"
	icon_state = "arrow"

/obj/effect/landmark/start/mason
	name = "Mason"
	icon_state = "arrow"

/obj/effect/landmark/start/scribe
	name = "Scribe"
	icon_state = "arrow"

/obj/effect/landmark/start/farmer
	name = "Soilson"
	icon_state = "arrow"

/obj/effect/landmark/start/beastmonger
	name = "Butcher"
	icon_state = "arrow"

/obj/effect/landmark/start/gravedigger
	name = "Gravesinger"
	icon_state = "arrow"

/obj/effect/landmark/start/mercenary
	name = "Mercenary"
	icon_state = "arrow"

/obj/effect/landmark/start/sellsword
	name = "Sellsword"
	icon_state = "arrow"

/obj/effect/landmark/start/vagrant
	name = "Low-life"
	icon_state = "arrow"

/obj/effect/landmark/start/lady
	name = "Consort"
	icon_state = "arrow"

/obj/effect/landmark/start/prince
	name = "Royal Heir"
	icon_state = "arrow"

/obj/effect/landmark/start/prisonerr
	name = "Prisoner (StoneHedge)"
	icon_state = "arrow"

/obj/effect/landmark/start/prisonerb
	name = "Prisoner (Bog)"
	icon_state = "arrow"

/obj/effect/landmark/start/prisonerc
	name = "Tribal Slave"
	icon_state = "arrow"

/obj/effect/landmark/start/prisonerd
	name = "Public Servant"
	icon_state = "arrow"

/obj/effect/landmark/start/griefer
	name = "Dumb Whoreson"
	icon_state = "arrow"

/obj/effect/landmark/start/lunatic
	name = "Shunned Slave"
	icon_state = "arrow"

/obj/effect/landmark/start/hostage
	name = "Hostage"
	icon_state = "arrow"

/obj/effect/landmark/start/jester
	name = "Harlequin"
	icon_state = "arrow"

/obj/effect/landmark/start/hand
	name = "Hand"
	icon_state = "arrow"

/obj/effect/landmark/start/hunter
	name = "Hunter"
	icon_state = "arrow"

/obj/effect/landmark/start/fisher
	name = "Fisher"
	icon_state = "arrow"

/obj/effect/landmark/start/lumberjack
	name = "Lumberjack"
	icon_state = "arrow"

/obj/effect/landmark/start/butler
	name = "Head Butler"
	icon_state = "arrow"

/obj/effect/landmark/start/barkeeper
	name = "Innkeeper"
	icon_state = "arrow"

/obj/effect/landmark/start/adventurer
	name = "Adventurer"
	icon_state = "arrow"
	delete_after_roundstart = FALSE // used by mob spawners

//yrf

/obj/effect/landmark/start/squire
	name = "Squire"
	icon_state = "arrow"

/obj/effect/landmark/start/servant
	name = "Servant"
	icon_state = "arrow"

/obj/effect/landmark/start/churchling
	name = "Churchling"
	icon_state = "arrow"

/obj/effect/landmark/start/vagabond
	name = "Vagabond"
	icon_state = "arrow"

/obj/effect/landmark/start/sapprentice
	name = "Smithy Apprentice"
	icon_state = "arrow"

//goblin

/obj/effect/landmark/start/chieftain
	name = "Chieftain"
	icon_state = "arrow"

/obj/effect/landmark/start/tribalcook
	name = "Tribal Cook"
	icon_state = "arrow"

/obj/effect/landmark/start/tribalvillager
	name = "Tribal Villager"
	icon_state = "arrow"

/obj/effect/landmark/start/tribalshaman
	name = "Tribal Shaman"
	icon_state = "arrow"

/obj/effect/landmark/start/tribalguard
	name = "Tribal Guard"
	icon_state = "arrow"

/obj/effect/landmark/start/tribalsmith
	name = "Tribal Smith"
	icon_state = "arrow"

/obj/effect/landmark/start/triballate
	name = "triballate"
	icon_state = "arrow"
	jobspawn_override = list("Tribal Cook", "Tribal Guard", "Chieftain", "Tribal Smith", "Tribal Shaman", "Tribal Villager", "Tribal Slave")
	delete_after_roundstart = FALSE

//Hearthstone Additions

/obj/effect/landmark/start/ladylate
	name = "ladylate"
	icon_state = "arrow"
	jobspawn_override = list("Consort")
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/noblelate
	name = "noblelate"
	icon_state = "arrow"
	jobspawn_override = list("Noble Guest")
	delete_after_roundstart = FALSE

//Vikings Additions

/obj/effect/landmark/start/highking
	name = "Dwarf Artificer"
	icon_state = "arrow"

/obj/effect/landmark/start/highkinglate
	name = "NorthmenKinglate"
	icon_state = "arrow"
	jobspawn_override = list("Dwarf Artificer")
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/vikingfarmer
	name = "Northern Hostage"
	icon_state = "arrow"

/obj/effect/landmark/start/vikingfarmerlate
	name = "northernhostagelate"
	icon_state = "arrow"
	jobspawn_override = list("Northern Hostage")
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/NorthmenBerserkir
	name = "Northmen Berserkir"
	icon_state = "arrow"

/obj/effect/landmark/start/NorthmenBerserkirlate
	name = "NorthmenBerserkirlate"
	icon_state = "arrow"
	jobspawn_override = list("Northmen Berserkir")
	delete_after_roundstart = FALSE

//Vampire Additions

/obj/effect/landmark/start/vampthrall
	name = "Underdark Peasant"
	icon_state = "arrow"

/obj/effect/landmark/start/vampthralllate
	name = "Vampirethralllate"
	icon_state = "arrow"
	jobspawn_override = list("Underdark Peasant")
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/vampsmith
	name = "Underdark Smithy"
	icon_state = "arrow"

/obj/effect/landmark/start/vampsmithlate
	name = "vampsmitelate"
	icon_state = "arrow"
	jobspawn_override = list("Underdark Smithy")
	delete_after_roundstart = FALSE

//academy
/obj/effect/landmark/start/acadarchmage
	name = "Academy Archmage"
	icon_state = "arrow"

/obj/effect/landmark/start/acadmage
	name = "Academy Mage"
	icon_state = "arrow"

/obj/effect/landmark/start/acadapp
	name = "Academy Apprentice"
	icon_state = "arrow"

// START LANDMARKS FOLLOW. Don't change the names unless
// you are refactoring shitty landmark code.
/obj/effect/landmark/start/assistant
	name = "Assistant"
	icon_state = "Assistant"

/obj/effect/landmark/start/assistant/override
	jobspawn_override = list("Assistant")
	delete_after_roundstart = FALSE

/obj/effect/landmark/start/janitor
	name = "Janitor"
	icon_state = "Janitor"

/obj/effect/landmark/start/cargo_technician
	name = "Cargo Technician"
	icon_state = "Cargo Technician"

/obj/effect/landmark/start/bartender
	name = "Bartender"
	icon_state = "Bartender"

/obj/effect/landmark/start/clown
	name = "Clown"
	icon_state = "Clown"

/obj/effect/landmark/start/mime
	name = "Mime"
	icon_state = "Mime"

/obj/effect/landmark/start/quartermaster
	name = "Quartermaster"
	icon_state = "Quartermaster"

/obj/effect/landmark/start/atmospheric_technician
	name = "Atmospheric Technician"
	icon_state = "Atmospheric Technician"

/obj/effect/landmark/start/shaft_miner
	name = "Shaft Miner"
	icon_state = "Shaft Miner"

/obj/effect/landmark/start/security_officer
	name = "Security Officer"
	icon_state = "Security Officer"

/obj/effect/landmark/start/botanist
	name = "Botanist"
	icon_state = "Botanist"

/obj/effect/landmark/start/head_of_security
	name = "Head of Security"
	icon_state = "Head of Security"

/obj/effect/landmark/start/captain
	name = "Captain"
	icon_state = "Captain"

/obj/effect/landmark/start/detective
	name = "Detective"
	icon_state = "Detective"

/obj/effect/landmark/start/warden
	name = "Warden"
	icon_state = "Warden"

/obj/effect/landmark/start/chief_engineer
	name = "Chief Engineer"
	icon_state = "Chief Engineer"

/obj/effect/landmark/start/head_of_personnel
	name = "Head of Personnel"
	icon_state = "Head of Personnel"

/obj/effect/landmark/start/librarian
	name = "Curator"
	icon_state = "Curator"

/obj/effect/landmark/start/lawyer
	name = "Lawyer"
	icon_state = "Lawyer"

/obj/effect/landmark/start/station_engineer
	name = "Station Engineer"
	icon_state = "Station Engineer"

/obj/effect/landmark/start/medical_doctor
	name = "Medical Doctor"
	icon_state = "Medical Doctor"

/obj/effect/landmark/start/scientist
	name = "Scientist"
	icon_state = "Scientist"

/obj/effect/landmark/start/chemist
	name = "Chemist"
	icon_state = "Chemist"

/obj/effect/landmark/start/roboticist
	name = "Roboticist"
	icon_state = "Roboticist"

/obj/effect/landmark/start/research_director
	name = "Research Director"
	icon_state = "Research Director"

/obj/effect/landmark/start/geneticist
	name = "Geneticist"
	icon_state = "Geneticist"

/obj/effect/landmark/start/chief_medical_officer
	name = "Chief Medical Officer"
	icon_state = "Chief Medical Officer"

/obj/effect/landmark/start/virologist
	name = "Virologist"
	icon_state = "Virologist"

/obj/effect/landmark/start/chaplain
	name = "Chaplain"
	icon_state = "Chaplain"

/obj/effect/landmark/start/cyborg
	name = "Cyborg"
	icon_state = "Cyborg"

/obj/effect/landmark/start/ai
	name = "AI"
	icon_state = "AI"
	delete_after_roundstart = FALSE
	var/primary_ai = TRUE
	var/latejoin_active = TRUE

/obj/effect/landmark/start/ai/after_round_start()
	if(latejoin_active && !used)
		new /obj/structure/AIcore/latejoin_inactive(loc)
	return ..()

/obj/effect/landmark/start/ai/secondary
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "ai_spawn"
	primary_ai = FALSE
	latejoin_active = FALSE

//Department Security spawns

/obj/effect/landmark/start/depsec
	name = "department_sec"
	icon_state = "Security Officer"

/obj/effect/landmark/start/depsec/New()
	..()
	GLOB.department_security_spawns += src

/obj/effect/landmark/start/depsec/Destroy()
	GLOB.department_security_spawns -= src
	return ..()

/obj/effect/landmark/start/depsec/supply
	name = "supply_sec"

/obj/effect/landmark/start/depsec/medical
	name = "medical_sec"

/obj/effect/landmark/start/depsec/engineering
	name = "engineering_sec"

/obj/effect/landmark/start/depsec/science
	name = "science_sec"

//Antagonist spawns

/obj/effect/landmark/start/wizard
	name = "wizard"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "wiznerd_spawn"

/obj/effect/landmark/start/wizard/Initialize()
	. = ..()
	GLOB.wizardstart += loc

/obj/effect/landmark/start/nukeop
	name = "nukeop"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "snukeop_spawn"

/obj/effect/landmark/start/nukeop/Initialize()
	. = ..()
	GLOB.nukeop_start += loc

/obj/effect/landmark/start/bandit
	name = "bandit"
	icon = 'icons/mob/landmarks.dmi'
	icon_state = "arrow"

/obj/effect/landmark/start/bandit/Initialize()
	. = ..()
	GLOB.bandit_starts += loc


/obj/effect/landmark/start/delf
	name = "delf"
	icon = 'icons/mob/landmarks.dmi'
	icon_state = "arrow"

/obj/effect/landmark/start/delf/Initialize()
	. = ..()
	GLOB.delf_starts += loc


/obj/effect/landmark/start/nukeop_leader
	name = "nukeop leader"
	icon = 'icons/effects/landmarks_static.dmi'
	icon_state = "snukeop_leader_spawn"

/obj/effect/landmark/start/nukeop_leader/Initialize()
	. = ..()
	GLOB.nukeop_leader_start += loc

// Must be immediate because players will
// join before SSatom initializes everything.
INITIALIZE_IMMEDIATE(/obj/effect/landmark/start/new_player)

/obj/effect/landmark/start/new_player
	name = "New Player"

/obj/effect/landmark/start/new_player/Initialize()
	. = ..()
	GLOB.newplayer_start += loc

/obj/effect/landmark/latejoin
	name = "JoinLate"

/obj/effect/landmark/latejoin/Initialize(mapload)
	. = ..()
	SSjob.latejoin_trackers += loc
	return INITIALIZE_HINT_QDEL

//space carps, magicarps, lone ops, slaughter demons, possibly revenants spawn here
/obj/effect/landmark/carpspawn
	name = "carpspawn"
	icon_state = "carp_spawn"

//observer start
/obj/effect/landmark/observer_start
	name = "Observer-Start"
	icon_state = "x"

//objects with the stationloving component (nuke disk) respawn here.
//also blobs that have their spawn forcemoved (running out of time when picking their spawn spot), santa and respawning devils
/obj/effect/landmark/blobstart
	name = "blobstart"
	icon_state = "blob_start"

/obj/effect/landmark/blobstart/Initialize(mapload)
	. = ..()
	GLOB.blobstart += loc
	return INITIALIZE_HINT_QDEL

//spawns sec equipment lockers depending on the number of sec officers
/obj/effect/landmark/secequipment
	name = "secequipment"
	icon_state = "secequipment"

/obj/effect/landmark/secequipment/Initialize(mapload)
	. = ..()
	GLOB.secequipment += loc
	return INITIALIZE_HINT_QDEL

//players that get put in admin jail show up here
/obj/effect/landmark/prisonwarp
	name = "prisonwarp"
	icon_state = "prisonwarp"

/obj/effect/landmark/prisonwarp/Initialize(mapload)
	. = ..()
	GLOB.prisonwarp += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/ert_spawn
	name = "Emergencyresponseteam"
	icon_state = "ert_spawn"

/obj/effect/landmark/ert_spawn/Initialize(mapload)
	. = ..()
	GLOB.emergencyresponseteamspawn += loc
	return INITIALIZE_HINT_QDEL

//ninja energy nets teleport victims here
/obj/effect/landmark/holding_facility
	name = "Holding Facility"
	icon_state = "holding_facility"

/obj/effect/landmark/holding_facility/Initialize(mapload)
	. = ..()
	GLOB.holdingfacility += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/observe
	name = "tdomeobserve"
	icon_state = "tdome_observer"

/obj/effect/landmark/thunderdome/observe/Initialize(mapload)
	. = ..()
	GLOB.tdomeobserve += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/one
	name = "tdome1"
	icon_state = "tdome_t1"

/obj/effect/landmark/thunderdome/one/Initialize(mapload)
	. = ..()
	GLOB.tdome1	+= loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/two
	name = "tdome2"
	icon_state = "tdome_t2"

/obj/effect/landmark/thunderdome/two/Initialize(mapload)
	. = ..()
	GLOB.tdome2 += loc
	return INITIALIZE_HINT_QDEL

/obj/effect/landmark/thunderdome/admin
	name = "tdomeadmin"
	icon_state = "tdome_admin"

/obj/effect/landmark/thunderdome/admin/Initialize(mapload)
	. = ..()
	GLOB.tdomeadmin += loc
	return INITIALIZE_HINT_QDEL

//generic event spawns
/obj/effect/landmark/event_spawn
	name = "generic event spawn"
	icon_state = "generic_event"
	layer = HIGH_LANDMARK_LAYER


/obj/effect/landmark/event_spawn/Initialize()
	. = ..()
	GLOB.generic_event_spawns += src

/obj/effect/landmark/event_spawn/Destroy()
	GLOB.generic_event_spawns -= src
	return ..()

/obj/effect/landmark/ruin
	var/datum/map_template/ruin/ruin_template

/obj/effect/landmark/ruin/Initialize(ml, my_ruin_template)
	name = "ruin_[GLOB.ruin_landmarks.len + 1]"
	. = ..()
	ruin_template = my_ruin_template
	GLOB.ruin_landmarks |= src

/obj/effect/landmark/ruin/Destroy()
	GLOB.ruin_landmarks -= src
	ruin_template = null
	. = ..()

/// Marks the bottom left of the testing zone.
/// In landmarks.dm and not unit_test.dm so it is always active in the mapping tools.
/obj/effect/landmark/unit_test_bottom_left
	name = "unit test zone bottom left"

/// Marks the top right of the testing zone.
/// In landmarks.dm and not unit_test.dm so it is always active in the mapping tools.
/obj/effect/landmark/unit_test_top_right
	name = "unit test zone top right"

//Underworld landmark

/obj/effect/landmark/underworld
	name = "underworld spawn"

/obj/effect/landmark/underworldcoin
	name = "ferryman coin"

/obj/effect/landmark/underworldsafe // To prevent demons spawn camping will save a lot of ear rape.
	name = "safe zone"

GLOBAL_LIST_EMPTY(travel_tile_locations)

/obj/effect/landmark/travel_tile_location
	name = "travel tile location"

/obj/effect/landmark/travel_tile_location/Initialize()
	. = ..()
	GLOB.travel_tile_locations += src

/obj/effect/landmark/travel_tile_location/Destroy()
	GLOB.travel_tile_locations -= src
	. = ..()

GLOBAL_LIST_EMPTY(travel_spawn_points)

/obj/effect/landmark/travel_spawn_point
	name = "travel spawn point"
	icon_state = "generic_event"
	var/taken = FALSE

/obj/effect/landmark/travel_spawn_point/Initialize()
	. = ..()
	GLOB.travel_spawn_points += src

/obj/effect/landmark/travel_spawn_point/Destroy()
	GLOB.travel_spawn_points -= src
	. = ..()

/proc/get_free_travel_spawn_point()
	var/list/shuffled = shuffle(GLOB.travel_spawn_points)
	for(var/obj/effect/landmark/travel_spawn_point/point as anything in shuffled)
		if(point.taken)
			continue
		point.taken = TRUE
		return point.loc
	return null

/proc/create_travel_tiles(atom/location, travel_id, travel_goes_to_id, required_trait, tile_path)
	for(var/obj/effect/landmark/travel_tile_location/landmark as anything in GLOB.travel_tile_locations)
		if(get_dist(location, landmark) > 5)
			continue
		// Create travel tile here
		var/obj/structure/fluff/traveltile/tile = new tile_path(landmark.loc)
		tile.aportalid = travel_id
		tile.aportalgoesto = travel_goes_to_id
		tile.required_trait = required_trait
		tile.hide_if_needed()

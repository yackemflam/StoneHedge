// Fighter spells/abilities
// A bard's bread and butter. Maybe jester too?
/obj/effect/proc_holder/spell/self/secondwind
	name = "Second Wind"
	desc = ""
	clothes_req = FALSE
	range = 8
	overlay_state = "null"
	sound = list('sound/magic/whiteflame.ogg')
	active = FALSE

	releasedrain = 30
	chargedrain = 1
	chargetime = 3
	charge_max = 200 SECONDS //cooldown, lessened from 600 seconds to hopefully allow fighters to not refrain from using this too much.

	warnie = "spellwarning"
	no_early_release = TRUE
	movement_interrupt = FALSE
	antimagic_allowed = TRUE //This is a physical skill.
	charging_slowdown = 3
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/misc/athletics //its based on your physical form so.
	cost = 1

	xp_gain = TRUE //train them athletics
	miracle = FALSE

	invocation = ""
	invocation_type = "none" //can be none, whisper, emote and shout

/obj/effect/proc_holder/spell/self/secondwind/cast(mob/user = usr)
	var/mob/living/target = user
	var/mob/living/carbon/M = target
	M.rogfat_add(-200)
	M.rogstam_add(-100) //tires you out fatigue wise but recovers stamina as a final push. (stam and fatigue are reversed in names and functions its weird)
	M.heal_wounds(200)
	M.heal_overall_damage(200, 200, updating_health = TRUE)
	user.balloon_alert_to_viewers("Second Wind!")
	user.visible_message("<span class='info'>[user] takes a deep breath in.</span>", "<span class='notice'>I take a deep breath in, invoking the determination within.</span>")

GLOBAL_LIST_INIT(character_accents, list(
	"No accent"=/datum/char_accent/none,
	"Stonespirit accent"=/datum/char_accent/dwarf,
	"Dwarf Gibberish accent"=/datum/char_accent/dwarf_gibberish,
	"Roseveilian accent"=/datum/char_accent/dark_elf,
	"Timberwolf accent"=/datum/char_accent/elf,
	"Greenlyre accent"=/datum/char_accent/grenzelhoft,
	"Northerner accent"=/datum/char_accent/hammerhold,
	"Celestian accent"=/datum/char_accent/assimar,
	"Lizard accent"=/datum/char_accent/lizard,
	"Infernal accent"=/datum/char_accent/tiefling,
	"Greenskin accent"=/datum/char_accent/half_orc,
	"Pirate Accent"=/datum/char_accent/axian,
	"Valley Girl accent"=/datum/char_accent/valley))

/datum/char_accent
	var/name

/mob/living/carbon/human
	var/char_accent = "No accent"

/datum/char_accent/none
	name = "No accent"

/datum/char_accent/dwarf
	name = "Stonespirit accent"

/datum/char_accent/dwarf_gibberish
	name = "Dwarf Gibberish accent"

/datum/char_accent/dark_elf
	name = "Roseveilian accent"

/datum/char_accent/elf
	name = "Timberwolf accent"

/datum/char_accent/grenzelhoft
	name = "Greenlyre accent"

/datum/char_accent/hammerhold
	name = "Northerner accent"

/datum/char_accent/assimar
	name = "Celestian accent"

/datum/char_accent/lizard
	name = "Lizard accent"

/datum/char_accent/tiefling
	name = "Infernal accent"

/datum/char_accent/half_orc
	name = "Greenskin accent"

/datum/char_accent/axian
	name = "Pirate accent"

/datum/char_accent/valley
	name = "Valley Girl accent"

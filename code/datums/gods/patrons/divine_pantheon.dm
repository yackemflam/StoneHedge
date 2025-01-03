/datum/patron/divine
	name = null
	associated_faith = /datum/faith/divine
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal

/datum/patron/divine/elysius
	name = "Elysius"
	domain = "Beginnings, Hope, Dawn. Setting the path. Flames, Sunlight, Illumination. (Active Energies)"
	desc = "Elysius, The Golden Dragon."
	worshippers = "The Noble Hearted, Zealots, Warriors and Healers."
	mob_traits = list(TRAIT_EMPATH)
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/revive
	t4 = /obj/effect/proc_holder/spell/invoked/projectile/spitfire
	confess_lines = list(
		"Elysius is my Gilded Armor!",
		"GREAT-WYRM BRINGS LAW!",
		"I SERVE THE GLORY OF THE SUN!",
	)

/datum/patron/divine/lune
	name = "Lune"
	domain = "Intellect, Study, Divination, Introspection. Rivers, Moons, Reflections. (Passive Energies)"
	desc = "Lune, the Silver Dragon. Twin of Elysius, symbolized by the moon. She is Patron of wisdom."
	worshippers = "Wizards, Scholars, Wisened Folk,"
	mob_traits = list(TRAIT_NOCSNEAK, TRAIT_NIGHT_OWL)
	t1 = /obj/effect/proc_holder/spell/invoked/blindness
	t2 = /obj/effect/proc_holder/spell/invoked/invisibility
	confess_lines = list(
		"LUNE IS WISDOM!",
		"LUNE'S PALE GLOWING EYES SEE ALL!",
		"I SEEK THE MYSTERIES OF THE MOON!",
	)

/datum/patron/divine/sylvarn
	name = "Sylvarn"
	domain = "Life, Balance, Harmony, Wilderness, Wisdom.Wildlife, Animals, Plants."
	desc = "Sylvarn is the god of nature and to many, wisdom. He is the cradle of life as much as the brutal and primal truth. Sylvarn is said  to be a mighty goatman, who’s realm is a verdant forestrealm full of the fairyfolk and nature spirits."
	worshippers = "Druids, Beasts, Wisemen, Fey, Elves, Supernatural Beings."
	mob_traits = list(TRAIT_KNEESTINGER_IMMUNITY)
	t1 = /obj/effect/proc_holder/spell/targeted/blesscrop
	t2 = /obj/effect/proc_holder/spell/targeted/beasttame
	t3 = /obj/effect/proc_holder/spell/targeted/conjure_glowshroom
	t4 = /obj/effect/proc_holder/spell/invoked/cure_rot
	confess_lines = list(
		"SYLVARN GUIDES!!",
		"THE TREEFATHER BRINGS BOUNTY!",
		"I ANSWER THE CALL OF THE WILD!",
	)

/datum/patron/divine/abyssia
	name = "Abyssia"
	domain = "God of the Ocean, Storms and the Tide"
	desc = "The Beloved Daughter of the Sea, gifted primordial kin food and water. She is said to be both cruel and calm, if her icey waters and wailing winds are heeded ahead of time. She is the warning and the Omen."
	worshippers = "Men and Women of the Sea, Primitive Aquatics, Merfolk, Druids, Creatures of the Deep."
	mob_traits = list (TRAIT_WATERBREATHING, TRAIT_ABYSSOR_SWIM)
	confess_lines = list(
		"ABYSSIA COMMANDS THE WAVES!",
		"THE OCEAN'S FURY IS ABYSSOR'S WILL!",
		"I AM DRAWN BY THE PULL OF HER TIDES!",
	)

/datum/patron/divine/minhur
	name = "Minhur"
	domain = "War, Dance, Tactic, Rejoice, Celebration."
	desc = "The dervish of Blades, Minhur teaches that battle is like a dance; the duality between life/death and revelry. Minhur's followers prefer dexterity and tactful dancelike movements; encouraging mortals to act with decorum, etiquette and poise whenever possible."
	worshippers = "Warriors, Sellswords & Fencers."
	mob_traits = list (TRAIT_CIVILIZEDBARBARIAN, TRAIT_DEATHBYSNOOSNOO) // "duality between life/death and revelry"
	confess_lines = list(
		"MINHUR'S WHIRLWIND!",
		"THROUGH STRIFE, GRACE!",
		"THE RHYTHYM OF THE CELESTIAN BATTLE BECKONS ME HOME!",
	)

/datum/patron/divine/yamais
	name = "Yamais"
	domain = "Death, Judgement, Soul, Reincarnation."
	desc = "Yamais is the guardian, the crypt-scribe, and the great remembrance. She who watches makes certain each soul reaches its owed afterlife. It is Yamais who remembers peoples actions and worth. Yamais does not take kindly to necromancy which goes against the natural cycle. Though she permits willing undead to return, and has even turned her gaze from liches such as the baelnornes of the elven kingdoms."
	worshippers = "The Dead, Mourners, Gravekeepers"
	mob_traits = list(TRAIT_SOUL_EXAMINE)
	t1 = /obj/effect/proc_holder/spell/targeted/burialrite
	t2 = /obj/effect/proc_holder/spell/targeted/churn
	t3 = /obj/effect/proc_holder/spell/targeted/soulspeak
	t4 = /obj/effect/proc_holder/spell/invoked/revive/shaman
	confess_lines = list(
		"ALL SOULS FIND THEIR WAY TO YAMAIS!",
		"THE TOLLKEEPER IS OUR FINAL JUDGE!",
		"I FEAR NOT DEATH, MY SOUL IS LIGHT AS A FEATHER!",
	)

/datum/patron/divine/onder
	name = "Onder"
	domain = "Art, Beauty, Artisanry, Vanity, Poetry, Freedom and Luck."
	desc = "Onder is said to be inspiration itself. The god of Stories, Music and Memory. Onder is worshipped by bards and rogues alike. Onder’s story of being a changeling bard who walked amidst many cultures, gathering their tales and impressive many beings alike made them the god of charisma and luck."
	worshippers = "Bards, Gamblers, Poets, Musicians, Diplomats and Artists."
	mob_traits = list(TRAIT_BOG_TREKKING)
	t1 = /obj/effect/proc_holder/spell/invoked/blindness
	t2 = /obj/effect/proc_holder/spell/invoked/invisibility
	confess_lines = list(
		"Elysius, cut us a path!",
		"Lune guide me gentle!",
		"Sylvarn guide our souls wisened!",
		"Beware the daughter of the sea!",
		"The Red dancer comes for the wicked!",
		"All souls find the same stream!",
		"Such Beauty, Such bliss, Even in this pain I find Art!",
		"PESTRA SOOTHES ALL ILLS!",
		"Temperance my blade, my path forged ahead, strucken like blade!",
		"Love in my heart,I create art! I was a wonder of Onder from the start!~",
	)

/datum/patron/divine/hermeir
	name = "Hermeir"
	domain = "Medicine, Progress, Advancement, Healing, Exploration."
	desc = "Hermeir is known as the Messenger; said to have a staff of entwined serpents in a figure eight, one white, the other black. Which their magick staff they are able to discern all things. To know all truths and observations with time in their immortal knowledgeable gaze. The followers of Hermeir are able to utilize magic as much as the mundane to assist the wounded,or departed. Hermeir believes whatever the means - we must swear an oath to perpetual foward progress and divine good.."
	worshippers = "The Sick, Phyicians, Apothecaries, Healers, Scientists, Alchemists."
	mob_traits = list(TRAIT_SELF_AWARE, TRAIT_ROT_EATER)
	t1 = /obj/effect/proc_holder/spell/invoked/heal
	t2 = /obj/effect/proc_holder/spell/invoked/attach_bodypart
	t3 = /obj/effect/proc_holder/spell/invoked/cure_rot
	t4 = /obj/effect/proc_holder/spell/invoked/revive/shaman
	confess_lines = list(
		"Hermeir will guide all formula!",
		"The Wheel turns, I am but a part of it all!",
		"Hermeir, guide my healths!",
	)

/datum/patron/divine/svaeryog
	name = "Svaeryog"
	domain = "Fire, Metalwork, Temperance, Defence, Craft, Cunning, Artisanry."
	desc = "Svaeryog blessed  the lands with metal and the lessons of temperance. Iron of heart and mind through perseverance. He was said to be a mortal who turned himself with magick and metals to the form of a mighty divine golem. "
	worshippers = "Smiths, Crafters, Masochists, Miners, Artisans."
	mob_traits = list(TRAIT_MALUMSGRACE)
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	//below may need shuffling or changes idfk what they do.
	t2 = /obj/effect/proc_holder/spell/invoked/vigorousexchange
	t3 = /obj/effect/proc_holder/spell/invoked/heatmetal
	t4 = /obj/effect/proc_holder/spell/invoked/hammerfall
	confess_lines = list(
		"Blessed forgefires be my guidance!",
		"TRUE VALUE IS IN THE TOIL!",
		"I AM AN INSTRUMENT OF CREATION!",
	)

//Eora content from Stonekeep

/datum/patron/divine/viiritri
	name = "Viiritri"
	domain = "Feeling, Empathy, Passion.Hearts, Desires, Connection."
	desc = "Viiritri is the god of emotions, the soul and the heart. Viiritri teaches the art of feeling, and their devoted are often spiritual healers and lovers of all walks. Viiritri is said to take the shape of songbirds and other mystical acts of inspiration. Their realm known as Halceon is rumored to be full of song, dance and bliss to those who loved truly, purely and freely in her service."
	worshippers = "Lovers, Healers, Adventurers, Poets, Families and Warriors."
	mob_traits = list(TRAIT_SEXDEVO, TRAIT_SEEDKNOW)
	t1 = /obj/effect/proc_holder/spell/invoked/bud
	t2 = /obj/effect/proc_holder/spell/invoked/eoracurse
	t3 = /obj/effect/proc_holder/spell/invoked/enrapture
	t4 = /obj/effect/proc_holder/spell/invoked/torsion
	confess_lines = list(
		"VIIRITRI BRINGS US TOGETHER!",
		"HER BEAUTY IS EVEN IN THIS TORMENT!",
		"I LOVE YOU, E-EVEN AS Y-YOU HURT ME!",
	)

//STONEKEEP ADDITIONS
/datum/patron/divine/jayx
	name = "Jayx"
	domain = "God of Twilight and Change. Magic. Transformation. Dusk/Dawn. Crisis/Resolution."
	desc = "Jayx is known as the Herald of change, often depicted as a two-tailed comet or Phoenix. The Divine Phoenix represents the immortal cycle of growth and advancement, often a god of both magic and art; they are known more than anything as the passage of time itself and bright blue magical fire. (Mana)"
	worshippers = "Mages, Alchemists, Soul-Searchers, Fateweavers, Supernatural Creatures, Soothsayers."
	mob_traits = list(TRAIT_USEMAGIC)
	t1 = /obj/effect/proc_holder/spell/invoked/forcewall_weak
	t2 = /obj/effect/proc_holder/spell/targeted/projectile/magic_missile
	t3 = /obj/effect/proc_holder/spell/invoked/invisibility
	t4 = /obj/effect/proc_holder/spell/invoked/projectile/fireball/greater
	confess_lines = list(
		"THE PHOENIX BURNS BRIGHT AND PURE!",
		"IN HIS FLAMES I AM REBORN!",
		"JAYX, LET THE TWILIGHT BE RECKONED!",
	)

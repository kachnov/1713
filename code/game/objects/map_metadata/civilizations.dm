#define NO_WINNER "The round is proceeding normally."
/obj/map_metadata/civilizations
	ID = MAP_CIVILIZATIONS
	title = "Civilizations (225x225x2)"
	lobby_icon_state = "civilizations"
	caribbean_blocking_area_types = list(/area/caribbean/no_mans_land/invisible_wall/)
	respawn_delay = 6000 // 10 minutes!
	squad_spawn_locations = FALSE
//	min_autobalance_players = 90
	faction_organization = list(
		CIVILIAN,)
	available_subfactions = list(
		)
	roundend_condition_sides = list(
		list(CIVILIAN) = /area/caribbean/british
		)
	age = "5000 B.C."
	civilizations = TRUE
	var/tribes_nr = 1
	faction_distribution_coeffs = list(CIVILIAN = 1)
	battle_name = "the civilizations"
	mission_start_message = "<big>After ages as hunter-gatherers, one tribe has settled in this area and started farming. Will it advance through the ages, or be forgotten forever?</big>"
	ambience = list('sound/ambience/jungle1.ogg')
	faction1 = CIVILIAN
	single_faction = TRUE
	availablefactions_run = TRUE
	songs = list(
		"Words Through the Sky:1" = 'sound/music/words_through_the_sky.ogg',)
	var/age1_lim = 90
	var/age1_done = 0
	var/age2_lim = 140
	var/age2_done = 0
	var/age3_lim = 250
	var/age3_done = 0

/obj/map_metadata/civilizations/New()
	..()
	if (clients.len <= 8)
		tribes_nr = 1
	if (clients.len > 8 && clients.len <= 16)
		tribes_nr = 2
	if (clients.len > 16 && clients.len <= 24)
		tribes_nr = 3
	if (clients.len > 24 && clients.len <= 30)
		tribes_nr = 4
	if (clients.len > 30 && clients.len <= 36)
		tribes_nr = 5
	if (clients.len > 36)
		tribes_nr = 6
	if (tribes_nr >= 2)
		mission_start_message = "<big>After ages as hunter-gatherers, [tribes_nr] tribes have settled in this area and started farming. Will they advance through the ages, or be forgotten forever?</big>"
	spawn(18000)
		seasons()
/obj/map_metadata/civilizations/faction2_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 15000 || admin_ended_all_grace_periods)

/obj/map_metadata/civilizations/faction1_can_cross_blocks()
	return (processes.ticker.playtime_elapsed >= 15000 || admin_ended_all_grace_periods)

/obj/map_metadata/civilizations/cross_message(faction)
	return ""

/obj/map_metadata/civilizations/proc/seasons()
	if (season == "WINTER")
		season = "SPRING"
		world << "<big>The weather is getting warmer. It is now <b>Spring</b>.</big>"
		for (var/obj/structure/wild/tree/live_tree/TREES)
			TREES.update_icon()
	else if (season == "SUMMER")
		season = "FALL"
		world << "<big>The leaves start to fall and the weather gets colder. It is now <b>Fall</b>.</big>"
		for (var/obj/structure/wild/tree/live_tree/TREES)
			TREES.update_icon()
	else if (season == "FALL")
		season = "WINTER"
		world << "<big>The weather gets very cold. <b>Winter</b> has arrived.</big>"
		for (var/obj/structure/wild/tree/live_tree/TREES)
			TREES.update_icon()
	else if (season == "SPRING")
		season = "SUMMER"
		world << "<big>The weather is warm. It is now <b>Summer</b>.</big>"
		for (var/obj/structure/wild/tree/live_tree/TREES)
			TREES.update_icon()
	spawn(18000)
		seasons()

/obj/map_metadata/civilizations/tick()
	..()
	if (age1_done == FALSE)
		if ((civa_research[1]+civa_research[2]+civa_research[3]) >= age1_lim || (civb_research[1]+civb_research[2]+civb_research[3]) >= age1_lim   || (civc_research[1]+civc_research[2]+civc_research[3]) >= age1_lim   || (civd_research[1]+civd_research[2]+civd_research[3]) >= age1_lim   || (cive_research[1]+cive_research[2]+cive_research[3]) >= age1_lim   || (civf_research[1]+civf_research[2]+civf_research[3]) >= age1_lim )
			world << "<big>The world has advanced into the Bronze Age!</big>"
			age = "313 B.C."
			set_ordinal_age()
			age1_done = TRUE
	if (age2_done == FALSE)
		if ((civa_research[1]+civa_research[2]+civa_research[3]) >= age2_lim || (civb_research[1]+civb_research[2]+civb_research[3]) >= age2_lim    || (civc_research[1]+civc_research[2]+civc_research[3]) >= age2_lim    || (civd_research[1]+civd_research[2]+civd_research[3]) >= age2_lim    || (cive_research[1]+cive_research[2]+cive_research[3]) >= age2_lim    || (civf_research[1]+civf_research[2]+civf_research[3]) >= age2_lim  )
			world << "<big>The world has advanced into the Medieval Age!</big>"
			age = "1013"
			set_ordinal_age()
			age2_done = TRUE
	if (age3_done == FALSE)
		if ((civa_research[1]+civa_research[2]+civa_research[3]) >= age3_lim|| (civb_research[1]+civb_research[2]+civb_research[3]) >= age3_lim    || (civc_research[1]+civc_research[2]+civc_research[3]) >= age3_lim    || (civd_research[1]+civd_research[2]+civd_research[3]) >= age3_lim    || (cive_research[1]+cive_research[2]+cive_research[3]) >= age3_lim    || (civf_research[1]+civf_research[2]+civf_research[3]) >= age3_lim  )
			world << "<big>The world has advanced into the Imperial Age!</big>"
			age = "1713"
			set_ordinal_age()
			age3_done = TRUE
#undef NO_WINNER
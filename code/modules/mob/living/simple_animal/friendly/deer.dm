/mob/living/simple_animal/deer/male
	name = "stag"
	desc = "Provides some nice meat, if you can catch it."
	icon_state = "deer_m"
	icon_living = "deer_m"
	icon_dead = "deer_m_dead"
	icon_gib = "deer_gib_m"
	speak = list("rrrw","meew","MEEEW")
	speak_emote = list("bellows","bleats")
	emote_hear = list("bellows")
	emote_see = list("shakes its head", "looks attently")
	speak_chance = TRUE
	turns_per_move = 2
	see_in_dark = 8
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	meat_amount = 5
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	attacktext = "kicked"
	health = 50
	mob_size = MOB_LARGE
/mob/living/simple_animal/deer/female
	name = "doe"
	icon_state = "deer_f"
	icon_living = "deer_f"
	icon_dead = "deer_f_dead"
	icon_gib = "deer_gib_f"
	mob_size = MOB_LARGE
/mob/living/simple_animal/deer/Life()
	..()
	var/done = FALSE
	for (var/mob/living/carbon/human/H in range(5, src))
		if (done == FALSE)
			var/dirh = get_dir(src,H)
			if (dirh == WEST)
				walk_to(src, locate(x+5,y,z), TRUE, 3)
			else if (dirh == EAST)
				walk_to(src, locate(x-5,y,z), TRUE, 3)
			else if (dirh == NORTH)
				walk_to(src, locate(x,y-5,z), TRUE, 3)
			else if (dirh == SOUTH)
				walk_to(src, locate(x,y+5,z), TRUE, 3)
			done = TRUE
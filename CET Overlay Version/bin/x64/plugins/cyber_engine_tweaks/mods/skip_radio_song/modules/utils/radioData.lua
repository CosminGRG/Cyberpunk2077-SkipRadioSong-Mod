--Original Improved Radio mod by Seank23
--Cyberpunk 2.00 addaption by TheHoss2
--Missing tagdata added by Thortok2000

radioData = {

    radioStationNames = {
        ["radio_station_01_att_rock"] = "107.3 Morro Rock Radio",
        ["radio_station_02_aggro_ind"] = "89.3 Radio Vexelstrom",
        ["radio_station_03_elec_ind"] = "92.9 Night FM",
        ["radio_station_04_hiphop"] = "101.0 The Dirge",
        ["radio_station_05_pop"] = "98.7 Body Heat Radio",
        ["radio_station_06_minim_techno"] = "95.2 SAMIZDAT RADIO",
        ["radio_station_07_aggro_techno"] = "103.5 Radio Pebkac",
        ["radio_station_08_jazz"] = "91.9 Royal Blue Radio",
        ["radio_station_09_downtempo"] = "88.3 Pacific Dreams",
        ["radio_station_10_latino"] = "106.9 30 Principales",
        ["radio_station_11_metal"] = "96.1 Ritual FM",
		["radio_station_12_growl_fm"] = "89.7 GROWL FM",
		["radio_station_13_dark_star"] = "107.5 Dark Star",
		["radio_station_14_impulse_fm"] = "99.9 Impulse"
    },

    radioStationSongs = {
        ["radio_station_01_att_rock"] = "0x0000CE51,0x0000CE52,0x0000CE53,0x0000CE55,0x0000CE56,0x0000CE57,0x0000CE58,0x0000CE59,0x0000CE5A,0x0000CE5B,0x0000CE5C,0x0000D06E,0x0000D06F,0x0000D071,0x0000D072,",
        ["radio_station_02_aggro_ind"] = "0x0000CE5D,0x0000CE5E,0x0000CE5F,0x0000CE60,0x0000CE61,0x0000CE62,0x0000CE63,0x0000CE64,0x0000CE65,0x0000CE66,0x0000CE67,0x0000CE68,0x0000CE69,0x0000CE6A,0x0001314F,",
        ["radio_station_03_elec_ind"] = "0x0000CE6F,0x0000CE70,0x0000CE71,0x0000CE72,0x0000CE73,0x0000CE74,0x0000CE75,0x0000CE76,0x0000CE77,0x0000CE78,0x0000CE79,0x0000CE7A,0x0000CE7B,0x0000D085,",
        ["radio_station_04_hiphop"] = "0x0000CE80,0x0000CE81,0x0000CE82,0x0000CE83,0x0000CE84,0x0000CE85,0x0000CE86,0x0000CE87,0x0000CE88,0x0000CE89,0x0000CE8A,0x0000CE8B,0x0000CE8C,0x0000CE8D,0x0000CE8E,0x0000CE8F,0x0000CE90,0x0000CE91,0x0000CE92,0x0000CE93,0x0000CE94,0x0000D086,0x0000D087,",
        ["radio_station_05_pop"] = "0x0000CE54,0x0000CE95,0x0000CE96,0x0000CE97,0x0000CE98,0x0000CE99,0x0000CE9A,0x0000CE9B,0x0000CE9E,0x0000CE9F,0x0000D075,0x0000D076,0x00013150,",
        ["radio_station_06_minim_techno"] = "0x0000CEA0,0x0000CEA1,0x0000CEA2,0x0000CEA3,0x0000CEA4,",
        ["radio_station_07_aggro_techno"] = "0x0000CEA5,0x0000CEA6,0x0000CEA7,0x0000CEA8,0x0000CEA9,0x0000CEAA,0x0000CEAB,0x0000CEAC,0x0000CEAD,0x0000CEAE,0x0000CEAF,0x0000CEB0,0x0000CEB1,0x0000D2AB,0x0000D2AC,",
        ["radio_station_08_jazz"] = "0x0000D077,0x0000D078,0x0000D079,0x0000D07B,0x0000D07C,0x0000D07D,0x0000D07E,0x0000D07F,0x0000D080,",
        ["radio_station_09_downtempo"] = "0x0000CE40,0x0000CE41,0x0000CE42,0x0000CE43,0x0000CE44,0x0000CE45,0x0000CE46,0x0000CE47,0x0000CE48,0x0000CE49,0x0000CE4A,0x0000CE4B,0x0000CE4C,0x0000CE4D,0x0000CE4E,0x0000CE4F,0x0000CE50,",
        ["radio_station_10_latino"] = "0x0000CEB2,0x0000CEB3,0x0000CEB4,0x0000CEB5,0x0000CEB6,0x0000CEB7,0x0000CEB8,0x0000CEB9,0x0000CEBA,0x0000CEBB,0x0000CEBC,",
        ["radio_station_11_metal"] = "0x0000CEBD,0x0000CEBE,0x0000CEBF,0x0000CEC0,0x0000CEC1,0x0000CEC2,0x0000CEC3,0x0000CEC4,0x0000CEC5,0x0000CEC6,0x0000CEC7,0x0000CEC8,0x0000CEC9,0x0000CECA,",
		["radio_station_12_growl_fm"] = "0x00016DEE,0x00016DEF,0x00016DF0,0x00016DF1,0x00016DF2,0x00016DF3,0x00016DF4,0x00016DF5,0x00016DF6,0x00016DF7,0x00016DF8,0x00016DF9,0x00016DFA,0x00016DFB,",
		["radio_station_13_dark_star"] = "0x00016DFC,0x00016DFD,0x00016DFE,0x00016DFF,0x00016E00,0x00016E01,0x00016E02,0x00016E03,0x00016E04,0x00016E05,0x00016E06,0x00016E07,0x00016E09,",
		["radio_station_14_impulse_fm"] = "0x00016E08,"
    },

    radioStationIndex = {
        ["radio_station_01_att_rock"] = 5,
        ["radio_station_02_aggro_ind"] = 0,
        ["radio_station_03_elec_ind"] = 1,
        ["radio_station_04_hiphop"] = 2,
        ["radio_station_05_pop"] = 6,
        ["radio_station_06_minim_techno"] = 9,
        ["radio_station_07_aggro_techno"] = 3,
        ["radio_station_08_jazz"] = 10,
        ["radio_station_09_downtempo"] = 4,
        ["radio_station_10_latino"] = 7,
        ["radio_station_11_metal"] = 8,
		["radio_station_12_growl_fm"] = 11,
		["radio_station_13_dark_star"] = 12,
		["radio_station_14_impulse_fm"] = 13
    },

    songHashToInfo = {
        ["0x00000000"] = "|Night City|News",
        ["0x0000CE52"] = "mus_radio_01_att_rock_heaven_ho|XerzeX|Heave Ho",
        ["0x0000CE51"] = "mus_radio_01_att_rock_suffer_me|Brutus Backlash|SufferMe",
        ["0x0000CE62"] = "mus_radio_02_aggro_ind_black_terminal_vox_upgrade|Upgrade|Black Terminal",
        ["0x0000CE61"] = "mus_radio_02_aggro_ind_comeclose|Keine|Come Close",
        ["0x0000CE60"] = "mus_radio_02_aggro_ind_dead_pilot|Keine|Dead Pilot",
        ["0x0000CE5E"] = "mus_radio_02_aggro_ind_kill_the_messenger|The Cartesian Duelists|Kill the Messenger",
        ["0x0000CE5F"] = "mus_radio_02_aggro_ind_makes_me_feel_better|Slavoj McAllister|Makes Me Feel Better",
        ["0x0000CE65"] = "mus_radio_02_aggro_ind_never_stop_me|Den of Degenerates|Never Stop Me",
        ["0x0000CE68"] = "mus_radio_02_aggro_ind_night_city_aliens|Homeshool Dropouts|Night City Aliens",
        ["0x0000CE67"] = "mus_radio_02_aggro_ind_pain|The Red Glare|Pain",
        ["0x0000CE63"] = "mus_radio_02_aggro_ind_reaktion|Alexei Brayko|Reaktion",
        ["0x0000CE5D"] = "mus_radio_02_aggro_ind_resist_and_disorder|The Cartesian Duelists|Resist and Disorder",
        ["0x0000CE66"] = "mus_radio_02_aggro_ind_violence|The Red Glare|Violence",
        ["0x0000CE64"] = "mus_radio_02_aggro_ind_with_her|Ego Affliciton|With Her",
        ["0x0000CE6F"] = "mus_radio_03_elec_ind_dirty_roses|Perilous Futur|Dirty Roses",
        ["0x0000CE79"] = "mus_radio_03_elec_ind_flying_heads|Ashes Potts|Flyinghead",
        ["0x0000CE78"] = "mus_radio_03_elec_ind_killkill|The Bait|KillKill",
        ["0x0000CE72"] = "mus_radio_03_elec_ind_maniak|Doctor Berserk|Maniak",
			["0x0000D085"] = "mus_radio_03_elec_ind_neuron|Auer|Neuron", -- Does not seem to ever play
        ["0x0000CE76"] = "mus_radio_03_elec_ind_ppgame05|Reviscerator|Glitched Revelation",
        ["0x0000CE77"] = "mus_radio_03_elec_ind_ppgame18|Reviscerator|Yellow Box",
        ["0x0000CE75"] = "mus_radio_03_elec_ind_run|Kings of Collapse|Run",
        ["0x0000CE70"] = "mus_radio_03_elec_ind_worlds|The Unresolved|Worlds",
        ["0x0000CE71"] = "mus_radio_03_elec_ind_x|The Unresolved|X",
        ["0x0000CE83"] = "mus_radio_04_hiphop_bigger_man|Droox|Bigger Man",
        ["0x0000CE81"] = "mus_radio_04_hiphop_blouses_blue|NC3|Blouses Blue",
        ["0x0000CE8B"] = "mus_radio_04_hiphop_bruzez|Knixit|Bruzez",
        ["0x0000D087"] = "mus_radio_04_hiphop_ccc|Cacimbo|CCC",
        ["0x0000CE8C"] = "mus_radio_04_hiphop_clip_boss|Sugarcoob feat. Anak Konda|Clip Boss",
        ["0x0000CE8A"] = "mus_radio_04_hiphop_day_of_dead|HAPS|Day of Dead",
        ["0x0000CE85"] = "mus_radio_04_hiphop_dishonor|Ichibanchi|Dishonor",
        ["0x0000CE86"] = "mus_radio_04_hiphop_frost|Yamete|Frost",
        ["0x0000CE84"] = "mus_radio_04_hiphop_go_blaze|One feat. G'Natt|Go Blaze",
        ["0x0000CE8E"] = "mus_radio_04_hiphop_goodmorn|Pazoozu|Hello Good Morning",
        ["0x0000CE90"] = "mus_radio_04_hiphop_gr4ves|Kyubik|Gr4ves",
        ["0x0000CE87"] = "mus_radio_04_hiphop_hs_bully|UMVN feat. Imp Ra|High School Bully",
        ["0x0000CE88"] = "mus_radio_04_hiphop_nbomdanalog|DAPxFLEM|NBOMdANALOG",
        ["0x0000D086"] = "mus_radio_04_hiphop_nose_bleed|Pecero|Nose Bleed",
        ["0x0000CE8D"] = "mus_radio_04_hiphop_plucku|3XB feat. Gun-Fu|Pluck U",
        ["0x0000CE82"] = "mus_radio_04_hiphop_problem_kids|Young Kenny|Problem Kids",
        ["0x0000CE8F"] = "mus_radio_04_hiphop_run_the_block|Bez Tatami feat. Gully Foyle|Run the Block",
        ["0x0000CE89"] = "mus_radio_04_hiphop_suicide|Code 137|Suicide",
        ["0x0000CE80"] = "mus_radio_04_hiphop_the_god_machines|Kill Trigger feat. Paul Senai, Kakow|The God Machines",
        ["0x0000CE91"] = "mus_radio_04_hiphop_warning_shots|Laputan Machine|Warningshots",
        ["0x0000CE95"] = "mus_radio_05_pop_cirque_du_soleil|Neon Haze|Circus Minimus",
        ["0x0000CE9A"] = "mus_radio_05_pop_history|Trash Generation|History",
        ["0x0000CE98"] = "mus_radio_05_pop_i_want_to_stay_at_your_house|Hallie Coggins|I Want to Stay at Your House",
        ["0x0000CE97"] = "mus_radio_05_pop_night_city|Artemis Delta|Night City",
		["0x0000CEA5"] = "mus_radio_07_aggro_techno_bios|Error|Bios",
		["0x0000CEA6"] = "mus_radio_07_aggro_techno_drained|Sao Mai|Drained",
		["0x0000CEA8"] = "mus_radio_07_aggro_techno_follow_the_white_crow|Nablus|Follow the White Crow",
		["0x0000CEA7"] = "mus_radio_07_aggro_techno_subvert|Spoon Eater|Subvert",
        ["0x0000CE43"] = "mus_radio_09_downtempo_antagonistic|Pacific Avenue|Antagonistic",
        ["0x0000CE40"] = "mus_radio_09_downtempo_isometric_air|Quantum Lovers|Isometric Air",
        ["0x0000CE42"] = "mus_radio_09_downtempo_practical_heart|Quantum Lovers|Practical Heart",
        ["0x0000CE41"] = "mus_radio_09_downtempo_real_window|Quantum Lovers|Real Window",
        ["0x0000CE44"] = "mus_radio_09_downtempo_simple_pleasures|Jänsens|Simple Pleasures",
        ["0x0000CEB2"] = "mus_radio_10_latino_bamo|Kartel Sonoro|Bamo",
        ["0x0000CEB6"] = "mus_radio_10_latino_barrio|Big Machete|Barrio",
        ["0x0000CEB9"] = "mus_radio_10_latino_cumbia|Papito Gringo|Muévelo / Cumbia",
        ["0x0000CEB3"] = "mus_radio_10_latino_daggafrica|Kartel Sonoro|Daggafrica",
        ["0x0000CEB4"] = "mus_radio_10_latino_dinero|7 Facas|Dinero",
        ["0x0000CEBA"] = "mus_radio_10_latino_muertothrash|FKxU|Muerto Thrash",
        ["0x0000CEB5"] = "mus_radio_10_latino_serpant|7 Facas|Serpant",
        ["0x0000CEC8"] = "mus_radio_11_metal_abandoned_land|Fist of Satan|Abandoned Land",
        ["0x0000CEC0"] = "mus_radio_11_metal_acid_breather|Forlorn Scourge|Acid Breather",
        ["0x0000CEC9"] = "mus_radio_11_metal_black_concrete|Fist of Satan|Black Concrete",
        ["0x0000CEBD"] = "mus_radio_11_metal_finis|V3rm1n|Finis",
        ["0x0000CEBF"] = "mus_radio_11_metal_march30|Bacillus|March 30",
        ["0x0000CEBE"] = "mus_radio_11_metal_theaccursed|Dread Soul|The Accursed",
        ["0x0000CE55"] = "mus_radio_01_attrock_likewise|IBDY|LikeWise",
        ["0x0000CE69"] = "mus_radio_02_aggroind_cyber_caca|Tainted Overlord|Selva Pulsátil",
        ["0x0000CE73"] = "mus_radio_03_electind_be_machine|Generating Dependencies|Be Machine",
        ["0x0000CE7A"] = "mus_radio_03_electind_cyberpunk03_|Yards of the Moon|Volcano the Sailor",
        ["0x0000CE74"] = "mus_radio_03_electind_cyberpunk07|Lick Switch|Like a Miracle",
        ["0x0000CE99"] = "mus_radio_05_pop_hole_in_the_sun|Point Break Candy|Hole In The Sun",
        ["0x0000CEA9"] = "mus_radio_08_aggro_techno_fake_spook|Ioshrine|Fake Spook",
        ["0x0000CEAA"] = "mus_radio_08_aggro_techno_move_dat|[Flesh]Reactor|Move .Dat",
        ["0x0000CEB1"] = "mus_radio_08_aggro_techno_cyberpunk02|Tinnitus|On My Way To Hell",
        ["0x0000CE4E"] = "mus_radio_09_downtempo_cdprojekt2_uferlos|Mona Mitchell|Ice Maddox",
        ["0x0000CE45"] = "mus_radio_09_downtempo_chodze|Muchomorr|Chooze",
        ["0x0000CE46"] = "mus_radio_09_downtempo_cyberpunk05|Lick Switch|Midnight Eye",
        ["0x0000CE47"] = "mus_radio_09_downtempo_cyberpunk06|Lick Switch|Blurred",
        ["0x0000CE48"] = "mus_radio_09_downtempo_cyberpunk08|Lick Switch|The Other Room",
        ["0x0000CEB8"] = "mus_radio_10_latino_hood|ChickyChickas|Hood",
        ["0x0000CEC3"] = "mus_radio_11_metal_scum|Hysteria|Scum",
        ["0x0000CEC5"] = "mus_radio_11_metal_kevin|Inferno Corps|Kevin",
        ["0x0000CEC4"] = "mus_radio_11_metal_fueled_by_poison|Inferno Corps|Fueled by Poison",
        ["0x0000CEC1"] = "mus_radio_11_metal_2|Nuclear Aura|Witches of the Harz Mountains",
        ["0x0000CE56"] = "mus_radio_01_att_rock_friday_night_fire_night|The Rubicones|Friday Night Fire Fight",
        ["0x0000CE53"] = "mus_radio_01_att_rock_i_will_follow|Beached Tarantula|I Will Follow",
        ["0x0000CE96"] = "mus_radio_05_pop_major_crimes|Window Weather|Major Crimes",
        ["0x0000CE54"] = "mus_radio_05_pop_whos_ready|IBDY|Who's Ready for Tomorrow",
				["0x0000CEAB"] = "mus_radio_07_aggro_techno_jam|Cutex|La Canopée", -- does not seem to ever play
		["0x0000CEAC"] = "mus_radio_07_aggro_techno_acid|Yards of the Moon|1101 Break",
		["0x0000CEAD"] = "mus_radio_07_aggro_techno_really_heavy_groove|Retinal Scam|Across the Floor",
		["0x0000CEAE"] = "mus_radio_07_aggro_techno_stoczterdziescitrzy|Retinal Scam|Gridflow",
		["0x0000CEAF"] = "mus_radio_07_aggro_techno_zero_acid|Skin<>Drifter|Undertow Velocity",
		["0x0000CE4A"] = "mus_radio_09_downtempo_dub_dub_mix_ambient|Left Unsaid|Retrogenesis",
        ["0x0000CEBC"] = "mus_radio_10_latino_westcoast_till_i_die|DJ CholoZ|Westcoast Til I Die", 
        ["0x0000CEC7"] = "mus_radio_11_metal_zurawie|Wydech|Żurawie", -- Ż needs fixing
        ["0x0000CEB7"] = "mus_radio_10_latino_tatted_on_my_face|Don Mara|Tatted On My Face",
        ["0x0000CEBB"] = "mus_radio_10_latino_only_son|ChickyChickas|Only Son",
        ["0x0000CE9E"] = "mus_radio_05_pop_crust_punk|IBDY|Crustpunk",
        ["0x0000CE9F"] = "mus_radio_05_pop_heres_a_thought|IBDY|Here's a Thought",
        ["0x0000CE92"] = "mus_radio_04_hiphop_yugen_blakrok|Gorgon Madonna|Metamorphosis",
        ["0x0000CE7B"] = "mus_radio_03_elect_ind_brain_damaged|Cyber Coorayber|Brain-Damaged",
        ["0x0000CE4F"] = "mus_radio_09_downtempo_demo4|Flatlander Woman|Lithium",
        ["0x0000CE50"] = "mus_radio_09_downtempo_demo7|Flatlander Woman|Slag",
        ["0x0000CE4D"] = "mus_radio_09_downtempo_ashes_and_diamonds|Wormview|Ashes and Diamonds",
        ["0x0000CE58"] = "mus_radio_01_att_rock_mstr01|Cutthroat|Sustain/Decay",
		["0x0000D2AC"] = "mus_radio_07_aggro_techno_stack_overflow|Dukes of Azure|Dark Retro",
		["0x0000CEB0"] = "mus_radio_07_aggro_techno_cdpmetal_vascular|Tar Hawk|Vascular",
        ["0x0000CE9B"] = "mus_radio_05_pop_ponpon_shit|Us Cracks|Ponpon Shit",
        ["0x0000CE49"] = "mus_radio_09_downtempo_le_stessa_causa|Sonoris Causa|La Stessa Causa",
        ["0x0000CE4B"] = "mus_radio_09_downtempo_miami_suicide|Talk To Us|Miami Suicide",
        ["0x0000CE4C"] = "mus_radio_09_downtempo_slippery_stabs|Talk To Us|Slippery Stabs",
        ["0x0000CEC6"] = "mus_radio_11_metal_future_drags|heXXXer|Future Drugs",
        ["0x0000CEC2"] = "mus_radio_11_metal_the_loop|Weles|The Loop",
        ["0x0000CEA1"] = "mus_radio_06_minim_tech_delirium2|Bara Nova|Delirium 2",
        ["0x0000CEA2"] = "mus_radio_06_minim_tech_harm_sweaty_pit|Bara Nova|Harm Sweaty Pit",
        ["0x0000CEA3"] = "mus_radio_06_minim_tech_my_lullaby_for_you|Bara Nova|My Lullaby for You",
        ["0x0000CEA0"] = "mus_radio_06_minim_tech_pilling_in_my_head|Bara Nova|Pilling in My Head",
        ["0x0000CEA4"] = "mus_radio_06_minim_tech_surprise_me|Bara Nova|Surprise Me, I'm Surprised Today",
        ["0x0000CE5A"] = "mus_radio_01_att_rock_black_dog|Samurai|Black Dog",
        ["0x0000CE5B"] = "mus_radio_01_att_rock_chippin_in|Samurai|Chippin' In",
        ["0x0000CE59"] = "mus_radio_01_att_rock_never_fade_away|Samurai|Never Fade Away",
        ["0x0000CE5C"] = "mus_radio_01_att_rock_the_ballad|Samurai|The Ballad of Buck Ravers",
        ["0x0000CE57"] = "mus_radio_01_att_rock_trauma|The Rubicones|Trauma",
        ["0x0000CE6A"] = "mus_radio_02_aggro_ind_cyber_tabla|Tainted Overlord|A Caça",
        ["0x0000CECA"] = "mus_radio_11_metal_i_wont_let_you_go|Shattered Void|I Won't Let You Go",
        ["0x0000D079"] = "mus_radio_08_jazz_generique|Miles Davis|Ascenseur Pour L'Échafaud - Générique",
        ["0x0000D07C"] = "mus_radio_08_jazz_solo_dancer|Charles Mingus|The Black Saint and the Sinner Lady - Solo Dancer",
        ["0x0000D07E"] = "mus_radio_08_jazz_you_dont_know_what_love_is|Chet Baker|You Don't Know What Love Is",
        ["0x0000D077"] = "mus_radio_08_jazz_black_satin_what_if_agharta|Miles Davis|Black Satin / What If / Agharta Prelude Dub",
        ["0x0000D078"] = "mus_radio_08_jazz_bitches_brew|Miles Davis|Bitches Brew",
        ["0x0000D07B"] = "mus_radio_08_jazz_impressions|John Coltrane|Impressions",
        ["0x0000D07D"] = "mus_radio_08_jazz_laura|Dexter Gordon|Sophisticated Giant - Laura",
        ["0x0000D07F"] = "mus_radio_08_jazz_round_midnight|Thelonius Monk|'Round Midnight",
        ["0x0000D080"] = "mus_radio_08_jazz_dark_prince|John McLaughlin|Dark Prince",
        ["0x0000CE93"] = "mus_radio_04_hiphop_no_save_point|Yankee and the Brave|No Save Point",
        ["0x0000D06F"] = "mus_radio_01_att_rock_no_convenient_apocalypse|Kruschev's Ghosts|No Convenient Apocalypse",
        ["0x0001314F"] = "mus_radio_02_aggro_ind_pig_dinner|N1v3z|Pig Dinner",
        ["0x0000CE94"] = "mus_radio_04_hiphop_ccc_flacko_loco|Telo$|Flacko Loko",
        ["0x0000D075"] = "mus_radio_05_pop_4aem|Lizzy Wizzy|4ÆM",
        ["0x0000D076"] = "mus_radio_05_pop_delicate_weapon|Lizzy Wizzy|Delicate Weapon",
        ["0x00013150"] = "mus_radio_05_pop_shygirl|Clockwork Venus|BM",
		["0x0000D2AB"] = "mus_radio_07_aggro_techno_cannibalismus|Bullet in the Head|Cannibalismus",
        ["0x0000D06E"] = "mus_radio_01_attrock_summer_of_2069|Blood and Ice|Summer of 2069",
        ["0x0000D072"] = "mus_radio_01_attrock_so_it_goes|Fingers and the Outlaws|So It Goes",
        ["0x0000D071"] = "mus_radio_01_attrock_to_the_fullest|Artifical Kids|To the Fullest",
		["0x00016DEE"] = "mus_radio_12_afterlife|Thai McGrath (ft. JustCosplaySings)|Afterlife",
		["0x00016DEF"] = "mus_radio_12_candyshell|Spirit Machines|Candy Shell",
		["0x00016DF0"] = "mus_radio_12_ch|Haru Nemuri|Samayoeru mama yuke",
		["0x00016DF1"] = "mus_radio_12_do_or_die|NoWorld|Do or Die",
		["0x00016DF2"] = "mus_radio_12_flatline|Red Dead Roadkill|Flatline",
		["0x00016DF3"] = "mus_radio_12_fumes|Aleyna Moon, Shrinjay Ghosh|FUMES",
		["0x00016DF4"] = "mus_radio_12_killshot|Frost, Justtjokay, Dubbygotbars, Knyvez|Killshot",
		["0x00016DF5"] = "mus_radio_12_kiroshi|D.O.H.|Look Through My Kiroshis",
		["0x00016DF6"] = "mus_radio_12_lit|Entolim|LIT",
		["0x00016DF7"] = "mus_radio_12_nebula|ESAI, Pure 100%|Nebula",
		["0x00016DF8"] = "mus_radio_12_skin_on_flesh|Skin on Flesh|El Tiempo",
		["0x00016DF9"] = "mus_radio_12_slipstream|Kiba|Slipstream",
		["0x00016DFA"] = "mus_radio_12_stars_die|Coeur Noir|Let the Stars Die",
		["0x00016DFB"] = "mus_radio_12_to_heaven|St. Aurora|Going to Heaven",
		["0x00016DFC"] = "mus_radio_13_dstar_27fuckdemons|OLO Y|Pierwszy raz naprawdę",  -- ę comes out as a ? and I'm not sure how to fix
		["0x00016DFD"] = "mus_radio_13_dstar_backxwash|BADPANNINI|Headrush",
		["0x00016DFE"] = "mus_radio_13_dstar_chokehold|Mr. Kipper|Choke Hold",
		["0x00016DFF"] = "mus_radio_13_dstar_cykoarctic|BWANA MUNGU|CykoArctic",
		["0x00016E00"] = "mus_radio_13_dstar_hagop|No Strings Attached|Orbital Insertion",
		["0x00016E01"] = "mus_radio_13_dstar_julek1|DJ papergekko|NUCLEAR DREAMLAND",
		["0x00016E02"] = "mus_radio_13_dstar_julek2|DJ papergekko|Bigger Crimes",
		["0x00016E03"] = "mus_radio_13_dstar_kyberpunk|Her Mashewski|fabrica KOSMOS",
		["0x00016E04"] = "mus_radio_13_dstar_minionsex|Mightonauts|Minion Sex",
		["0x00016E05"] = "mus_radio_13_dstar_mzuzu|Łotr|Memories of Mzuzu", -- Ł comes out as a ? and I'm not sure how to fix
		["0x00016E06"] = "mus_radio_13_dstar_roller|Mr. Kipper|Rolla",
		["0x00016E07"] = "mus_radio_13_dstar_zuukuka|ECKO FREQUENCY|Zuuka",
		["0x00016E09"] = "mus_radio_13_dstar_drk|Walt Air|dRk",
		["0x00016E08"] = "mus_radio_14impls_djset_pyramid_edit|-|DJSET"
	
        -- Songs for Impulse 99.9 when we figure out their hash codes:
		-- Walk Of Shame - Mr. Kipper
        -- Dreamy - Private Press
        -- DEEEEEEP - Private Press
        -- Black Labyrinth - Private Press
        -- Feed Your Soul - Private Press
        -- Liquid Disco - Private Press
        -- Sleepy Dust - Private Press
        -- Sparkling Frequency - Private Press
        -- Undeniably Changes - Private Press
        -- Void - Private Press
        -- Woozee - Private Press
        -- GREEEEEENHOUSE - Private Press
        -- BESTPL - Private Press
        -- ENERGEEHOUSE - Private Press
			
    }
}

return radioData

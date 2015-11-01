
// For this entire file: classnames that come from mods you don't have will be filtered out and won't cause any issues. You just won't see them ingame.





// *** SUPPORT STUFF ***

// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just don't try.
FOB_typename = "Land_Cargo_HQ_V1_F";
FOB_box_typename = "B_Slingload_01_Cargo_F";
FOB_truck_typename = "B_Truck_01_box_F";
Arsenal_typename = "B_supplyCrate_F";
Respawn_truck_typename = "B_Truck_01_medical_F";
huron_typename = "B_Heli_Transport_03_unarmed_F";
ammobox_b_typename = "Box_NATO_AmmoVeh_F";
ammobox_o_typename = "Box_East_AmmoVeh_F";
opfor_ammobox_transport = "O_Truck_03_transport_F";





// *** FRIENDLIES ***

// Each array below represents one page of the build menu
// Format : [ "classname", manpower, ammo, fuel ]

infantry_units = [
["B_soldier_F",2,0,0],
["B_soldier_GL_F",3,0,0],
["B_soldier_AR_F",3,0,0],
["B_medic_F",3,0,0],
["B_soldier_M_F",3,0,0],
["B_engineer_F",3,0,0],
["B_soldier_LAT_F",4,0,0],
["B_Sharpshooter_F",5,0,0],
["B_HeavyGunner_F",5,0,0],
["B_recon_F",4,0,0],
["B_recon_medic_F",4,0,0],
["B_recon_M_F",5,0,0],
["B_Recon_Sharpshooter_F",8,0,0],
["B_soldier_AA_F",5,10,0],
["B_soldier_AT_F",5,10,0],
["B_sniper_F",10,0,0],
["B_soldier_PG_F",2,0,0],
["B_crew_F",1,0,0],
["B_helipilot_F",1,0,0]
];

light_vehicles = [
["B_Quadbike_01_F",0,0,1],
["B_MRAP_01_F",0,0,2],
["B_MRAP_01_hmg_F",0,10,2],
["B_MRAP_01_gmg_F",0,20,2],
["rhsusf_m998_w_4dr",0,0,2],
["fsf_fnk_norm_ce",0,0,3],
["greuh_fnk_norm_ce",0,0,3],
["fsf_fnk_hmg_ce",0,10,3],
["greuh_fnk_hmg_ce",0,10,3],
["greuh_fnk_hmg_dsrt",0,10,3],
["B_Truck_01_transport_F",0,0,5],
["B_Truck_01_covered_F",0,0,5],
["B_UGV_01_F",0,0,5],
["B_UGV_01_rcws_F",0,50,5],
["B_Boat_Transport_01_F",0,0,2],
["B_Boat_Armed_01_minigun_F",0,30,10]
];

heavy_vehicles = [
["B_APC_Wheeled_01_cannon_F",0,30,8],
["greuh_pandur_wdld",0,50,10],
["greuh_fv510_wdld",0,40,15],
["greuh_fv510_dsrt",0,40,15],
["B_APC_Tracked_01_rcws_F",0,30,15],
["B_APC_Tracked_01_AA_F",0,40,15],
["RHS_M2A3_BUSKIII_wd",0,55,15],
["B_MBT_01_cannon_F",0,75,20],
["Steve_MBT_Kuma",0,100,25],
["B_MBT_01_TUSK_F",0,100,25],
["Burnes_FV4034_01",0,250,40],
["B_MBT_01_arty_F",0,750,30],
["B_MBT_01_mlrs_F",0,2500,100]
];

air_vehicles = [
["B_Heli_Light_01_F",0,0,10],
["B_Heli_Light_01_armed_F",0,30,10],
["greuh_aw159_t",0,0,12],
["greuh_aw159_a",0,50,12],
["B_Heli_Transport_01_F",0,20,12],
["B_Heli_Transport_03_F",0,20,15],
["JNS_Skycrane_BLU_Black",0,0,18],
["RHS_CH_47F",0,20,20],
["greuh_eh101_gr",0,0,25],
["MV22",0,0,25],
["B_Heli_Attack_01_F",0,150,30],
["RHS_AH1Z_wd_GS",0,175,30],
["H_RAH66",0,200,30],
["RHS_AH64D_wd",0,400,50],
["B_Plane_CAS_01_F",0,500,50],
["FIR_F16C",0,100,20],
["JS_JC_FA18E",0,350,40],
["JS_JC_FA18F",0,350,40],
["sab_C130_CSP",0,0,30],
["sab_C130_J",0,0,30],
["B_UAV_01_F",0,0,5],
["B_UAV_02_F",0,250,20],
["B_UAV_02_CAS_F",0,250,20],
["usaf_f22",0,500,75],
["USAF_F35A",0,600,75]
];

static_vehicles = [
["B_HMG_01_F",0,10,0],
["B_HMG_01_high_F",0,10,0],
["B_GMG_01_F",0,20,0],
["B_GMG_01_high_F",0,20,0],
["B_static_AA_F",0,25,0],
["B_static_AT_F",0,30,0],
["B_Mortar_01_F",0,50,0]
];

buildings = [
["Land_CncBarrierMedium4_F",0,0,0],
["Land_CncWall4_F",0,0,0],
["Land_CncShelter_F",0,0,0],
["Land_HBarrier_5_F",0,0,0],
["Land_HBarrierBig_F",0,0,0],
["Land_HBarrierWall6_F",0,0,0],
["Land_HBarrierWall_corner_F",0,0,0],
["Land_HBarrierTower_F",0,0,0],
["Land_BagBunker_Large_F",0,0,0],
["Land_BagBunker_Small_F",0,0,0],
["Land_BagBunker_Tower_F",0,0,0],
["Land_PortableLight_single_F",0,0,0],
["CamoNet_BLUFOR_open_F",0,0,0],
["CamoNet_BLUFOR_big_F",0,0,0],
["Land_Cargo_House_V1_F",0,0,0],
["Land_Cargo_Patrol_V1_F",0,0,0],
["Flag_NATO_F",0,0,0],
["Land_HelipadSquare_F",0,0,0],
["Land_Razorwire_F",0,0,0],
["Land_BagFence_Round_F",0,0,0],
["Land_ToolTrolley_02_F",0,0,0],
["Land_WeldingTrolley_01_F",0,0,0],
["Land_GasTank_02_F",0,0,0],
["Land_Workbench_01_F",0,0,0],
["Land_WaterTank_F",0,0,0],
["Land_WaterBarrel_F",0,0,0],
["Land_MetalCase_01_large_F",0,0,0],
["CargoNet_01_box_F",0,0,0],
["Land_CampingChair_V1_F",0,0,0],
["Land_CampingChair_V2_F",0,0,0],
["Land_CampingTable_F",0,0,0],
["MapBoard_altis_F",0,0,0],
["Land_Metal_rack_Tall_F",0,0,0],
["PortableHelipadLight_01_blue_F",0,0,0],
["Land_DieselGroundPowerUnit_01_F",0,0,0],
["Land_Pallet_MilBoxes_F",0,0,0],
["Land_PaperBox_open_full_F",0,0,0]
];

support_vehicles = [
[Arsenal_typename,10,0,0],
[Respawn_truck_typename,20,0,5],
[FOB_box_typename,30,50,0],
[FOB_truck_typename,30,50,5],
["B_APC_Tracked_01_CRV_F",0,30,10],
["C_Offroad_01_repair_F",5,0,2],
["B_Truck_01_Repair_F",10,0,5],
["B_Truck_01_fuel_F",10,0,5],
["B_Truck_01_ammo_F",10,0,5],
["B_Slingload_01_Repair_F",5,0,0],
["B_Slingload_01_Fuel_F",5,0,0],
["B_Slingload_01_Ammo_F",5,0,0],
["JNS_Skycrane_Pod_Bench_BLU_Black",5,0,0],
["JNS_Skycrane_Pod_Ammo_BLU_Black",5,0,0],
["JNS_Skycrane_Pod_Medical_BLU_Black",5,0,0],
["JNS_Skycrane_Pod_Repair_BLU_Black",5,0,0],
["JNS_Skycrane_Pod_Transport_BLU_Black",5,0,0],
["Box_NATO_AmmoVeh_F",0,154,0],
["Box_East_AmmoVeh_F",0,115,0]
];

// Pre-made squads for the commander build menu
blufor_squad_inf_light = [ "B_Soldier_SL_F","B_Soldier_TL_F","B_Soldier_GL_F","B_soldier_AR_F","B_Soldier_GL_F","B_medic_F","B_Soldier_LAT_F","B_Soldier_F","B_Soldier_F"];
blufor_squad_inf = [ "B_Soldier_SL_F","B_Soldier_TL_F","B_Soldier_AR_F","B_HeavyGunner_F","B_medic_F","B_Soldier_GL_F","B_Soldier_LAT_F","B_Soldier_LAT_F","B_soldier_M_F","B_Sharpshooter_F" ];
blufor_squad_at = [ "B_Soldier_SL_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AT_F","B_medic_F","B_soldier_F" ];
blufor_squad_aa = [ "B_Soldier_SL_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AA_F","B_medic_F","B_soldier_F" ];
blufor_squad_recon = [ "B_recon_TL_F","B_recon_F","B_recon_exp_F","B_recon_medic_F","B_recon_LAT_F","B_recon_LAT_F","B_recon_M_F","B_Recon_Sharpshooter_F","B_recon_F"];
blufor_squad_para = [ "B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F" ];

// [ squad, manpower, ammo, fuel ]
// The game doesn't calculate the actual cost of the squads when they're being bought and instead uses the costs below (especially ammo),
// but once they're spawned the cost of each individual unit will be used to calculate caps (especially manpower and fuel)
squads = [
[blufor_squad_inf_light,20,0,0],
[blufor_squad_inf,30,0,0],
[blufor_squad_at,20,25,0],
[blufor_squad_aa,20,25,0],
[blufor_squad_recon,25,0,0],
[blufor_squad_para,20,0,0]
];

// All the UAVs must be declared here, otherwise there shall be UAV controlling issues. Namely: you won't be able to control them.
uavs = [ "B_UAV_01_F","B_UAV_02_F","B_UAV_02_CAS_F","B_UGV_01_F","B_UGV_01_rcws_F" ];

// Vehicles unlocked through military base control. The game will pick which base unlocks which at the start of each new campaign.
elite_vehicles = ["B_UGV_01_rcws_F","Steve_MBT_Kuma","B_MBT_01_TUSK_F","Burnes_FV4034_01","B_MBT_01_arty_F","B_MBT_01_mlrs_F","B_Heli_Attack_01_F","RHS_AH1Z_wd_GS","H_RAH66","RHS_AH64D_wd","B_Plane_CAS_01_F","JS_JC_FA18E","JS_JC_FA18F","B_UAV_02_F","B_UAV_02_CAS_F","greuh_pandur_wdld","RHS_M2A3_BUSKIII_wd","usaf_f22","USAF_F35A"];

// Everything the AI troups should be able to resupply from
ai_resupply_sources = [ Respawn_truck_typename, huron_typename, Arsenal_typename, "B_Slingload_01_Ammo_F", "B_APC_Tracked_01_CRV_F", "B_Truck_01_ammo_F", "JNS_Skycrane_Pod_Ammo_BLU_Black" ];





// *** BADDIES ***

// Guerillas. It's only classnames the game will pick from, not the actual squad that will spawn, unlike the CSAT pre-made squads further below
militia_squad = [ "B_G_Soldier_SL_F","B_G_Soldier_A_F","B_G_Soldier_AR_F","B_G_medic_F","B_G_engineer_F","B_G_Soldier_exp_F","B_G_Soldier_GL_F","B_G_Soldier_M_F","B_G_Soldier_F","B_G_Soldier_LAT_F","B_G_Soldier_lite_F","b_g_soldier_unarmed_f","B_G_Sharpshooter_F","b_g_survivor_F","B_G_Soldier_TL_F"];

// Same principle, only an array with everything for the game to randomly choose from
militia_vehicles = [ "rhs_btr70_chdkz","rhs_zsu234_chdkz","I_MU_mercs_Offroad_01_armed_F","I_MU_mercs_Offroad_01_armed_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","LOP_AFR_BTR60","LOP_AFR_M113_W","LOP_AFR_T72BA","I_MU_mercs_Offroad_01_armed_F"];

// All the CSAT pre-made squads. This is exactly what will spawn so take care with the number of units you put in each.
opfor_squad_low_intensity = ["O_Soldier_TL_F","O_Soldier_AR_F","O_medic_F","O_Soldier_LAT_F","O_Soldier_F","O_Soldier_F","O_Soldier_lite_F","O_Soldier_lite_F"];
opfor_squad_8_standard = ["O_Soldier_SL_F","O_Soldier_TL_F","O_Soldier_AR_F","O_HeavyGunner_F","O_medic_F","O_soldier_M_F","O_Soldier_GL_F","O_Soldier_LAT_F"];
opfor_squad_8_infkillers = ["O_Soldier_SL_F","O_Soldier_AR_F","O_Soldier_AR_F","O_HeavyGunner_F","O_medic_F","O_soldier_M_F","O_Sharpshooter_F","O_sniper_F"];
opfor_squad_8_tankkillers = ["O_Soldier_SL_F","O_medic_F","O_Soldier_AR_F","O_Soldier_LAT_F","O_Soldier_LAT_F","O_Soldier_AT_F","O_Soldier_AT_F","O_Soldier_AT_F"];
opfor_squad_8_airkillers = ["O_Soldier_SL_F","O_medic_F","O_Soldier_AR_F","O_Soldier_LAT_F","O_Soldier_LAT_F","O_Soldier_AA_F","O_Soldier_AA_F","O_Soldier_AA_F"];

// Single units that are used for secondary objectives and cargo posts garrisons
opfor_sentry = "O_Soldier_lite_F";
opfor_lookout_1 = "O_Sharpshooter_F";
opfor_lookout_2 = "O_HeavyGunner_F";

// All the vehicles that can spawn as sector defenders and patrols, the game will pick randomly
opfor_vehicles = ["O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MBT_02_cannon_F","O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_MRAP_02_hmg_F"];
// Same, with lighter choices to be used  when the alert level is low
opfor_vehicles_low_intensity = ["O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MRAP_02_hmg_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F"];

// All the vehicles that can spawn as battlegroup members, again the game will pick randomly
opfor_battlegroup_vehicles = ["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_Truck_03_covered_F","O_MBT_02_cannon_F","O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F","O_Heli_Attack_02_F","O_Heli_Light_02_F","O_Heli_Transport_04_bench_F", "O_Truck_03_transport_F"];
// Same, with lighter choices to be used  when the alert level is low
opfor_battlegroup_vehicles_low_intensity = ["O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MRAP_02_hmg_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_Truck_03_covered_F","O_Heli_Transport_04_bench_F", "O_Truck_03_transport_F"];

// All the vehicles that can spawn as battlegroup members (see above) and hold 8 soldiers as passengers.
// If something can't hold all 8 soldiers then buggy behaviours may occur
opfor_troup_transports = ["O_APC_Wheeled_02_rcws_F","O_Truck_03_covered_F","O_Heli_Transport_04_bench_F", "O_Truck_03_transport_F", "O_Heli_Light_02_F"];

// Battlegroup members that will need to spawn in flight. Should be only helos but, who knows
opfor_choppers = ["O_Heli_Attack_02_F","O_Heli_Light_02_F","O_Heli_Transport_04_bench_F"];

// Opfor attack aircrafts to choose from
opfor_air = ["O_Plane_CAS_02_F"];







// Civilians to randomly choose from
civilians = ["C_man_1","C_man_polo_6_F","C_man_polo_3_F","C_man_polo_2_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_1_F","C_man_p_beggar_F","C_man_1_2_F","C_man_p_fugitive_F","C_man_hunter_1_F","C_journalist_F","C_man_shorts_2_F","C_man_w_worker_F"];
civilian_vehicles = [ "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_SUV_01_F", "C_Van_01_transport_F", "C_Van_01_box_F", "C_Van_01_fuel_F" ];

// Blacklisted arsenal items such as deployable weapons  that should be bought instead
GRLIB_blacklisted_from_arsenal = [
"B_Respawn_Sleeping_bag_blue_F",
"B_Respawn_Sleeping_bag_brown_F",
"B_Respawn_TentDome_F",
"B_Respawn_Sleeping_bag_F",
"B_Respawn_TentA_F",
"I_GMG_01_A_weapon_F",
"O_GMG_01_A_weapon_F",
"B_GMG_01_A_weapon_F",
"I_HMG_01_A_weapon_F",
"B_HMG_01_A_weapon_F",
"O_HMG_01_A_weapon_F",
"O_HMG_01_weapon_F",
"B_HMG_01_weapon_F",
"I_HMG_01_weapon_F",
"I_HMG_01_high_weapon_F",
"O_HMG_01_high_weapon_F",
"B_HMG_01_high_weapon_F",
"O_GMG_01_weapon_F",
"I_GMG_01_weapon_F",
"B_GMG_01_weapon_F",
"B_GMG_01_high_weapon_F",
"I_GMG_01_high_weapon_F",
"O_GMG_01_high_weapon_F",
"I_Mortar_01_support_F",
"B_Mortar_01_support_F",
"O_Mortar_01_support_F",
"B_Mortar_01_weapon_F",
"O_Mortar_01_weapon_F",
"I_Mortar_01_weapon_F",
"B_HMG_01_support_F",
"O_HMG_01_support_F",
"I_HMG_01_support_F",
"B_HMG_01_support_high_F",
"O_HMG_01_support_high_F",
"I_HMG_01_support_high_F",
"RHS_M2_Gun_Bag",
"RHS_M2_Tripod_Bag",
"RHS_M2_MiniTripod_Bag",
"RHS_Mk19_Gun_Bag",
"RHS_Mk19_Tripod_Bag",
"RHS_NSV_Gun_Bag",
"RHS_NSV_Tripod_Bag",
"B_AA_01_weapon_F",
"O_AA_01_weapon_F",
"I_AA_01_weapon_F",
"B_AT_01_weapon_F",
"O_AT_01_weapon_F",
"I_AT_01_weapon_F",
"I_UAV_01_backpack_F",
"B_UAV_01_backpack_F",
"O_UAV_01_backpack_F"
];






// !!
// Do not edit below this point!!
// Only boring technical stuff
// !!






infantry_units = [ infantry_units ] call F_filterMods;
light_vehicles = [ light_vehicles ] call F_filterMods;
heavy_vehicles = [ heavy_vehicles ] call F_filterMods;
air_vehicles = [ air_vehicles ] call F_filterMods;
support_vehicles = [ support_vehicles ] call F_filterMods;
static_vehicles = [ static_vehicles ] call F_filterMods;
buildings = [ buildings ] call F_filterMods;
build_lists = [[],infantry_units,light_vehicles,heavy_vehicles,air_vehicles,static_vehicles,buildings,support_vehicles,squads];
militia_squad = [ militia_squad , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
militia_vehicles = [ militia_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_squad_low_intensity = [ opfor_squad_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_squad_8_standard = [ opfor_squad_8_standard , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_squad_8_infkillers = [ opfor_squad_8_infkillers , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_squad_8_tankkillers = [ opfor_squad_8_tankkillers , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_squad_8_airkillers = [ opfor_squad_8_airkillers , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_vehicles = [ opfor_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_vehicles_low_intensity = [ opfor_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles = [ opfor_battlegroup_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_battlegroup_vehicles_low_intensity = [ opfor_battlegroup_vehicles_low_intensity , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_troup_transports = [ opfor_troup_transports , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_choppers = [ opfor_choppers , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
opfor_air = [ opfor_air , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilians = [ civilians , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
civilian_vehicles = [ civilian_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
military_alphabet = ["Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu", "Alpha-2", "Bravo-2", "Charlie-2", "Delta-2", "Echo-2", "Foxtrot-2", "Golf-2","Hotel-2","India-2","Juliet-2","Kilo-2","Lima-2","Mike-2","November-2","Oscar-2","Papa-2","Quebec-2","Romeo-2","Sierra-2","Tango-2","Uniform-2","Victor-2","Whiskey-2","X-Ray-2","Yankee-2","Zulu-2","You should really reconsider a few life choices if you build more than 52 FOBs."];
land_vehicles_classnames = (opfor_vehicles + militia_vehicles);
all_ofpor_troops = opfor_squad_low_intensity + opfor_squad_8_standard + opfor_squad_8_infkillers + opfor_squad_8_tankkillers + opfor_squad_8_airkillers + [opfor_sentry, opfor_lookout_1, opfor_lookout_2 ];
all_resistance_troops = militia_squad;
all_hostile_classnames = (land_vehicles_classnames + opfor_air + opfor_choppers + opfor_troup_transports + opfor_vehicles_low_intensity);
{ land_vehicles_classnames pushback (_x select 0); } foreach (heavy_vehicles + light_vehicles);
air_vehicles_classnames = opfor_choppers;
{ air_vehicles_classnames pushback (_x select 0); } foreach air_vehicles;
markers_reset = [99999,99999,0];
squads_names = [ localize "STR_LIGHT_RIFLE_SQUAD", localize "STR_RIFLE_SQUAD", localize "STR_AT_SQUAD", localize "STR_AA_SQUAD",  localize "STR_RECON_SQUAD", localize "STR_PARA_SQUAD" ];
boats_names = [ "B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F" ];
box_transport_config = [
	[ "B_Truck_01_transport_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "B_Truck_01_covered_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "O_Truck_03_transport_F", -6.5, [0,	-0.8,	0.4], [0,	-2.4,	0.4], [0,	-4.0,	0.4] ],
	[ "B_Heli_Transport_03_F", -7.5, [0,	2.2,	-1], [0,	0.8,	-1], [0,	-1.0, -1] ],
	[ "B_Heli_Transport_03_unarmed_F", -7.5, [0,	2.2,	-1], [0,	0.8,	-1], [0,	-1.0, -1] ],
	[ "greuh_eh101_gr", -6.5, [0,	4.2,	-1.45], [0,	2.5,	-1.45], [0,	0.8, -1.45], [0,	-0.9, -1.45] ]
];
ammobox_transports_typenames = [];
{ ammobox_transports_typenames pushback (_x select 0) } foreach box_transport_config;
ammobox_transports_typenames = [ ammobox_transports_typenames , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
elite_vehicles = [ elite_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
original_resistance = [ "B_G_Soldier_SL_F","B_G_Soldier_A_F","B_G_Soldier_AR_F","B_G_medic_F","B_G_engineer_F","B_G_Soldier_exp_F","B_G_Soldier_GL_F","B_G_Soldier_M_F","B_G_Soldier_F","B_G_Soldier_LAT_F","B_G_Soldier_lite_F","b_g_soldier_unarmed_f","B_G_Sharpshooter_F","b_g_survivor_F","B_G_Soldier_TL_F"];
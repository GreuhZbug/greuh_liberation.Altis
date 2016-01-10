
// For this entire file: classnames that come from mods you don't have will be filtered out and won't cause any issues. You just won't see them ingame.





// *** SUPPORT STUFF ***

// Each of these should be unique, the same classnames for different purposes may cause various unpredictable issues with player actions. Or not. Just don't try.
if ( isNil "FOB_typename" ) then { FOB_typename = "Land_Cargo_HQ_V1_F"; };
if ( isNil "FOB_box_typename" ) then { FOB_box_typename = "B_Slingload_01_Cargo_F"; };
if ( isNil "FOB_truck_typename" ) then { FOB_truck_typename = "B_Truck_01_box_F"; };
if ( isNil "Arsenal_typename" ) then { Arsenal_typename = "B_supplyCrate_F"; };
if ( isNil "Respawn_truck_typename" ) then { Respawn_truck_typename = "B_Truck_01_medical_F"; };
if ( isNil "huron_typename" ) then { huron_typename = "B_Heli_Transport_03_unarmed_F"; };
if ( isNil "ammobox_b_typename" ) then { ammobox_b_typename = "Box_NATO_AmmoVeh_F"; };
if ( isNil "ammobox_o_typename" ) then { ammobox_o_typename = "Box_East_AmmoVeh_F"; };
if ( isNil "opfor_ammobox_transport" ) then { opfor_ammobox_transport = "O_Truck_03_transport_F"; };  // Make sure this thing can transport ammo boxes (see box_transport_config down below) otherwise thins will break






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
["B_Truck_01_transport_F",0,0,5],
["B_Truck_01_covered_F",0,0,5],
["B_UGV_01_F",0,0,5],
["B_UGV_01_rcws_F",0,50,5],
["B_Boat_Transport_01_F",0,0,2],
["B_Boat_Armed_01_minigun_F",0,30,10]
];

heavy_vehicles = [
["B_APC_Wheeled_01_cannon_F",0,30,8],
["B_APC_Tracked_01_rcws_F",0,30,15],
["B_APC_Tracked_01_AA_F",0,40,15],
["B_MBT_01_cannon_F",0,75,20],
["B_MBT_01_TUSK_F",0,100,25],
["B_MBT_01_arty_F",0,750,30],
["B_MBT_01_mlrs_F",0,2500,100]
];

air_vehicles = [
["B_Heli_Light_01_F",0,0,10],
["B_Heli_Light_01_armed_F",0,30,10],
["B_Heli_Transport_01_F",0,20,12],
["B_Heli_Transport_03_F",0,20,15],
["B_Heli_Attack_01_F",0,150,30],
["B_Plane_CAS_01_F",0,500,50],
["B_UAV_01_F",0,0,5],
["B_UAV_02_F",0,250,20],
["B_UAV_02_CAS_F",0,250,20]
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
["Land_PaperBox_open_full_F",0,0,0],
["Land_ClutterCutter_large_F",0,0,0]
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
elite_vehicles = ["B_UGV_01_rcws_F","B_MBT_01_TUSK_F","B_MBT_01_arty_F","B_MBT_01_mlrs_F","B_Heli_Attack_01_F","B_Plane_CAS_01_F","B_UAV_02_F","B_UAV_02_CAS_F"];

// Everything the AI troups should be able to resupply from
ai_resupply_sources = [ Respawn_truck_typename, huron_typename, Arsenal_typename, "B_Slingload_01_Ammo_F", "B_APC_Tracked_01_CRV_F", "B_Truck_01_ammo_F", "JNS_Skycrane_Pod_Ammo_BLU_Black" ];

// Everything that can resupply other vehicles
vehicle_repair_sources = [ "B_APC_Tracked_01_CRV_F", "C_Offroad_01_repair_F", "B_Truck_01_Repair_F", "B_Slingload_01_Repair_F", "JNS_Skycrane_Pod_Repair_BLU_Black" ];
vehicle_rearm_sources = [ "B_APC_Tracked_01_CRV_F", "B_Truck_01_ammo_F", "B_Slingload_01_Ammo_F", "JNS_Skycrane_Pod_Ammo_BLU_Black" ];
vehicle_refuel_sources = [ "B_APC_Tracked_01_CRV_F", "B_Truck_01_fuel_F", "B_Slingload_01_Fuel_F" ];

// Commander
commander_classname = "B_officer_F";

// Standard crewman to use when default crew won't work (saved AAF vehicles for example)
crewman_classname = "B_crew_F";







// *** BADDIES ***

// All OPFOR infantry
opfor_sentry = "O_Soldier_lite_F";
opfor_rifleman = "O_Soldier_F";
opfor_grenadier = "O_Soldier_GL_F";
opfor_squad_leader = "O_Soldier_SL_F";
opfor_team_leader = "O_Soldier_TL_F";
opfor_marksman = "O_soldier_M_F";
opfor_machinegunner = "O_Soldier_AR_F";
opfor_heavygunner = "O_HeavyGunner_F";
opfor_medic = "O_medic_F";
opfor_rpg = "O_Soldier_LAT_F";
opfor_at = "O_Soldier_AT_F";
opfor_aa = "O_Soldier_AA_F";
opfor_officer = "O_officer_F";
opfor_sharpshooter = "O_Sharpshooter_F";
opfor_sniper = "O_sniper_F";
opfor_engineer = "O_engineer_F";

// Militia infantry. It's only classnames the game will pick from randomly
militia_squad = [ "B_G_Soldier_SL_F","B_G_Soldier_A_F","B_G_Soldier_AR_F","B_G_medic_F","B_G_engineer_F","B_G_Soldier_exp_F","B_G_Soldier_GL_F","B_G_Soldier_M_F","B_G_Soldier_F","B_G_Soldier_LAT_F","B_G_Soldier_lite_F","b_g_soldier_unarmed_f","B_G_Sharpshooter_F","b_g_survivor_F","B_G_Soldier_TL_F"];

// Militia vehicles to choose from
militia_vehicles = [ "rhs_btr70_chdkz","rhs_zsu234_chdkz","I_MU_mercs_Offroad_01_armed_F","I_MU_mercs_Offroad_01_armed_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","LOP_AFR_BTR60","LOP_AFR_M113_W","LOP_AFR_T72BA","I_MU_mercs_Offroad_01_armed_F"];

// All the vehicles that can spawn as sector defenders and patrols
opfor_vehicles = ["O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MBT_02_cannon_F","O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_MRAP_02_hmg_F"];
// Same with lighter choices to be used  when the alert level is low
opfor_vehicles_low_intensity = ["O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MRAP_02_hmg_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F"];

// All the vehicles that can spawn as battlegroup members
opfor_battlegroup_vehicles = ["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_Truck_03_covered_F","O_MBT_02_cannon_F","O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F","O_Heli_Attack_02_F","O_Heli_Light_02_F","O_Heli_Transport_04_bench_F", "O_Truck_03_transport_F"];
// Same with lighter choices to be used  when the alert level is low
opfor_battlegroup_vehicles_low_intensity = ["O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MRAP_02_hmg_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F","O_Truck_03_covered_F","O_Heli_Transport_04_bench_F", "O_Truck_03_transport_F"];

// All the vehicles that can spawn as battlegroup members (see above) and hold 8 soldiers as passengers.
// If something can't hold all 8 soldiers then buggy behaviours may occur
opfor_troup_transports = ["O_APC_Wheeled_02_rcws_F","O_Truck_03_covered_F","O_Heli_Transport_04_bench_F", "O_Truck_03_transport_F", "O_Heli_Light_02_F"];

// Battlegroup members that will need to spawn in flight. Should be only helos but, who knows
opfor_choppers = ["O_Heli_Attack_02_F","O_Heli_Light_02_F","O_Heli_Transport_04_bench_F"];

// Opfor attack aircrafts to choose from
opfor_air = ["O_Plane_CAS_02_F"];

// Vehicles to be used in secondary objectives
opfor_mrap = "O_MRAP_02_F";
opfor_mrap_armed = "O_MRAP_02_gmg_F";
opfor_transport_helo = "O_Heli_Transport_04_bench_F";
opfor_transport_truck = "O_Truck_03_covered_F";
opfor_fuel_truck = "O_Truck_03_fuel_F";
opfor_ammo_truck = "O_Truck_03_ammo_F";
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";
opfor_flag = "Flag_CSAT_F";







// Civilians to randomly choose from
civilians = ["C_man_1","C_man_polo_6_F","C_man_polo_3_F","C_man_polo_2_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_1_F","C_man_p_beggar_F","C_man_1_2_F","C_man_p_fugitive_F","C_man_hunter_1_F","C_journalist_F","C_man_shorts_2_F","C_man_w_worker_F"];
civilian_vehicles = [ "C_Hatchback_01_F", "C_Hatchback_01_sport_F", "C_Offroad_01_F", "C_SUV_01_F", "C_Van_01_transport_F", "C_Van_01_box_F", "C_Van_01_fuel_F", "C_Quadbike_01_F" ];

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
"B_AA_01_weapon_F",
"O_AA_01_weapon_F",
"I_AA_01_weapon_F",
"B_AT_01_weapon_F",
"O_AT_01_weapon_F",
"I_AT_01_weapon_F",
"I_UAV_01_backpack_F",
"B_UAV_01_backpack_F",
"O_UAV_01_backpack_F",
"RHS_Podnos_Bipod_Bag",
"RHS_Podnos_Gun_Bag",
"RHS_Metis_Gun_Bag",
"RHS_Metis_Tripod_Bag",
"RHS_AGS30_Tripod_Bag",
"RHS_AGS30_Gun_Bag",
"RHS_DShkM_Gun_Bag",
"RHS_DShkM_TripodHigh_Bag",
"RHS_DShkM_TripodLow_Bag",
"RHS_Kord_Tripod_Bag",
"RHS_Kord_Gun_Bag",
"RHS_M2_Gun_Bag",
"RHS_M2_Tripod_Bag",
"rhs_M252_Gun_Bag",
"rhs_M252_Bipod_Bag",
"RHS_M2_MiniTripod_Bag",
"RHS_Mk19_Gun_Bag",
"RHS_Mk19_Tripod_Bag",
"RHS_NSV_Tripod_Bag",
"RHS_NSV_Gun_Bag",
"RHS_SPG9_Gun_Bag",
"RHS_SPG9_Tripod_Bag",
"rhs_Tow_Gun_Bag",
"rhs_TOW_Tripod_Bag"
];

// Configuration for ammo boxes transport
// First entry: classname
// Second entry: how far behind the vehicle the boxes should be unloaded
// Following entries: attachTo position for each box, the number of boxes that can be loaded is derived from the number of entries
box_transport_config = [
	[ "B_Truck_01_transport_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "B_Truck_01_covered_F", -6.5, [0,	-0.4,	0.4], [0,	-2.1,	0.4], [0,	-3.8,	0.4] ],
	[ "O_Truck_03_transport_F", -6.5, [0,	-0.8,	0.4], [0,	-2.4,	0.4], [0,	-4.0,	0.4] ],
	[ "O_Truck_03_covered_F", -6.5, [0,	-0.8,	0.4], [0,	-2.4,	0.4], [0,	-4.0,	0.4] ],
	[ "B_Heli_Transport_03_F", -7.5, [0,	2.2,	-1], [0,	0.8,	-1], [0,	-1.0, -1] ],
	[ "B_Heli_Transport_03_unarmed_F", -7.5, [0,	2.2,	-1], [0,	0.8,	-1], [0,	-1.0, -1] ],
	[ "greuh_eh101_gr", -6.5, [0,	4.2,	-1.45], [0,	2.5,	-1.45], [0,	0.8, -1.45], [0,	-0.9, -1.45] ],
	[ "I_Heli_Transport_02_F", -6.5, [0,	4.2,	-1.45], [0,	2.5,	-1.45], [0,	0.8, -1.45], [0,	-0.9, -1.45] ]
];




// !!
// Do not edit below this point!!
// Only boring technical stuff
// !!






elite_vehicles = elite_vehicles + elite_vehicles_extension;
infantry_units = infantry_units + infantry_units_extension;
light_vehicles = light_vehicles + light_vehicles_extension;
heavy_vehicles = heavy_vehicles + heavy_vehicles_extension;
air_vehicles = air_vehicles + air_vehicles_extension;
static_vehicles = static_vehicles + static_vehicles_extension;
buildings = buildings + buildings_extension;
support_vehicles = support_vehicles + support_vehicles_extension;
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
opfor_squad_low_intensity = [opfor_team_leader,opfor_machinegunner,opfor_medic,opfor_rpg,opfor_sentry,opfor_sentry,opfor_sentry,opfor_sentry];
opfor_squad_8_standard = [opfor_squad_leader,opfor_team_leader,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_marksman,opfor_grenadier,opfor_rpg];
opfor_squad_8_infkillers = [opfor_squad_leader,opfor_machinegunner,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_marksman,opfor_sharpshooter,opfor_sniper];
opfor_squad_8_tankkillers = [opfor_squad_leader,opfor_medic,opfor_machinegunner,opfor_rpg,opfor_rpg,opfor_at,opfor_at,opfor_at];
opfor_squad_8_airkillers = [opfor_squad_leader,opfor_medic,opfor_machinegunner,opfor_rpg,opfor_rpg,opfor_aa,opfor_aa,opfor_aa];
all_resistance_troops = [] + militia_squad;
all_hostile_classnames = (land_vehicles_classnames + opfor_air + opfor_choppers + opfor_troup_transports + opfor_vehicles_low_intensity);
{ land_vehicles_classnames pushback (_x select 0); } foreach (heavy_vehicles + light_vehicles);
air_vehicles_classnames = [] + opfor_choppers;
{ air_vehicles_classnames pushback (_x select 0); } foreach air_vehicles;
markers_reset = [99999,99999,0];
zeropos = [0,0,0];
squads_names = [ localize "STR_LIGHT_RIFLE_SQUAD", localize "STR_RIFLE_SQUAD", localize "STR_AT_SQUAD", localize "STR_AA_SQUAD",  localize "STR_RECON_SQUAD", localize "STR_PARA_SQUAD" ];
boats_names = [ "B_Boat_Transport_01_F", "B_Boat_Armed_01_minigun_F" ];
ammobox_transports_typenames = [];
{ ammobox_transports_typenames pushback (_x select 0) } foreach box_transport_config;
ammobox_transports_typenames = [ ammobox_transports_typenames , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
elite_vehicles = [ elite_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;
original_resistance = [ "B_G_Soldier_SL_F","B_G_Soldier_A_F","B_G_Soldier_AR_F","B_G_medic_F","B_G_engineer_F","B_G_Soldier_exp_F","B_G_Soldier_GL_F","B_G_Soldier_M_F","B_G_Soldier_F","B_G_Soldier_LAT_F","B_G_Soldier_lite_F","b_g_soldier_unarmed_f","B_G_Sharpshooter_F","b_g_survivor_F","B_G_Soldier_TL_F"];
opfor_infantry = [opfor_sentry,opfor_rifleman,opfor_grenadier,opfor_squad_leader,opfor_team_leader,opfor_marksman,opfor_machinegunner,opfor_heavygunner,opfor_medic,opfor_rpg,opfor_at,opfor_aa,opfor_officer,opfor_sharpshooter,opfor_sniper,opfor_engineer];
GRLIB_intel_table = "Land_CampingTable_small_F";
GRLIB_intel_chair = "Land_CampingChair_V2_F";
GRLIB_intel_file = "Land_File1_F";
GRLIB_intel_laptop = "Land_Laptop_device_F";
GRLIB_ignore_colisions_when_building = [
	"Land_Flush_Light_red_F",
	"Land_Flush_Light_green_F",
	"Land_Flush_Light_yellow_F",
	"Land_runway_edgelight",
	"Land_runway_edgelight_blue_F",
	"Land_HelipadSquare_F",
	"Sign_Sphere100cm_F",
	"TMR_Autorest_Georef",
	"Land_ClutterCutter_large_F"
];
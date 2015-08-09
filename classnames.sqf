

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
infantry_units = [ infantry_units ] call F_filterMods;

light_vehicles = [
["B_Quadbike_01_F",0,0,1],
["B_MRAP_01_F",0,0,2],
["B_MRAP_01_hmg_F",0,10,2],
["B_MRAP_01_gmg_F",0,20,2],
["rhsusf_m998_w_4dr",0,0,2],
["fsf_fnk_norm_ce",0,0,3],
["fsf_fnk_hmg_ce",0,10,3],
["B_Truck_01_transport_F",0,0,5],
["B_Truck_01_covered_F",0,0,5],
["B_UGV_01_F",0,0,5],
["B_UGV_01_rcws_F",0,50,5]
];
light_vehicles = [ light_vehicles ] call F_filterMods;

heavy_vehicles = [
["B_APC_Wheeled_01_cannon_F",0,30,7],
["greuh_pandur_wdld",0,50,8],
["greuh_fv510_wdld",0,40,10],
["greuh_fv510_dsrt",0,40,10],
["B_APC_Tracked_01_rcws_F",0,30,10],
["B_APC_Tracked_01_AA_F",0,40,10],
["RHS_M2A3_BUSKIII_wd",0,55,10],
["B_MBT_01_cannon_F",0,60,15],
["Steve_MBT_Kuma",0,75,20],
["B_MBT_01_TUSK_F",0,100,20],
["Burnes_FV4034_01",0,150,30],
["B_MBT_01_arty_F",0,300,25],
["B_MBT_01_mlrs_F",0,500,30]
];
heavy_vehicles = [ heavy_vehicles ] call F_filterMods;

air_vehicles = [
["B_Heli_Light_01_F",0,0,10],
["B_Heli_Light_01_armed_F",0,30,10],
["greuh_aw159_a",0,50,12],
["B_Heli_Transport_01_F",0,20,12],
["B_Heli_Transport_03_F",0,20,15],
["greuh_eh101_gr",0,0,20],
["MV22",0,0,25],
["B_Heli_Attack_01_F",0,100,20],
["H_RAH66",0,150,25],
["LLW_Apache_RNLAF",0,300,30],
["RHS_AH64D_wd",0,300,30],
["B_Plane_CAS_01_F",0,400,50],
["FIR_F16C",0,100,20],
["JS_JC_FA18E",0,300,40],
["JS_JC_FA18F",0,300,40],
["sab_C130_CSP",0,0,30],
["sab_C130_J",0,0,30],
["B_UAV_01_F",0,0,5],
["B_UAV_02_F",0,200,20],
["B_UAV_02_CAS_F",0,200,20]
];
air_vehicles = [ air_vehicles ] call F_filterMods;

static_vehicles = [
["B_HMG_01_F",0,10,0],
["B_HMG_01_high_F",0,10,0],
["B_GMG_01_F",0,20,0],
["B_GMG_01_high_F",0,20,0],
["B_static_AA_F",0,25,0],
["B_static_AT_F",0,30,0]
];
static_vehicles = [ static_vehicles ] call F_filterMods;

buildings = [
["Land_CncBarrierMedium4_F",0,0,0],
["Land_CncWall4_F",0,0,0],
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
["Land_HelipadSquare_F",0,0,0]
];
buildings = [ buildings ] call F_filterMods;

support_vehicles = [
["B_supplyCrate_F",2,0,0],
["B_Slingload_01_Cargo_F",30,50,0],
["B_Truck_01_box_F",30,50,5],
["B_Truck_01_medical_F",20,0,5],
["B_Truck_01_Repair_F",10,0,5],
["B_Truck_01_fuel_F",10,0,5],
["B_Truck_01_ammo_F",10,0,5],
["B_Slingload_01_Repair_F",5,0,0],
["B_Slingload_01_Fuel_F",5,0,0],
["B_Slingload_01_Ammo_F",5,0,0],
["C_Offroad_01_repair_F",5,0,2],
["B_APC_Tracked_01_CRV_F",0,30,10]
];
support_vehicles = [ support_vehicles ] call F_filterMods;

blufor_squad_inf_light = [ "B_Soldier_SL_F","B_Soldier_TL_F","B_Soldier_GL_F","B_soldier_AR_F","B_Soldier_GL_F","B_medic_F","B_Soldier_LAT_F","B_Soldier_F","B_Soldier_F"];
blufor_squad_inf = [ "B_Soldier_SL_F","B_Soldier_TL_F","B_Soldier_AR_F","B_HeavyGunner_F","B_medic_F","B_Soldier_GL_F","B_Soldier_LAT_F","B_Soldier_LAT_F","B_soldier_M_F","B_Sharpshooter_F" ];
blufor_squad_at = [ "B_Soldier_SL_F","B_soldier_AT_F","B_soldier_AT_F","B_soldier_AT_F","B_medic_F","B_soldier_F" ];
blufor_squad_aa = [ "B_Soldier_SL_F","B_soldier_AA_F","B_soldier_AA_F","B_soldier_AA_F","B_medic_F","B_soldier_F" ];
blufor_squad_recon = [ "B_recon_TL_F","B_recon_F","B_recon_exp_F","B_recon_medic_F","B_recon_LAT_F","B_recon_LAT_F","B_recon_M_F","B_Recon_Sharpshooter_F","B_recon_F"];
blufor_squad_para = [ "B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F","B_soldier_PG_F" ];

squads = [
[blufor_squad_inf_light,20,0,0],
[blufor_squad_inf,30,0,0],
[blufor_squad_at,20,25,0],
[blufor_squad_aa,20,25,0],
[blufor_squad_recon,25,0,0],
[blufor_squad_para,20,0,0]
];
squads_names = [ localize "STR_LIGHT_RIFLE_SQUAD", localize "STR_RIFLE_SQUAD", localize "STR_AT_SQUAD", localize "STR_AA_SQUAD",  localize "STR_RECON_SQUAD", localize "STR_PARA_SQUAD" ];

uavs = [ "B_UAV_01_F","B_UAV_02_F","B_UAV_02_CAS_F","B_UGV_01_F","B_UGV_01_rcws_F" ];

build_lists = [[],infantry_units,light_vehicles,heavy_vehicles,air_vehicles,static_vehicles,buildings,support_vehicles,squads];

FOB_typename = "Land_Cargo_HQ_V1_F";
FOB_box_typename = "B_Slingload_01_Cargo_F";
FOB_truck_typename = "B_Truck_01_box_F";
Arsenal_typename = "B_supplyCrate_F";
Respawn_truck_typename = "B_Truck_01_medical_F";
huron_typename = "B_Heli_Transport_03_unarmed_F";

opfor_basic_soldier = "O_Soldier_F";
opfor_sentry = "O_Soldier_lite_F";

militia_squad = [ "B_G_Soldier_SL_F","B_G_Soldier_A_F","B_G_Soldier_AR_F","B_G_medic_F","B_G_engineer_F","B_G_Soldier_exp_F","B_G_Soldier_GL_F","B_G_Soldier_M_F","B_G_Soldier_F","B_G_Soldier_LAT_F","B_G_Soldier_lite_F","b_g_soldier_unarmed_f","B_G_Sharpshooter_F","b_g_survivor_F","B_G_Soldier_TL_F"];

opfor_squad_low_intensity = ["O_Soldier_TL_F","O_Soldier_AR_F","O_medic_F","O_Soldier_LAT_F","O_Soldier_F","O_Soldier_F","O_Soldier_lite_F","O_Soldier_lite_F"];
opfor_squad_8_standard = ["O_Soldier_SL_F","O_Soldier_TL_F","O_Soldier_AR_F","O_HeavyGunner_F","O_medic_F","O_soldier_M_F","O_Soldier_GL_F","O_Soldier_LAT_F"];
opfor_squad_8_infkillers = ["O_Soldier_SL_F","O_Soldier_AR_F","O_Soldier_AR_F","O_HeavyGunner_F","O_medic_F","O_soldier_M_F","O_Sharpshooter_F","O_sniper_F"];
opfor_squad_8_tankkillers = ["O_Soldier_SL_F","O_medic_F","O_Soldier_AR_F","O_Soldier_LAT_F","O_Soldier_LAT_F","O_Soldier_AT_F","O_Soldier_AT_F","O_Soldier_AT_F"];
opfor_squad_8_airkillers = ["O_Soldier_SL_F","O_medic_F","O_Soldier_AR_F","O_Soldier_LAT_F","O_Soldier_LAT_F","O_Soldier_AA_F","O_Soldier_AA_F","O_Soldier_AA_F"];

militia_vehicles = [ "rhs_btr70_chdkz","rhs_zsu234_chdkz","I_MU_mercs_Offroad_01_armed_F","I_MU_mercs_Offroad_01_armed_F","B_G_Offroad_01_armed_F","B_G_Offroad_01_armed_F","LOP_AFR_BTR60","LOP_AFR_M113_W","LOP_AFR_T72BA","I_MU_mercs_Offroad_01_armed_F"];
militia_vehicles = [ militia_vehicles , { [ _x ] call F_checkClass } ]  call BIS_fnc_conditionalSelect;

opfor_vehicles = ["O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MBT_02_cannon_F","O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F","O_MRAP_02_gmg_F","O_MRAP_02_hmg_F","O_MRAP_02_hmg_F"];
opfor_vehicles_low_intensity = ["O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MRAP_02_hmg_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F"];
civilians = ["C_man_1","C_man_polo_6_F","C_man_polo_3_F","C_man_polo_2_F","C_man_polo_4_F","C_man_polo_5_F","C_man_polo_1_F","C_man_p_beggar_F","C_man_1_2_F","C_man_p_fugitive_F","C_man_hunter_1_F","C_journalist_F","C_man_shorts_2_F","C_man_w_worker_F"];

opfor_battlegroup_infantry = [["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F"],["O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_cannon_F"],["O_APC_Wheeled_02_rcws_F","O_APC_Wheeled_02_rcws_F","O_Truck_03_covered_F"],["O_Heli_Light_02_F"]];
opfor_battlegroup_armor = [["O_MRAP_02_hmg_F"],["O_MBT_02_cannon_F","O_MBT_02_cannon_F","O_MBT_02_cannon_F","O_APC_Tracked_02_AA_F"],["O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_cannon_F"]];
opfor_battlegroup_air = [["O_Heli_Attack_02_F","O_Heli_Attack_02_F"],["O_Heli_Light_02_F"],["O_Heli_Transport_04_covered_F","O_Heli_Transport_04_covered_F"]];
opfor_battlegroup_mixed = [["O_Heli_Attack_02_F","O_Heli_Light_02_F"],["O_MRAP_02_hmg_F","O_MRAP_02_gmg_F"],["O_Heli_Transport_04_covered_F","O_APC_Wheeled_02_rcws_F"],["O_MBT_02_cannon_F","O_APC_Tracked_02_cannon_F","O_APC_Tracked_02_AA_F"]];

opfor_troup_transports = ["O_APC_Wheeled_02_rcws_F","O_Truck_03_covered_F","O_Heli_Transport_04_covered_F"];
opfor_air = ["O_Plane_CAS_02_F"];
opfor_choppers = ["O_Heli_Attack_02_F","O_Heli_Light_02_F","O_Heli_Transport_04_covered_F"];

military_alphabet = ["Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","India","Juliet","Kilo","Lima","Mike","November","Oscar","Papa","Quebec","Romeo","Sierra","Tango","Uniform","Victor","Whiskey","X-Ray","Yankee","Zulu"];

land_vehicles_classnames = (opfor_vehicles + militia_vehicles);
all_hostile_classnames = (land_vehicles_classnames + opfor_air + opfor_choppers + opfor_troup_transports + opfor_vehicles_low_intensity);
{
	land_vehicles_classnames pushback (_x select 0);
} foreach (heavy_vehicles + light_vehicles);

air_vehicles_classnames = opfor_choppers;
{
	air_vehicles_classnames pushback (_x select 0);
} foreach air_vehicles;

sector_size = 1000;
capture_size = 250;
radiotower_size = 2500;
recycling_percentage = 0.65;
markers_reset = [99999,99999,0];
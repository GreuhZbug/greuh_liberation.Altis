_unit = _this select 0;

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

sleep 0.5;

_unit addVest "V_Chestrig_oli";
_unit addItemToVest "FirstAidKit";
for "_i" from 1 to 2 do {_unit addItemToVest "MiniGrenade";};
for "_i" from 1 to 2 do {_unit addItemToVest "16Rnd_9x21_Mag";};
for "_i" from 1 to 6 do {_unit addItemToVest "rhs_30Rnd_545x39_AK";};
_unit addHeadgear "H_Cap_blk";
_unit addGoggles "G_Balaclava_oli";

_unit addWeapon "rhs_weap_ak74m_camo_npz";
_unit addPrimaryWeaponItem "optic_ACO_grn";
_unit addWeapon "hgun_P07_F";
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
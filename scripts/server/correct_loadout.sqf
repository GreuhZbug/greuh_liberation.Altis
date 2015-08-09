_soldier = _this select 0;
_soldier unlinkItem "NVGoggles_INDEP";
removeHeadgear _soldier;
_soldier addHeadgear "H_shemag_olive";
removeAllPrimaryWeaponItems _soldier;
if ((random 100) < 66) then { _soldier addPrimaryWeaponItem "acc_flashlight"; };
exit;
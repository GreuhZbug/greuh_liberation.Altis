class RscTitles
{
   class intro1
   {
      name = "intro1";
      duration = 4;
      idd = -1;
      movingEnable = false;
      controls[]=
      {
         GenericLabelShadow, GenericLabel2
      };
	  class GenericLabel2 {
		idc = -1;
		type =  CT_STATIC ; 
		style = ST_CENTER;  
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;  
		sizeEx = 0.035 * safezoneH;
		x = 0.3 * safezoneW + safezoneX;
		w = 0.4 * safezoneW;
		y = 0.65 * safezoneH + safezoneY;
		h = 0.1 * safezoneH;
		text = "[GREUH] presents";
		shadow = 1;
	  };
	  class GenericLabelShadow : GenericLabel2{
		shadow = 2;
	  };
   };

   class intro2
   {
      name = "intro2";
      duration = 7;
      idd = -1;
      movingEnable = false;
      controls[]=
      {
         VersionLabelShadow, Splash, VersionLabel
      };
	  	class Splash {
		idc = -1;
		type =  CT_STATIC ; 
		style = ST_PICTURE;  
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;  
		sizeEx = 0.1 * safezoneH;
		x = 0.325 * safezoneW + safezoneX;
		w = 0.35 * safezoneW;
		y = 0.2 * safezoneH + safezoneY;
		h = 0.6 * safezoneH;
		text = "res\splash_libe2.paa";
	  };
	  class VersionLabel {
		idc = -1;
		type =  CT_STATIC ; 
		style = ST_CENTER;  
		shadow = 1;
		colorText[] = COLOR_WHITE;
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;  
		sizeEx = 0.035 * safezoneH;
		x = 0.45 * safezoneW + safezoneX;
		w = 0.3 * safezoneW;
		y = 0.65 * safezoneH + safezoneY;
		h = 0.1 * safezoneH;
		text = "v0.85";
	  };
	  class VersionLabelShadow : VersionLabel {
		shadow = 2;
		font = FontM;  
	  };
   };
   

   class blackscreen
   {
      name = "blackscreen";
      duration = 4;
      idd = -1;
      movingEnable = true;

      controls[]=
      {
         OuterBackground
      };
	  class OuterBackground {
		idc = -1;
		type =  CT_STATIC; 
		style = ST_LEFT;
		colorText[] = COLOR_BLACK;
		colorBackground[] = COLOR_BLACK;
		font = FontM; 
		sizeEx = 0.023;
		x = -3; y = -3;
		w = 9;  h = 9;
		text = "";
	  };
   };
   
   class blank
   {
      name = "blank";
      duration = 999999;
      idd = 6666;
      movingEnable = true;
	  onLoad = "";
      controls[]={};
   };
   
   class statusoverlay
   {
      name = "statusoverlay";
      duration = 999999;
      idd = 6666;
      movingEnable = true;
	  onLoad = "uiNamespace setVariable ['GUI_OVERLAY', _this select 0];";
      controls[]= { BGPicture,LabelManpower,LabelAmmo,LabelFuel,LabelCap,PictureManpowerShadow,PictureAmmoShadow,
	  PictureFuelShadow,PictureCapShadow,PictureManpower,PictureAmmo,PictureFuel,PictureCap,PictureCombatReadinessShadow,PictureCombatReadiness,
	  BGPictureSector,CaptureFrame_OPFOR, CaptureFrame_BLUFOR, CaptureFrame, LabelPoint,LabelCombatReadiness };
	  class BGPicture {
	  	idc = -1;
		type =  CT_STATIC; 
		style = ST_PICTURE;
		colorText[] = {0.8,0.8,0.8,0.8};
		colorBackground[] = COLOR_NOALPHA;
		font = FontM; 
		sizeEx = 0.5;
		x = 0.95 * safezoneW + safezoneX;
		w = 0.075 * safezoneW;
		y = 0.39 * safezoneH + safezoneY;
		h = 0.14 * safezoneH;
		text = "res\gradient.paa";
	  };
	  class BGPictureSector : BGPicture {
	  	idc = 201;
		x = 0.9 * safezoneW + safezoneX;
		w = 0.15 * safezoneW;
		y = 0.325 * safezoneH + safezoneY;
		h = 0.05 * safezoneH;
	  };
	  class GenericLabel69 {
		idc = -1;
		type =  CT_STATIC; 
		style = ST_RIGHT;  
		colorBackground[] = COLOR_NOALPHA;
		font = FontM;  
		sizeEx = 0.022 * safezoneH;
		x = 0.905 * safezoneW + safezoneX;
		w = 0.08 * safezoneW;
		y = 0.5225 * safezoneH + safezoneY;
		h = 0.04 * safezoneH;
		text = "";
		shadow = 1;
	  };
	  class GenericPicture69 {
	  	idc = -1;
		type =  CT_STATIC; 
		style = ST_PICTURE;
		colorText[] = {0.9,0.9,0.9,1};
		colorBackground[] = COLOR_NOALPHA;
		font = FontM; 
		sizeEx = 0.5;
		x = 0.985 * safezoneW + safezoneX;
		w = 0.012 * safezoneW;
		h = 0.0213333333 * safezoneH;
	  };
	 class PictureManpower : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY;
		text = "res\ui_manpo.paa";
	  };
	  class PictureAmmo : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY;
		text = "res\ui_ammo.paa";
	  };
	  class PictureFuel : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY;
		text = "res\ui_fuel.paa";
	  };
	  class PictureCap : GenericPicture69 {
		y = (0.4 + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY;
		text = "\a3\Ui_F_Curator\Data\Displays\RscDisplayCurator\modeGroups_ca.paa";
	  };
	  class PictureCombatReadiness : GenericPicture69 {
		idc = 135;
		y = (0.4 + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY;
		text = "\A3\ui_f\data\map\markers\handdrawn\warning_CA.paa";
	  };
	  class PictureManpowerShadow : PictureManpower {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureAmmoShadow : PictureAmmo {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureFuelShadow : PictureFuel {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class PictureCapShadow : PictureCap {
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  	class PictureCombatReadinessShadow : PictureCombatReadiness {
		idc = -1;
		y = (0.4 + SHADOW_Y + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY;
		x = (0.985 + SHADOW_X) * safezoneW + safezoneX;
		colorText[] = {0,0,0,0.7};
	  };
	  class LabelManpower : GenericLabel69 {
	  	idc = 101;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 0 ) ) * safezoneH + safezoneY;
		colorText[] = {0, 0.75, 0, 1};
	  };
	 class LabelAmmo : GenericLabel69 {
	  	idc = 102;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 1 ) ) * safezoneH + safezoneY;
		colorText[] = {0.75, 0, 0, 1};
	  };
	  class LabelFuel : GenericLabel69 {
	  	idc = 103;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 2 ) ) * safezoneH + safezoneY;
		colorText[] = {0.75, 0.75, 0, 1};
	  };
	  	class LabelCap : GenericLabel69 {
	  	idc = 104;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 3 ) ) * safezoneH + safezoneY;
		colorText[] = {0.8, 0.8, 0.8, 1};
	  };
	  class LabelCombatReadiness : GenericLabel69 {
	  	idc = 105;
		text = "";
		y = (0.39 + ( ICONE_SPACY * 4 ) ) * safezoneH + safezoneY;
		colorText[] = {0.8, 0.8, 0.8, 1};
	  };
	  class CaptureFrameStandard {
		type =  CT_STATIC; 
		font = FontM; 
		sizeEx = 0.023;
		text = "";
	};
	  class CaptureFrame : CaptureFrameStandard {
		idc = 202;
		style = ST_FRAME;
		colorText[] = COLOR_BLACK;
		colorBackground[] = COLOR_OPFOR_NOALPHA;
		x = 0.9125 * safezoneW + safezoneX;
		w = 0.085 * safezoneW;
		y = 0.358 * safezoneH + safezoneY;
		h = 0.012 * safezoneH;
	};
	class CaptureFrame_OPFOR : CaptureFrameStandard{
		idc = 203;
		style = ST_STATIC;
		colorText[] = {0.6, 0, 0, 1};
		colorBackground[] = {0.6, 0, 0, 1};
		x = 0.9125 * safezoneW + safezoneX;
		w = 0.084 * safezoneW;
		y = 0.358 * safezoneH + safezoneY;
		h = 0.011 * safezoneH;

	};
	class CaptureFrame_BLUFOR : CaptureFrameStandard{
		idc = 244;
		style = ST_STATIC;
		colorText[] = {0, 0.2, 0.6, 1};
		colorBackground[] = {0, 0.2, 0.6, 1};
		x = 0.9125 * safezoneW + safezoneX;
		w = 0.084 * safezoneW;
		y = 0.358 * safezoneH + safezoneY;
		h = 0.011 * safezoneH;
	};
	class LabelPoint : GenericLabel69 {
	  	idc = 205;
		text = "Radio Tower 123456";
		style = ST_RIGHT;
		sizeEx = 0.024 * safezoneH;
		x = 0.8 * safezoneW + safezoneX;
		w = 0.2 * safezoneW;
		y = 0.325 * safezoneH + safezoneY;
		h = 0.03 * safezoneH;
		colorText[] = {0.7, 0, 0, 1};
	  };
	};
};
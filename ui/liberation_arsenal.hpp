class liberation_arsenal {
	idd = 5251;
	movingEnable = false;
	controlsBackground[] = {};

	controls[] = {"OuterBG", "RecycleBG","OuterBG_F", "InnerBG", "InnerBG_F", "Header","DeployList","EditButton","LoadButton"};

	objects[] = {};

	class RecycleBG : BgPicture {
		x = (0.42 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.16 * safezoneW) + (4 * BORDERSIZE);
		h = (0.6 * safezoneH) + (6 * BORDERSIZE);
	};

	class OuterBG : StdBG{
		colorBackground[] = COLOR_BROWN;
		x = (0.42 * safezoneW + safezoneX) - ( 2 * BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.16 * safezoneW) + (4 * BORDERSIZE);
		h = (0.6 * safezoneH) + (6 * BORDERSIZE);
	};
	class OuterBG_F : OuterBG {
		style = ST_FRAME;
	};
	class InnerBG : OuterBG {
		colorBackground[] = COLOR_GREEN;
		x = (0.42 * safezoneW + safezoneX)  - ( BORDERSIZE);
		y = (0.2 * safezoneH + safezoneY) - (1.5 * BORDERSIZE);
		w = (0.16 * safezoneW) +  (2 * BORDERSIZE);
		h = (0.6 * safezoneH)  + (3 * BORDERSIZE);
	};
	class InnerBG_F : InnerBG {
		style = ST_FRAME;
	};
	class Header : StdHeader{
		x = 0.42 * safezoneW + safezoneX - (BORDERSIZE);
		y = 0.19 * safezoneH + safezoneY;
		w = 0.16 * safezoneW + ( 2 * BORDERSIZE);
		h = 0.05 * safezoneH - (BORDERSIZE);
		text = $STR_ARSENAL_TITLE;
	};
	class DeployList : StdListBox {
		idc = 201;
		x = 0.42 * safezoneW + safezoneX;
		w = 0.16 * safezoneW;
		y = 0.25 * safezoneH + safezoneY;
		h = (0.45 * safezoneH) - (1.5 * BORDERSIZE);
		shadow = 2;
		onLBSelChanged="";
	};
	class LoadButton : StdButton{
		idc = 202;
		x = (0.43 * safezoneW + safezoneX);
		y = (0.7 * safezoneH + safezoneY);
		w = (0.14 * safezoneW);
		h = (0.04 * safezoneH);
		sizeEx = 0.03 * safezoneH;
		text = $STR_LOAD_LOADOUT;
		action = "load_loadout = 1;";
	};
	class EditButton : StdButton{
		idc = -1;
		x = (0.43 * safezoneW + safezoneX);
		y = (0.75 * safezoneH + safezoneY);
		w = (0.14 * safezoneW);
		h = (0.04 * safezoneH);
		sizeEx = 0.03 * safezoneH;
		text = $STR_EDIT_LOADOUT;
		action = "edit_loadout = 1;";
	};
};
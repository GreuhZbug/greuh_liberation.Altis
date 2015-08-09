class liberation_deploy {
	idd = 5201;
	movingEnable = false;
	controlsBackground[] = {};
	
	controls[] = {"OuterBG", "RecycleBG","OuterBG_F", "InnerBG", "InnerBG_F", "Header","DeployList","DeployButton","DeployMap"};
	
	objects[] = {};	
	
	class RecycleBG : BgPicture {
		x = (0.1 * safezoneW + safezoneX) - ( 2 * BORDERSIZE); 
		y = (0.15 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.15 * safezoneW) + (4 * BORDERSIZE);  
		h = (0.7 * safezoneH) + (6 * BORDERSIZE);
	};
	class DeployMap : kndr_MapControl {
		idc = 251;
		x = (0.1 * safezoneW + safezoneX); 
		y = (0.55 * safezoneH + safezoneY);
		w = (0.15 * safezoneW);  
		h = (0.25 * safezoneH) - ( 1.5 * BORDERSIZE);
	};
	
	class OuterBG : StdBG{
		colorBackground[] = COLOR_BROWN;
		x = (0.1 * safezoneW + safezoneX) - ( 2 * BORDERSIZE); 
		y = (0.15 * safezoneH + safezoneY) - (3 * BORDERSIZE);
		w = (0.15 * safezoneW) + (4 * BORDERSIZE);  
		h = (0.7 * safezoneH) + (6 * BORDERSIZE);
	};
	class OuterBG_F : OuterBG {
		style = ST_FRAME;
	};
	class InnerBG : OuterBG {
		colorBackground[] = COLOR_GREEN;
		x = (0.1 * safezoneW + safezoneX)  - ( BORDERSIZE); 
		y = 0.2 * safezoneH + safezoneY - (1.5 * BORDERSIZE);
		w = (0.15 * safezoneW) +  (2 * BORDERSIZE);  
		h = 0.65 * safezoneH  + (3 * BORDERSIZE);
	};
	class InnerBG_F : InnerBG {
		style = ST_FRAME;
	};
	class Header : StdHeader{
		x = 0.1 * safezoneW + safezoneX - (BORDERSIZE); 
		y = 0.14 * safezoneH + safezoneY;
		w = 0.15 * safezoneW + ( 2 * BORDERSIZE);  
		h = 0.05 * safezoneH - (BORDERSIZE);
		text = $STR_DEPLOY_TITLE;
	};
	class DeployList : StdListBox {
		idc = 201;
		x = 0.1 * safezoneW + safezoneX;
		w = 0.15 * safezoneW;
		y = 0.2 * safezoneH + safezoneY;
		h = (0.35 * safezoneH) - (1.5 * BORDERSIZE);
		shadow = 2;
		onLBSelChanged="";
	};
	class DeployButton : StdButton{
		idc = 202;
		x = (0.1 * safezoneW + safezoneX);
		y = (0.8 * safezoneH + safezoneY);
		w = (0.15 * safezoneW);  
		h = (0.05 * safezoneH);		
		sizeEx = 0.05 * safezoneH;
		text = $STR_DEPLOY_BUTTON;
		action = "deploy = 1";
	};
};
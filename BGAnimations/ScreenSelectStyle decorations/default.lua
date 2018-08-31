local t = LoadFallbackB()
local lang = "us";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;

t[#t+1] = LoadActor("side")..{
	InitCommand=cmd(draworder,2;x,SCREEN_LEFT;CenterY;halign,0);
};

t[#t+1] = Def.ActorFrame{
	Def.Sprite{
		InitCommand=cmd(x,SCREEN_CENTER_X-60;y,SCREEN_CENTER_Y-36;);
		OnCommand=cmd(draworder,90;cropright,1;sleep,0.6;linear,0.4;cropright,0);
		StyleSingleMessageCommand=function(s) s:Load(THEME:GetPathB("","ScreenSelectStyle decorations/"..lang.."_single.png")) end,
		StyleVersusMessageCommand=function(s) s:Load(THEME:GetPathB("","ScreenSelectStyle decorations/"..lang.."_versus.png")) end,
		StyleDoubleMessageCommand=function(s) s:Load(THEME:GetPathB("","ScreenSelectStyle decorations/"..lang.."_double.png")) end,
	};
};

t[#t+1] = LoadActor("Help")..{
	InitCommand=function(self)
		self:CenterX():y(SCREEN_BOTTOM-18)
		:queuecommand("Animate")
	end;
	OnCommand=cmd(addy,50;sleep,0.1;linear,0.2;addy,-50);
	AnimateCommand=cmd(diffuseblink;effectcolor1,color("1,1,1,1");effectcolor2,color("0.5,0.5,0.5,1");effectperiod,1.5);
};

if lang == "jp" then
	t[#t+1] = LoadActor("caption")..{
		InitCommand=function(self)
			self:draworder(2)
			self:xy(SCREEN_CENTER_X-172,SCREEN_CENTER_Y-176);
		end;
		OnCommand=cmd(rotationy,90;sleep,0.5;linear,0.2;rotationy,0);
		OffCommand=cmd(linear,0.2;rotationy,90);
	};
end;

return t

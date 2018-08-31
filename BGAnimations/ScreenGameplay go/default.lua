local lang = "us";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;

return Def.ActorFrame{
	LoadActor(lang.."_go")..{
		Name="Main";
		InitCommand=cmd(CenterX;y,SCREEN_CENTER_Y-12);
		OnCommand=cmd(diffusealpha,1;sleep,1.2;diffusealpha,0);
	};
};

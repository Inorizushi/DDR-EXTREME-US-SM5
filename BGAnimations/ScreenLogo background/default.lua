local outColor = color("#00326B")
local lang = "us";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;


local t = Def.ActorFrame{
	LoadActor(lang.."_bg")..{
		InitCommand=cmd(Center;);
	};
}

return t;


local lang = "us";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;
local t = Def.ActorFrame{};

if lang == "us" then
	t[#t+1] = Def.ActorFrame{
		LoadActor("warning.png")..{
			InitCommand=cmd(Center);
		};
	}
end;

if lang == "jp" then
	t[#t+1] = Def.ActorFrame{
		LoadActor("warnings.png")..{
			InitCommand=cmd(Center);
			OnCommand=cmd(sleep,4.5;linear,0.25;diffusealpha,0);
		};
		LoadActor("caution.png")..{
			InitCommand=cmd(Center;diffusealpha,0);
			OnCommand=cmd(sleep,4.75;linear,0.25;diffusealpha,1);
		};
	}
end;

return t;

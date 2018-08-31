local lang = "us";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;

local t = Def.ActorFrame{
	Def.Sprite{
		InitCommand=cmd(Center;playcommand,"Set");
		SetCommand=function(self)
			if lang == "us" then
				self:Load(THEME:GetPathB("","ScreenCaution background/centered.png"))
			else
				self:Load(THEME:GetPathB("","ScreenWarning background/warning.png"))
			end;
		end;
	};
};

return t;

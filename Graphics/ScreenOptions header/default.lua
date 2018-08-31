local lang = "us";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;
local t = Def.ActorFrame{
  LoadActor(lang.."_Options")..{};
};

return t;

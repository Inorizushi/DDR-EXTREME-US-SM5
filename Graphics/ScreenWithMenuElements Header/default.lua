local screenName = Var "LoadingScreen"
local headerTextImage
local lang = "us";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;

--this should probably be a metric
if screenName == "ScreenSelectMusic" then
  headerTextImage = "Music.png"
elseif screenName == "ScreenSelectStyle" then
  headerTextImage = "Style.png"
end;

local out = Def.ActorFrame{};
--Text Anchoring
if headerTextImage then
	table.insert(out,LoadActor(lang.."_"..headerTextImage)..{
		InitCommand=function(self)
			if lang == "jp" then
				if screenName == "ScreenSelectMusic" then
					self:x(10)
				end;
			end;
		end;
	})
end

return out

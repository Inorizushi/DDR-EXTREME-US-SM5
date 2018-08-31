local t = Def.ActorFrame{};
local lang = "us";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;

local set;

local Nonstoptext = THEME:GetString("MusicWheel","CustomItemNonstopText");
local Challengetext = THEME:GetString("MusicWheel","CustomItemChallengeText");
local Edittext = THEME:GetString("MusicWheel","CustomItemEditText");

local t = Def.ActorFrame {
	LoadActor(THEME:GetPathS("","_NonstopItem (loop).ogg"))..{
		InitCommand=cmd(stop);
		SetMessageCommand=function(self, params)
			if params.Label == Nonstoptext then
				if params.HasFocus then
					self:play();
				else
					self:stop();
				end;
			end;
		end;
	};
	LoadActor(THEME:GetPathS("","_ChallengeItem (loop).ogg"))..{
		InitCommand=cmd(stop);
		SetMessageCommand=function(self, params)
			if params.Label == Challengetext then
				if params.HasFocus then
					self:play();
				else
					self:stop();
				end;
			end;
		end;
	};
	LoadActor(THEME:GetPathS("","_EditItem (loop).ogg"))..{
		InitCommand=cmd(stop);
		SetMessageCommand=function(self, params)
			if params.Label == Edittext then
				if params.HasFocus then
					self:play();
				else
					self:stop();
				end;
			end;
		end;
	};
};

t[#t+1] = Def.ActorFrame {
	Def.Sprite{
		SetMessageCommand=function(self,params)
			self:visible(true);
			if params.HasFocus then
        self:x(2);
        self:y(-6.4);
      else
        self:x(0);
        self:y(-6.4)
      end;
			if params.Label == Nonstoptext then
				self:Load(THEME:GetPathG("","MusicWheelItem Custom OverPart/"..lang.."_Nonstop.png"))
				if params.HasFocus then
					shownonstop = 1
				else
					shownonstop = 0
				end;
			end;
			if params.Label == Challengetext then
				self:Load(THEME:GetPathG("","MusicWheelItem Custom OverPart/"..lang.."_Challenge.png"))
				if params.HasFocus then
					showchallenge = 1
				else
					showchallenge = 0
				end;
			end;
			if params.Label == Edittext then
				self:Load(THEME:GetPathG("","MusicWheelItem Custom OverPart/"..lang.."_Edit.png"))
				if params.HasFocus then
					showedit = 1
				else
					showedit = 0
				end;
			end;
		end;
	};
};

return t;

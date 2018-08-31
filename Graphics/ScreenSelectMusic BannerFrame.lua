local t = Def.ActorFrame{}
local lang = "us";
if THEME:GetCurLanguage() == "ja" then
	lang = "jp";
end;
t[#t+1] = Def.ActorFrame {
	Def.Banner {
    InitCommand=cmd(xy,-2,-28);
		SetCommand=function(self,params)
		if not GAMESTATE:IsCourseMode() then
		local song = GAMESTATE:GetCurrentSong();
				if song then
					if song:HasBanner() then
						self:LoadBackground(song:GetBannerPath());
						self:stopeffect():stoptweening():diffusealpha(0.5):linear(0.2):diffusealpha(1):scaletoclipped(256,88);
					else
						self:Load(THEME:GetPathG("","Common fallback banner"));
						self:stopeffect():stoptweening():diffusealpha(0.5):linear(0.2):diffusealpha(1):scaletoclipped(256,88);
					end;
				else
						self:diffusealpha(0);
						self:Load(THEME:GetPathG("","Common fallback banner"));
						self:stopeffect():stoptweening():scaletoclipped(256,88);
				end;
		else
			self:diffusealpha(0);
      self:stopeffect():stoptweening():scaletoclipped(256,88);
		end;
	end;
	CurrentSongChangedMessageCommand=cmd(playcommand,"Set");
	};
	Def.Banner {
    InitCommand=cmd(xy,-2,-28);
		SetCommand=function(self)
	  local course = GAMESTATE:GetCurrentCourse();
		if course then
			self:LoadFromCourse(GAMESTATE:GetCurrentCourse());
			self:stopeffect():stoptweening():diffusealpha(0.5):linear(0.2):diffusealpha(1):scaletoclipped(256,88);
		end;
	end;
	CurrentCourseChangedMessageCommand=cmd(playcommand,"Set");
	};
};

t[#t+1] = Def.ActorFrame{
  Def.Banner {
    InitCommand=cmd(xy,-2,-28;diffusealpha,0);
    SetCommand=function(self,params)
    if not GAMESTATE:IsCourseMode() then
    local song = GAMESTATE:GetCurrentSong();
    local group = getenv("getgroupname");
      if not song then
        local wheel = SCREENMAN:GetTopScreen():GetChild('MusicWheel');
        if wheel:GetSelectedType() == 'WheelItemDataType_Random' then
          self:Load(THEME:GetPathG("","_banner/"..lang.."_random"))
          self:stopeffect():stoptweening():diffusealpha(0.5):linear(0.2):diffusealpha(1):scaletoclipped(256,88);
        elseif wheel:GetSelectedType() == 'WheelItemDataType_Roulette' then
          self:Load(THEME:GetPathG("","_banner/"..lang.."_roulette"))
          self:stoptweening():diffusealpha(0.5):linear(0.2):diffusealpha(1):scaletoclipped(256,88);
          self:diffuseshift():effectcolor1(color("0.5,0.5,0.5,1")):effectcolor2(color("1,1,1,1")):effectperiod(1.085)
        elseif wheel:GetSelectedType() == 'WheelItemDataType_Custom' then
          if showedit == 1 then
            self:Load(THEME:GetPathG("","_banner/"..lang.."_edit"))
          elseif shownonstop == 1 then
            self:Load(THEME:GetPathG("","_banner/"..lang.."_nonstop"))
          elseif showchallenge == 1 then
            self:Load(THEME:GetPathG("","_banner/"..lang.."_challenge"))
          end;
          self:stoptweening():diffusealpha(0.5):linear(0.2):diffusealpha(1):scaletoclipped(256,88);
          self:diffuseshift():effectcolor1(color("0.5,0.5,0.5,1")):effectcolor2(color("1,1,1,1")):effectperiod(1.085)
        else
          self:stopeffect():stoptweening():diffusealpha(0.5):linear(0.2):diffusealpha(1):scaletoclipped(256,88);
          self:LoadFromSongGroup(group)
        end;
      else
          self:diffusealpha(0);
          self:Load(THEME:GetPathG("","Common fallback banner"))
          self:stopeffect():stoptweening()
          self:scaletoclipped(256,88)
      end;
  else
    self:diffusealpha(0);
    self:stopeffect()
    self:scaletoclipped(256,88)
  end;
  end;
  CurrentSongChangedMessageCommand=function(self, params)
    self:playcommand("Set", params);
  end;
  };
  LoadActor("_BannerFrame")..{};
}

return t;

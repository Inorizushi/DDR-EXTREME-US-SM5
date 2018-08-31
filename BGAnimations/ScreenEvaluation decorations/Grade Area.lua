local t = Def.ActorFrame{};

local screenName = Var "LoadingScreen"

local xPosPlayer = {
  P1 = (SCREEN_CENTER_X-214);
  P2 = (SCREEN_CENTER_X+214)
};

for _, pn in pairs(GAMESTATE:GetEnabledPlayers()) do
  t[#t+1] = Def.ActorFrame{
    InitCommand=function(self)
      local short = ToEnumShortString(pn)
      self:x(xPosPlayer[short]);
      self:y(SCREEN_CENTER_Y+44)
    end;
    Def.ActorFrame{
      InitCommand=cmd(sleep,1.2;queuecommand,"Stretch");
      StretchCommand=function(self)
        self:zoomy(1):linear(0.3):zoomy(1.1):linear(0.3):zoomy(1):queuecommand("Stretch")
      end;
      Def.Sprite{
        InitCommand=cmd(diffuse,color("0.75,0.75,0.75,1");playcommand,"Set");
        OnCommand=cmd(cropbottom,1;addy,80;sleep,0.5;linear,0.2;addy,-90;cropbottom,0;linear,0.1;addy,10;sleep,0.4;diffuse,color("1,1,1,1"));
        SetCommand=function(self)
          local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetGrade()
          self:Load(THEME:GetPathB("ScreenEvaluation decorations/Grades/GradeDisplayEval", ToEnumShortString(pss)));
        end;
      };
      Def.Sprite{
        InitCommand=cmd(playcommand,"Set");
        SetCommand=function(self)
          local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn):GetGrade()
          self:Load(THEME:GetPathB("ScreenEvaluation decorations/Grades/GradeDisplayEval", ToEnumShortString(pss)));
        end;
        OnCommand=cmd(diffusealpha,0;sleep,1.2;queuecommand,"Anim");
        AnimCommand=function(self)
          self:blend(Blend.Add):diffuseshift():diffusealpha(0.6):effectcolor1(color("1,1,1,0.6")):effectcolor2(color("1,1,1,0")):effectperiod(0.2)
        end;
      };
    };
    LoadActor("light")..{
      InitCommand=cmd(xy,pn=="PlayerNumber_P2" and 22 or -22,-84;zoomx,pn=="PlayerNumber_P2" and -1 or 1);
      OnCommand=cmd(diffusealpha,0;sleep,1.2;diffusealpha,1;);
    };
    LoadActor("shadow")..{
      InitCommand=cmd(y,84);
    };
  };
end;

return t;

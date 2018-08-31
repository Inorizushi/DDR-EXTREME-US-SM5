local t = Def.ActorFrame{
  LoadActor("../_MenuHL")..{
    InitCommand=cmd(visible,false;y,114;diffusealpha,0.75);
    GainFocusCommand=cmd(visible,true);
    LoseFocusCommand=cmd(visible,false);
  };
  Def.Sprite{
    Texture="../_TitleSheetJP 2x13.png";
    InitCommand=cmd(pause,setstate,22;y,114);
    GainFocusCommand=cmd(setstate,23);
    LoseFocusCommand=cmd(setstate,22);
  };
};

return t;

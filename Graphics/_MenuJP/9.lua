local t = Def.ActorFrame{
  LoadActor("../_MenuHL")..{
    InitCommand=cmd(visible,false;y,54;diffusealpha,0.75);
    GainFocusCommand=cmd(visible,true);
    LoseFocusCommand=cmd(visible,false);
  };
  Def.Sprite{
    Texture="../_TitleSheetJP 2x13.png";
    InitCommand=cmd(pause,setstate,14;y,54);
    GainFocusCommand=cmd(setstate,15);
    LoseFocusCommand=cmd(setstate,14);
  };
};

return t;

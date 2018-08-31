local t = Def.ActorFrame{
  LoadActor("../_MenuHL")..{
    InitCommand=cmd(visible,false;y,144;diffusealpha,0.75);
    GainFocusCommand=cmd(visible,true);
    LoseFocusCommand=cmd(visible,false);
  };
  Def.Sprite{
    Texture="../_TitleSheetJP 2x13.png";
    InitCommand=cmd(pause,setstate,20;y,144);
    GainFocusCommand=cmd(setstate,21);
    LoseFocusCommand=cmd(setstate,20);
  };
};

return t;

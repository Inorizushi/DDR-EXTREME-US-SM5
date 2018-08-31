local t = Def.ActorFrame{
  LoadActor("../_MenuHL")..{
    InitCommand=cmd(visible,false;y,84;diffusealpha,0.75);
    GainFocusCommand=cmd(visible,true);
    LoseFocusCommand=cmd(visible,false);
  };
  Def.Sprite{
    Texture="../_TitleSheetJP 2x13.png";
    InitCommand=cmd(pause,setstate,16;y,84);
    GainFocusCommand=cmd(setstate,17);
    LoseFocusCommand=cmd(setstate,16);
  };
};

return t;

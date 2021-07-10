unit Unit3;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Objects, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit,
  FMX.Filter.Effects, FMX.Layouts;

type
  TForm3 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    CheckBox1: TCheckBox;
    Rectangle1: TRectangle;
    Circle1: TCircle;
    ShadowEffect1: TShadowEffect;
    BlurEffect1: TBlurEffect;
    GlowEffect1: TGlowEffect;
    ReflectionEffect1: TReflectionEffect;
    SepiaEffect1: TSepiaEffect;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    Button2: TButton;
    Edit2: TEdit;
    SepiaEffect2: TSepiaEffect;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

end.

program listView;

uses
  System.StartUpCopy,
  FMX.Forms,
  frmListView in 'frmListView.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.

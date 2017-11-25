program CRUDv1;

uses
  Vcl.Forms,
  uFrmMain in 'uFrmMain.pas' {FrmMain},
  uClassConn in 'Class\uClassConn.pas',
  uClassController in 'Class\uClassController.pas',
  uClassControllerUser in 'Class\uClassControllerUser.pas';

{$R *.res}

begin
   Application.Initialize;
   Application.MainFormOnTaskbar := True;
   Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;

end.

unit uClassConn;

interface

uses
   Data.DB,
   FireDAC.Comp.Client,
   FireDAC.Comp.DataSet,
   FireDAC.Comp.UI,
   FireDAC.DApt,
   FireDAC.DApt.Intf,
   FireDAC.DatS,
   FireDAC.Phys,
   FireDAC.Phys.Intf,
   FireDAC.Phys.SQLite,
   FireDAC.Phys.SQLiteDef,
   FireDAC.Stan.Async,
   FireDAC.Stan.Def,
   FireDAC.Stan.Error,
   FireDAC.Stan.ExprFuncs,
   FireDAC.Stan.Intf,
   FireDAC.Stan.Option,
   FireDAC.Stan.Param,
   FireDAC.Stan.Pool,
   FireDAC.UI.Intf,
   FireDAC.VCLUI.Wait,
   System.Classes,
   System.SysUtils,
   System.Variants,
   Vcl.Controls,
   Vcl.Dialogs,
   Vcl.Forms,
   Vcl.Graphics,
   Winapi.Messages,
   Winapi.Windows;

type
   TConn = class
   private
      FConn: TFDConnection;

   public
      constructor Create;
      destructor Destroy; override;

      function GetConn: TFDConnection;
      property Conn: TFDConnection read GetConn;
   end;

const
   SQL_TB_USER = //
      'CREATE TABLE IF NOT EXISTS TB_USER (' + //
      ' ID_USER INTEGER PRIMARY KEY AUTOINCREMENT,' + //
      ' DS_NAME VARCHAR(30) DEFAULT NULL,' + //
      ' FL_STATUS INTEGER DEFAULT 1,' + //
      ' DH_INS DATETIME DEFAULT CURRENT_TIMESTAMP,' + //
      ' DH_UPD DATETIME DEFAULT NULL,' + //
      ' DH_DEL DATETIME DEFAULT NULL' + //
      ')';

implementation

{ TConn }

constructor TConn.Create;
begin
   try
      FConn := TFDConnection.Create(Application);
      FConn.Close;
      FConn.LoginPrompt := False;
      FConn.DriverName := 'SQLite';
      FConn.Params.Values['DataBase'] := ExtractFilePath(ParamStr(0)) + 'CRUD.sqlite';
      FConn.Params.Values['OpenMode'] := 'omCreateUTF8';
      FConn.Params.Values['LockingMode'] := 'lmNormal';
      FConn.Params.Values['SQLiteAdvanced'] := 'page_size=4096;encoding="UTF-8"';

      FConn.ExecSQL(SQL_TB_USER);

      FConn.Open;
   except
      on E: Exception do
      begin
         ShowMessage(E.Message);
         Abort;
      end;
   end;
end;

destructor TConn.Destroy;
begin
   FConn.Free;
   inherited;
end;

function TConn.GetConn: TFDConnection;
begin
   Result := FConn;
end;

end.

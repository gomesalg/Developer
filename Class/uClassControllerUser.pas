unit uClassControllerUser;

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
   Winapi.Windows,

   uClassController;

type
   TControllerUser = class
   private
      FId: String;
      FName: String;

      FController: TController;
   public
      constructor Create(AController: TController);
      destructor Destroy; override;

      function Insert: Boolean;
      function Update: Boolean;
      function Delete: Boolean;

      function SelectId(const AId: string): TControllerUser;
      function SelectAll: TControllerUser;

      property Id: String read FId write FId;
      property Name: String read FName write FName;
   end;

implementation

{ TControllerUser }

constructor TControllerUser.Create(AController: TController);
begin
   FController := AController;
end;

destructor TControllerUser.Destroy;
begin
   inherited;
end;

function TControllerUser.Insert: Boolean;
var
   LSQL: string;
begin
   LSQL := //
      'INSERT INTO TB_USER (' + //
      'DS_NAME' + //
      ') VALUES (' + //
      ':DS_NAME' + //
      ')';

   FController.QrySQL.Close;
   FController.QrySQL.SQL.Text := LSQL;

   FController.QrySQL.Params.ParamByName('DS_NAME').AsString := Self.Name;

   try
      FController.QrySQL.ExecSQL;
      Result := True;
   except
      Result := False;
   end;
end;

function TControllerUser.Update: Boolean;
var
   LSQL: string;
begin
   LSQL := //
      'UPDATE TB_USER SET' + //
      ' DS_NAME = :DS_NAME' + //
      ',DH_UPD = CURRENT_TIMESTAMP' + //
      ' WHERE 1 = 1' + //
      ' AND FL_STATUS = 1' + //
      ' AND (ID_USER = :ID_USER)';

   FController.QrySQL.Close;
   FController.QrySQL.SQL.Text := LSQL;

   FController.QrySQL.Params.ParamByName('ID_USER').AsString := Self.Id;
   FController.QrySQL.Params.ParamByName('DS_NAME').AsString := Self.Name;

   try
      FController.QrySQL.ExecSQL;
      Result := True;
   except
      Result := False;
   end;
end;

function TControllerUser.Delete: Boolean;
var
   LSQL: string;
begin
   LSQL := //
      'UPDATE TB_USER SET' + //
      ' FL_STATUS = 0' + //
      ',DH_DEL = CURRENT_TIMESTAMP' + //
      ' WHERE 1 = 1' + //
      ' AND FL_STATUS = 1' + //
      ' AND (ID_USER = :ID_USER)';

   FController.QrySQL.Close;
   FController.QrySQL.SQL.Text := LSQL;

   FController.QrySQL.ParamByName('ID_USER').AsString := Self.FId;

   try
      FController.QrySQL.ExecSQL;
      Result := True;
   except
      Result := False;
   end
end;

function TControllerUser.SelectId(const AId: string): TControllerUser;
var
   LSQL: string;
begin
   Result := nil;

   LSQL := //
      'SELECT' + //
      ' ID_USER' + //
      ',DS_NAME' + //
      ',DH_INS' + //
      ',DH_UPD' + //
      ',DH_DEL' + //
      ' FROM TB_USER' + //
      ' WHERE 1 = 1' + //
      ' AND FL_STATUS = 1' + //
      ' AND ID_USER = :ID_USER';

   FController.QrySQL.Close;
   FController.QrySQL.SQL.Text := LSQL;
   FController.QrySQL.Params.ParamByName('ID_USER').DataType := TFieldType.ftString;
   FController.QrySQL.Params.ParamByName('ID_USER').AsString := AId;
   FController.QrySQL.Open;

   if FController.QrySQL.IsEmpty then
   begin
      Self.FId := EmptyStr;
      Self.FName := EmptyStr;
   end
   else
   begin
      Self.Id := FController.QrySQL.FindField('ID_USER').AsString;
      Self.Name := FController.QrySQL.FindField('DS_NAME').AsString;
   end;
end;

function TControllerUser.SelectAll: TControllerUser;
var
   LSQL: string;
begin
   Result := nil;

   LSQL := //
      'SELECT' + //
      ' ID_USER' + //
      ',DS_NAME' + //
      ',DH_INS' + //
      ',DH_UPD' + //
      ',DH_DEL' + //
      ' FROM TB_USER' + //
      ' WHERE 1 = 1' + //
      ' AND FL_STATUS = 1';

   FController.QrySQL.Close;
   FController.QrySQL.Open(LSQL);
end;

end.

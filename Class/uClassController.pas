unit uClassController;

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

   uClassConn;

type
   TController = class
   private
      FConn: TConn;
      FQrySQL: TFDQuery;
   public

      constructor Create;
      destructor Destroy; override;

      property QrySQL: TFDQuery read FQrySQL write FQrySQL;

   end;

implementation

{ TController }

constructor TController.Create;
begin
   FConn := TConn.Create;
   FQrySQL := TFDQuery.Create(Application);
   FQrySQL.Connection := FConn.Conn;
end;

destructor TController.Destroy;
begin
   inherited;
end;

end.

unit uFrmMain;

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

   uClassConn,
   uClassController,
   uClassControllerUser,
   Vcl.StdCtrls,
   Vcl.Grids,
   Vcl.DBGrids,
   Vcl.ExtCtrls;

type
   TFrmMain = class(TForm)
      dsList: TDataSource;
      pnlClient: TPanel;
      grdList: TDBGrid;
      pnlTop: TPanel;
      lblName: TLabel;
      edtName: TEdit;
      btnInsert: TButton;
      btnDelete: TButton;
      btnUpdate: TButton;
      lblId: TLabel;
      edtId: TEdit;
      btnSelectId: TButton;
      btnSelectAll: TButton;
    FDConnection1: TFDConnection;
      procedure btnInsertClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnUpdateClick(Sender: TObject);
      procedure btnDeleteClick(Sender: TObject);
      procedure dsListDataChange(Sender: TObject; Field: TField);
      procedure btnSelectIdClick(Sender: TObject);
      procedure btnSelectAllClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
   private
      procedure OpenRefresh;
      { Private declarations }
   public
      { Public declarations }
   end;

var
   FrmMain: TFrmMain;
   Controller: TController;
   Customer: TControllerUser;

implementation

{$R *.dfm}

procedure TFrmMain.OpenRefresh;
begin
   dsList.DataSet := Controller.QrySQL;
   Customer.SelectAll;

   edtId.Text := EmptyStr;
   edtName.Text := EmptyStr;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
   if not Assigned(Controller) then
      Controller := TController.Create;

   if not Assigned(Customer) then
      Customer := TControllerUser.Create(Controller);

   OpenRefresh;
end;

procedure TFrmMain.FormShow(Sender: TObject);
begin
   Self.Height := 500;
   Self.Width := 650;
end;

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if Assigned(Customer) then
      FreeAndNil(Customer);

   if Assigned(Controller) then
      FreeAndNil(Controller);
end;

procedure TFrmMain.btnInsertClick(Sender: TObject);
begin
   Customer.Name := edtName.Text;

   if not(Customer.Name = EmptyStr) then
   begin
      Customer.Insert;
      OpenRefresh;
   end;
end;

procedure TFrmMain.btnUpdateClick(Sender: TObject);
begin
   Customer.Id := edtId.Text;
   Customer.Name := edtName.Text;

   if not(Customer.Id = EmptyStr) then
   begin
      Customer.Update;
      OpenRefresh;
   end;
end;

procedure TFrmMain.btnDeleteClick(Sender: TObject);
begin
   Customer.Id := edtId.Text;

   if not(Customer.Id = EmptyStr) then
   begin
      Customer.Delete;
      OpenRefresh;
   end;
end;

procedure TFrmMain.btnSelectIdClick(Sender: TObject);
begin
   Customer.SelectId(edtId.Text);
end;

procedure TFrmMain.btnSelectAllClick(Sender: TObject);
begin
   OpenRefresh;
end;

procedure TFrmMain.dsListDataChange(Sender: TObject; Field: TField);
begin
   if not(TDataSource(Sender).DataSet = nil) then
   begin
      if TDataSource(Sender).DataSet.Active then
      begin
         if not TDataSource(Sender).DataSet.IsEmpty then
         begin
            edtId.Text := TDataSource(Sender).DataSet.FindField('ID_USER').AsString;
            edtName.Text := TDataSource(Sender).DataSet.FindField('DS_NAME').AsString;
         end;
      end;
   end;
end;

end.

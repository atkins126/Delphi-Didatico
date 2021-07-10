unit view.pages.usuario;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.pages.form.template, Vcl.ExtCtrls,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.Buttons, Bind4D, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.StorageBin, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, view.styles.colors, Vcl.ComCtrls,
  Bind4D.Attributes, Bind4D.Types;

type
  [FormRest('/users','guuid','name', 'asc')]
  [FormDefault('Cadastro de usu�rios')]
  TpgUsuario = class(TfrmTemplate)
    StackPanel1: TStackPanel;

    [ComponentBindStyle(clBtnFace, FONT_H5, CINZA, FONT_NAME_DEFAULT)]
    Label2: TLabel;

    [FieldJsonBind('guuid'), FbIgnorePost, FbIgnorePut]  // quando for enviado o json, ser� ignorado o c�digo.
    [FieldDataSetBind('guuid', ftString, false, 0, 'C�digo')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, CINZA, FONT_NAME_DEFAULT)]
    edtCodigo: TEdit;

    [ComponentBindStyle(clBtnFace, FONT_H5, CINZA, FONT_NAME_DEFAULT)]
    Label3: TLabel;

    [FieldJsonBind('name')]
    [FieldDataSetBind('name', ftString, True, 30, 'Nome')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, CINZA, FONT_NAME_DEFAULT)]
     edtNome: TEdit;

    [ComponentBindStyle(clBtnFace, FONT_H5, CINZA, FONT_NAME_DEFAULT)]
    Label4: TLabel;

    [FieldJsonBind('phone')]
    [FieldDataSetBind('phone', ftString, True, 10, 'Telefone', '!\(##\) #####-####;0;_')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, CINZA, FONT_NAME_DEFAULT, teCell)]
    edtTelefone: TEdit;

    [ComponentBindStyle(clBtnFace, FONT_H5, CINZA, FONT_NAME_DEFAULT)]
    Label5: TLabel;

    [FieldJsonBind('occupation')]
    [FieldDataSetBind('occupation', ftString, True, 10, 'Profiss�o')]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, CINZA, FONT_NAME_DEFAULT)]
    edtOcupacao: TEdit;

    [ComponentBindStyle(clBtnFace, FONT_H5, CINZA, FONT_NAME_DEFAULT)]
    Label6: TLabel;

    [FieldJsonBind('balance')]
    [FieldDataSetBind('balance', ftCurrency, True, 10, 'Saldo', 'R$ ###,###,##0.00', taLeftJustify)]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, CINZA, FONT_NAME_DEFAULT, teCoin)]
    edtSaldo: TEdit;

    [ComponentBindStyle(clBtnFace, FONT_H5, CINZA, FONT_NAME_DEFAULT)]
    Label7: TLabel;

    [FieldJsonBind('birthdate')]
    [FieldDataSetBind('birthdate', ftDate, True, 10, 'Data Nascimento', '##/##/####;0;_', taLeftJustify)]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, CINZA, FONT_NAME_DEFAULT, teDate)]
    dateNascimento: TDateTimePicker;

    [ComponentBindStyle(clBtnFace, FONT_H5, CINZA, FONT_NAME_DEFAULT)]
    Label8: TLabel;

    [FieldJsonBind('lasttransaction')]
    [FieldDataSetBind('lasttransaction', ftTime, True, 10, 'Ultima Transa��o', '##:##:##;0;_', taLeftJustify)]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, clBtnFace, FONT_NAME_DEFAULT)]
     dateUltimaTransacao: TDateTimePicker;

    [ComponentBindStyle(clBtnFace, FONT_H5, CINZA, FONT_NAME_DEFAULT)]
    Label9: TLabel;

    [FieldJsonBind('cpf')]
    [FieldDataSetBind('cpf', ftString, True, 10, 'CPF', '###.###.###-##;0;_', taLeftJustify)]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, CINZA, FONT_NAME_DEFAULT, teCPF)]
    edtCPF: TEdit;

    [ComponentBindStyle(clBtnFace, FONT_H5, CINZA, FONT_NAME_DEFAULT)]
     Label10: TLabel;

    [FieldJsonBind('cnpj')]
    [FieldDataSetBind('cnpj', ftString, True, 10, 'CNPJ', '##.###.###/####-##;0;_', taLeftJustify)]
    [ComponentBindStyle(COLOR_BACKGROUND, FONT_H5, CINZA, FONT_NAME_DEFAULT, teCNPJ)]
    edtCNPJ: TEdit;

    StackPanel2: TStackPanel;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  pgUsuario: TpgUsuario;

implementation

uses
  RESTRequest4D, System.JSON, Winapi.Windows;

{$R *.dfm}

procedure TpgUsuario.btnAtualizarClick(Sender: TObject);
begin
  inherited;
  DBGrid1.Refresh;
end;

procedure TpgUsuario.btnExcluirClick(Sender: TObject);
var
  AJson : TJsonObject;
begin
  inherited;
  AJson := TBind4D.New.Form(self).FormToJson(fbDelete);
  try
    case application.MessageBox(PCHAR(concat('Confirma a exclus�o do usu�rio ', AJson.FindValue('name').ToJSON, ' ?')), 'HutCode', MB_yesno + MB_ICONINFORMATION) of
      mrNo, mrCancel: Exit;
      mrYes: begin
        FDAO.Delete;
        if application.MessageBox('Usu�rio exclu�do com sucesso!', 'HutCode', MB_OK + MB_TASKMODAL) = mrOk then
          ToggleDBGrid;
      end;
    end;
  finally
     AJson.Free;
  end;
end;

procedure TpgUsuario.btnSalvarClick(Sender: TObject);
begin
  inherited;
  try
    case FTypeOperation of
      toNull: exit;
      toPost: begin
        FDAO.Post;
        ShowMessage('Usu�rio adicionado !');
      end;
      toPut: begin
        FDAO.Put;
        ShowMessage('Usu�rio atualizado !');
      end;
    end;
    FTypeOperation := toNull;
    ToggleDBGrid;
  except on E: exception do
    ShowMessage(E.Message);
  end;
end;

end.

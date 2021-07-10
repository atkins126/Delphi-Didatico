unit Bind4D.Attributes;

interface

uses
  Bind4D.Types, System.UITypes, Vcl.Graphics, Data.DB, System.Classes;

type

  {$region 'Validation Attributes'}
  fvNotNull = class(TCustomAttribute)
  private
    FMsg: String;
    FKey : String;
    procedure SetMsg(const Value: String);
  public
    constructor Create(aMsg : String);
    property Msg : String read FMsg write SetMsg;
  end;
  {$endregion}

  {$region 'Form Attributes'}
  FormDefault = class(TCustomAttribute)
    private
    FTitle: String;
    FKey : String;
    procedure SetTitle(const Value: String);
    public
      constructor Create ( aTitle : String = '' );
      property Title : String read FTitle write SetTitle;
  end;

  FormRest = class(TCustomAttribute)
    private
    FPK: String;
    FEndPoint: String;
    FOrder: String;
    FSort: String;
    FKey : String;
    procedure SetEndPoint(const Value: String);
    procedure SetPK(const Value: String);
    procedure SetOrderBy(const Value: String);
    procedure SetSort(const Value: String);
    public
      constructor Create(aEndPoint : String = ''; aPK : String = ''; aSort : String = ''; aOrder : String = 'asc');
      property EndPoint : String read FEndPoint write SetEndPoint;
      property PK : String read FPK write SetPK;
      property Order : String read FOrder write SetOrderBy;
      property Sort : String read FSort write SetSort;
  end;
  {$endregion}

   {$region 'Services Attributes'}
  S3Storage = class(TCustomAttribute)
    private
    FFileExtension: String;
    FContentType: String;
    FKey : String;
    procedure SetContentType(const Value: String);
    procedure SetFileExtension(const Value: String);
    public
      constructor Create(aFileExtension : String; aContentType : String);
      property ContentType : String read FContentType write SetContentType;
      property FileExtension : String read FFileExtension write SetFileExtension;
  end;

  Translation = class(TCustomAttribute)
    private
      FQuery: String;
      FKey : String;
    procedure SetQuery(const Value: String);
    public
      constructor Create(aQuery : String);
      property Query : String read FQuery write SetQuery;
  end;
  {$endregion}

  {$region 'Components Attributes'}

  AdjustResponsive = class(TCustomAttribute)
    private
      FKey : String;
    public
      constructor Create;
  end;

  ImageAttribute = class(TCustomAttribute)
    private
      FDefaultResourceImage: String;
      FWidth: Integer;
      FHeigth: Integer;
      FKey : String;
      procedure SetDefaultResourceImage(const Value: String);
      procedure SetHeigth(const Value: Integer);
      procedure SetWidth(const Value: Integer);
    public
      constructor Create( aDefaultResourceImage : String; aWidth : Integer = 32; aHeigth : Integer = 32);
      property DefaultResourceImage : String read FDefaultResourceImage write SetDefaultResourceImage;
      property Width : Integer read FWidth write SetWidth;
      property Heigth : Integer read FHeigth write SetHeigth;
    end;

  ComponentBindStyle = class(TCustomAttribute)
    private
    FFontSize: Integer;
    FColor: TColor;
    FFontColor: TColor;
    FFontName: String;
    FEspecialType: TEspecialType;
    FKey : String;
    procedure SetColor(const Value: TColor);
    procedure SetFontColor(const Value: TColor);
    procedure SetFontSize(const Value: Integer);
    procedure SetFontName(const Value: String);
    procedure SetEspecialType(const Value: TEspecialType);
    public
      constructor Create(aColor : TColor = clBtnFace; aFontSize : Integer = 12; aFontColor : TColor = clBtnFace; aFontName : String = 'Tahoma'; aEspecialType : TEspecialType = teNull);
      property Color : TColor read FColor write SetColor;
      property FontSize : Integer read FFontSize write SetFontSize;
      property FontColor : TColor read FFontColor write SetFontColor;
      property FontName : String read FFontName write SetFontName;
      property EspecialType : TEspecialType read FEspecialType write SetEspecialType;
  end;

  ComponentBindFormat = class(TCustomAttribute)
    private
    FEspecialType: TEspecialType;
    FKey : String;
    procedure SetEspecialType(const Value: TEspecialType);
    public
      constructor Create(aEspecialType : TEspecialType = teNull);
      property EspecialType : TEspecialType read FEspecialType write SetEspecialType;
  end;
  {$endregion}

  {$region 'Json Attributes'}
  FieldJsonBind = class(TCustomAttribute)
  private
    FJsonName: string;
    FKey : String;
    procedure SetJsonName(const Value: string);
  public
    constructor Create(aJsonName: string);
    property JsonName : string read FJsonName write SetJsonName;
  end;

  FbIgnorePut = class(TCustomAttribute)
    private
      FKey : String;
    public
      constructor Create;
  end;

  FbIgnorePost = class(TCustomAttribute)
    private
      FKey : String;
    public
      constructor Create;
  end;

  FbIgnoreDelete = class(TCustomAttribute)
    private
      FKey : String;
    public
      constructor Create;
  end;

  FbIgnoreGet = class(TCustomAttribute)
    private
      FKey : String;
    public
      constructor Create;
  end;
  {$endregion}

   {$region 'DataSet Attributes'}
  FieldDataSetBind = class(TCustomAttribute)
    private
    FFieldName: String;
    FFDType: TFieldType;
    FDisplayName: String;
    FWidth: Integer;
    FVisible: Boolean;
    FAlignment: TAlignment;
    FEditMask: String;
    FFLimitWidth: Integer;
    FKey : String;
    procedure SetFieldName(const Value: String);
    procedure SetDisplayName(const Value: String);
    procedure SetWidth(const Value: Integer);
    procedure SetVisible(const Value: Boolean);
    procedure SetAlignment(const Value: TAlignment);
    procedure SetEditMask(const Value: String);
    procedure SetFieldType(const Value: TFieldType);
    procedure SetFLimitWidth(const Value: Integer);
    public
      constructor Create(aFieldName : String; aFdType : TFieldType; aVisible : Boolean = True; aWidth : Integer = 0; aDisplayName : String = ''; aEditMask : String = ''; aAlignment : TAlignment = taLeftJustify; aLimitWidth : Integer = 0);
      property FieldName : String read FFieldName write SetFieldName;
      property Width : Integer read FWidth write SetWidth;
      property DisplayName : String read FDisplayName write SetDisplayName;
      property Visible : Boolean read FVisible write SetVisible;
      property Alignment : TAlignment read FAlignment write SetAlignment;
      property EditMask : String read FEditMask write SetEditMask;
      property FDType : TFieldType read FFDType write SetFieldType;
      property FLimitWidth : Integer read FFLimitWidth write SetFLimitWidth;
  end;
  {$endregion}


implementation

uses
  System.SysUtils;
{ fvNotNull }

constructor fvNotNull.Create(aMsg: String);
begin
  FMsg := aMsg;
  FKey := TGuid.NewGuid.ToString;
end;

procedure fvNotNull.SetMsg(const Value: String);
begin
  FMsg := Value;
end;

{ FormDefault }

constructor FormDefault.Create(aTitle: String);
begin
  FTitle := aTitle;
  FKey := TGuid.NewGuid.ToString;
end;

procedure FormDefault.SetTitle(const Value: String);
begin
  FTitle := Value;
end;

{ FormRest }

constructor FormRest.Create(aEndPoint, aPK, aSort, aOrder: String);
begin
  FEndPoint := aEndPoint;
  FPK := aPK;
  FOrder := aOrder;
  FSort := aSort;
  FKey := TGuid.NewGuid.ToString;
end;

procedure FormRest.SetEndPoint(const Value: String);
begin
  FEndPoint := Value;
end;

procedure FormRest.SetOrderBy(const Value: String);
begin
  FOrder := Value;
end;

procedure FormRest.SetPK(const Value: String);
begin
  FPK := Value;
end;

procedure FormRest.SetSort(const Value: String);
begin
  FSort := Value;
end;

{ Translation }

constructor Translation.Create(aQuery : String);
begin
  FQuery := aQuery;
  FKey := TGuid.NewGuid.ToString;
end;

procedure Translation.SetQuery(const Value: String);
begin
  FQuery := Value;
end;

{ S3Storage }

constructor S3Storage.Create(aFileExtension : String; aContentType : String);
begin
  FFileExtension := aFileExtension;
  FContentType := aContentType;
  FKey := TGuid.NewGuid.ToString;
end;

procedure S3Storage.SetContentType(const Value: String);
begin
  FContentType := Value;
end;

procedure S3Storage.SetFileExtension(const Value: String);
begin
  FFileExtension := Value;
end;

{ ComponentBindFormat }

constructor ComponentBindFormat.Create(aEspecialType: TEspecialType);
begin
  FEspecialType := aEspecialType;
  FKey := TGuid.NewGuid.ToString;
end;

procedure ComponentBindFormat.SetEspecialType(const Value: TEspecialType);
begin
  FEspecialType := Value;
end;

{ ComponentBindStyle }

constructor ComponentBindStyle.Create(aColor: TColor; aFontSize: Integer;
  aFontColor: TColor; aFontName: String; aEspecialType: TEspecialType);
begin
  FColor := aColor;
  FFontSize := aFontSize;
  FFontColor := aFontColor;
  FFontName := aFontName;
  FEspecialType := aEspecialType;
  FKey := TGuid.NewGuid.ToString;
end;

procedure ComponentBindStyle.SetColor(const Value: TColor);
begin
  FColor := Value;
end;

procedure ComponentBindStyle.SetEspecialType(const Value: TEspecialType);
begin
  FEspecialType := Value;
end;

procedure ComponentBindStyle.SetFontColor(const Value: TColor);
begin
  FFontColor := Value;
end;

procedure ComponentBindStyle.SetFontName(const Value: String);
begin
  FFontName := Value;
end;

procedure ComponentBindStyle.SetFontSize(const Value: Integer);
begin
  FFontSize := Value;
end;

{ ImageAttribute }

constructor ImageAttribute.Create( aDefaultResourceImage : String; aWidth : Integer = 32; aHeigth : Integer = 32);
begin
  FDefaultResourceImage := aDefaultResourceImage;
  FWidth := aWidth;
  FHeigth := aHeigth;
  FKey := TGuid.NewGuid.ToString;
end;

procedure ImageAttribute.SetDefaultResourceImage(const Value: String);
begin
  FDefaultResourceImage := Value;
end;

procedure ImageAttribute.SetHeigth(const Value: Integer);
begin
  FHeigth := Value;
end;

procedure ImageAttribute.SetWidth(const Value: Integer);
begin
  FWidth := Value;
end;

{ FieldJsonBind }

constructor FieldJsonBind.Create(aJsonName: string);
begin
  FJsonName := aJsonName;
  FKey := TGuid.NewGuid.ToString;
end;

procedure FieldJsonBind.SetJsonName(const Value: string);
begin
  FJsonName := Value;
end;

{ FieldDataSetBind }

constructor FieldDataSetBind.Create(aFieldName: String; aFdType: TFieldType;
  aVisible: Boolean; aWidth: Integer; aDisplayName, aEditMask: String;
  aAlignment: TAlignment; aLimitWidth: Integer);
begin
  FFieldName := aFieldName;
  FWidth := aWidth;
  FDisplayName := aDisplayName;
  FVisible := aVisible;
  FAlignment := aAlignment;
  FEditMask := aEditMask;
  FFdType := aFdType;
  FLimitWidth := aLimitWidth;
  FKey := TGuid.NewGuid.ToString;
end;

procedure FieldDataSetBind.SetAlignment(const Value: TAlignment);
begin
  FAlignment := Value;
end;

procedure FieldDataSetBind.SetDisplayName(const Value: String);
begin
  FDisplayName := Value;
end;

procedure FieldDataSetBind.SetEditMask(const Value: String);
begin
  FEditMask := Value;
end;

procedure FieldDataSetBind.SetFieldName(const Value: String);
begin
  FFieldName := Value;
end;

procedure FieldDataSetBind.SetFieldType(const Value: TFieldType);
begin
  FFDType := Value;
end;

procedure FieldDataSetBind.SetFLimitWidth(const Value: Integer);
begin
  FFLimitWidth := Value;
end;

procedure FieldDataSetBind.SetVisible(const Value: Boolean);
begin
  FVisible := Value;
end;

procedure FieldDataSetBind.SetWidth(const Value: Integer);
begin
  FWidth := Value;
end;

{ AdjustResponsive }

constructor FbIgnorePut.Create;
begin
  FKey := TGuid.NewGuid.ToString;
end;

constructor AdjustResponsive.Create;
begin
  FKey := TGuid.NewGuid.ToString;
end;

constructor FbIgnorePost.Create;
begin
  FKey := TGuid.NewGuid.ToString;
end;

{ FbIgnoreGet }

constructor FbIgnoreGet.Create;
begin
  FKey := TGuid.NewGuid.ToString;
end;

constructor FbIgnoreDelete.Create;
begin
  FKey := TGuid.NewGuid.ToString;
end;

end.

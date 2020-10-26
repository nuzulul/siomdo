unit about;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,shellapi,lclintf,fileinfo,winpeimagereader,elfreader,machoreader;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    StaticText1: TStaticText;
    stVersion: TStaticText;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure StaticText1Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.StaticText1Click(Sender: TObject);
begin
  //if ShellExecute(0,nil, PChar('http://bit.ly/siomdotts'),nil,nil,0) =0 then;
  OpenURL('http://bit.ly/siomdotts');
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  //if ShellExecute(0,nil, PChar('http://bit.ly/siomdotts'),nil,nil,0) =0 then;
  OpenURL('http://bit.ly/siomdotts');
end;

procedure TForm2.FormCreate(Sender: TObject);
var
FileVerInfo: TFileVersionInfo;
BuildDate:string;
begin
  FileVerInfo:=TFileVersionInfo.Create(nil);
  BuildDate := {$I %DATE%};
  try
    FileVerInfo.ReadFileInfo;
    stversion.Caption:= FileVerInfo.VersionStrings.Values['FileVersion']+' - '+BuildDate;
  finally
    FileVerInfo.Free;
  end;
end;

procedure TForm2.Label4Click(Sender: TObject);
var
path:string;
begin
  path:=ExtractFileDir(paramstr(0));
  if ShellExecute(0,nil,PChar(path+'\Lisensi.txt'),nil,nil,1) =0 then;
end;

end.


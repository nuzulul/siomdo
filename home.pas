unit home;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  about, windows;

type

  { TForm1 }

  TForm1 = class(TForm)
    btOmong: TButton;
    btSimpan: TButton;
    btClose: TButton;
    btAbout: TButton;
    bttest: TButton;
    btclear: TButton;
    Image1: TImage;
    Label1: TLabel;
    mmLayar: TMemo;
    sdAudio: TSaveDialog;
    procedure btAboutClick(Sender: TObject);
    procedure btclearClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btOmongClick(Sender: TObject);
    procedure btSimpanClick(Sender: TObject);
    procedure bttestClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

function GetTempFile(const Extension: string): string;
var Buffer: array[0..MAX_PATH] OF Char;
begin
  repeat
    GetTempPath(Sizeof(Buffer)-1, Buffer);
    GetTempFileName(Buffer, '~', 0, Buffer);
    Result := ChangeFileExt(Buffer, Extension);
  until not FileExists(result);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Color:=clBlue;
SetWindowLongPtr(Self.Handle, GWL_EXSTYLE,GetWindowLongPtr(Self.Handle, GWL_EXSTYLE) or WS_EX_LAYERED);
SetLayeredWindowAttributes(Self.Handle, clBlue, 0, LWA_COLORKEY);
end;

procedure TForm1.btCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.btOmongClick(Sender: TObject);
var
  myfile: textfile;
  temp,path:string;
begin
  temp:=GetTempFile('.~tp');
  path:=ExtractFileDir(paramstr(0));
  assignfile(myfile,temp);
  rewrite(myfile);
  writeln(myfile,mmLayar.Lines.Text);
  closefile(myfile);
  if ShellExecute(0,nil, PChar(path+'\SiomdoCLI'),PChar('--file="'+temp+'"'),nil,0) =0 then;
end;

procedure TForm1.btSimpanClick(Sender: TObject);
var
  myfile: textfile;
  temp,path,output:string;
begin
  if sdAudio.Execute then begin
    temp:=GetTempFile('.~tp');
    path:=ExtractFileDir(paramstr(0));
    output:=sdAudio.FileName;
    assignfile(myfile,temp);
    rewrite(myfile);
    writeln(myfile,mmLayar.Lines.Text);
    closefile(myfile);
    if ShellExecute(0,nil, PChar(path+'\SiomdoCLI'),PChar('--file="'+temp+'" --save --output="'+output+'"'),nil,0) =0 then;
  end;
end;

procedure TForm1.bttestClick(Sender: TObject);
begin
  mmLayar.Clear;
  mmLayar.Lines.AddText('Aku Siomdo alias si omong doang, salam kenal');
  btOmong.Click;
end;

procedure TForm1.btAboutClick(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.btclearClick(Sender: TObject);
begin
  mmLayar.Clear;
end;

end.


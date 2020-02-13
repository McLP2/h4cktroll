unit h4ck;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    Timer2: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    function RandomString(): String;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  ProgressBar1.Position := ProgressBar1.Position + 1;
  Label1.Caption:='Hacking Pentagon... '+IntToStr(ProgressBar1.Position)+'%';
  if ProgressBar1.Position = 100 then begin
    ProgressBar1.Position := 0;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
  if Random(20) < 1 then begin
    Label2.Font.Color:=clLime;
    Label2.Caption := 'Found Next Key: ' + RandomString();
    Timer2.Interval:=1000;
  end else begin
    Label2.Font.Color:=clWhite;
    Label2.Caption := 'Checking Passkey: ' + RandomString();
    Timer2.Interval:=100;
  end;
end;

function TForm1.RandomString: String;
var
  i: integer;
  c: Char;
begin
  for i := 0 to Random(17)+3 do begin
    c := chr(Random(100)+40);
    RandomString := RandomString + c;
  end;
end;

end.


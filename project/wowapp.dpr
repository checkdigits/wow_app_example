program wowapp;

uses
  System.StartUpCopy,
  FMX.Forms,
  Skia.FMX,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

begin
  GlobalUseSkia := True;

  //For macOS/iOS
//  GlobalUseMetal := True;

  // GPU is priorty everywhere but Windows,
  // this line improves Windows shader performance
  GlobalUseSkiaRasterWhenAvailable := False;

  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

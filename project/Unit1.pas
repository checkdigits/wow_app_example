unit Unit1;

//
// Example of creating a 'cool' UI with Skia controls and FireMonkey effects
// Written by Ian Barker.
// https://about.me/IanBarker
// Email: ian.barker@gmail.com
// https://blogs.embarcadero.com/author/ianbarker/
//

interface
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Layouts, FMX.Ani, FMX.Objects, System.Skia, FMX.Skia,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    VertScrollBox1: TVertScrollBox;
    HeaderLayout: TLayout;
    lbCity: TSkLabel;
    SkLabel1: TSkLabel;
    CurrentWeatherAnimation: TSkAnimatedImage;
    MainLayout: TLayout;
    MainAnimation: TSkAnimatedImage;
    lblSplashText: TSkLabel;
    SkLabel2: TSkLabel;
    SkLabel3: TSkLabel;
    SkLabel4: TSkLabel;
    SkLabel5: TSkLabel;
    SkSvg1: TSkSvg;
    SkSvg2: TSkSvg;
    SkSvg3: TSkSvg;
    SkLabel6: TSkLabel;
    SkSvg4: TSkSvg;
    SkLabel7: TSkLabel;
    SkSvg5: TSkSvg;
    SkSvg6: TSkSvg;
    SkLabel8: TSkLabel;
    SkLabel9: TSkLabel;
    SkLabel10: TSkLabel;
    SkSvg7: TSkSvg;
    SkLabel11: TSkLabel;
    SkSvg8: TSkSvg;
    SkSvg9: TSkSvg;
    SkLabel12: TSkLabel;
    SkLabel13: TSkLabel;
    SkLabel14: TSkLabel;
    SkSvg10: TSkSvg;
    SkLabel15: TSkLabel;
    SkSvg11: TSkSvg;
    SkSvg12: TSkSvg;
    SkLabel16: TSkLabel;
    SkLabel17: TSkLabel;
    SkLabel18: TSkLabel;
    SkSvg13: TSkSvg;
    SkLabel19: TSkLabel;
    SkSvg14: TSkSvg;
    SkSvg15: TSkSvg;
    SkLabel20: TSkLabel;
    SkLabel21: TSkLabel;
    SkLabel22: TSkLabel;
    SkSvg16: TSkSvg;
    SkLabel23: TSkLabel;
    SkSvg17: TSkSvg;
    SkSvg18: TSkSvg;
    SkLabel24: TSkLabel;
    SkLabel25: TSkLabel;
    SkLabel26: TSkLabel;
    SkSvg19: TSkSvg;
    SkLabel27: TSkLabel;
    SkSvg20: TSkSvg;
    SkSvg21: TSkSvg;
    SkLabel28: TSkLabel;
    SkLabel29: TSkLabel;
    StaticAnimation: TSkAnimatedImage;
    MainPanelEffect: TFloatAnimation;
    CurrentWeatherAnimationEffect: TFloatAnimation;
    StaticAnimationEffect: TFloatAnimation;
    MainAnimationEffect: TFloatAnimation;
    MainPanel: TRectangle;
    StyleBook1: TStyleBook;
    CloseButton: TSpeedButton;
    procedure MainAnimationAnimationFinished(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MainPanelEffectFinish(Sender: TObject);
    procedure StaticAnimationEffectFinish(Sender: TObject);
    procedure MainAnimationEffectFinish(Sender: TObject);
    procedure DoNextAnimation;
    procedure CloseButtonClick(Sender: TObject);
    procedure CloseButtonMouseEnter(Sender: TObject);
    procedure CloseButtonMouseLeave(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation
uses System.Threading;

{$R *.fmx}
{$R *.iPhone47in.fmx IOS}

{ TForm1 }

procedure TForm1.MainPanelEffectFinish(Sender: TObject);
begin
  CurrentWeatherAnimation.Visible := True;
end;

procedure TForm1.StaticAnimationEffectFinish(Sender: TObject);
begin
  MainPanel.Visible               := True;
end;

procedure TForm1.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.CloseButtonMouseEnter(Sender: TObject);
begin
  CloseButton.Opacity := 1;
end;

procedure TForm1.CloseButtonMouseLeave(Sender: TObject);
begin
  CloseButton.Opacity := 0.2;
end;

procedure TForm1.DoNextAnimation;
var
 aTask: ITask;
begin
  // Keep the UI responsive, while we wait 1 second...
  // We use a Task thread to do this
   aTask := TTask.Create(
         procedure
         begin
           Sleep(1000);
           // We're going to update the UI - so we need to do that synchronized to the main thread...
           TThread.Synchronize(TThread.Current,
             procedure
             begin
               MainAnimation.Enabled           := False;
               MainAnimationEffect.Start;
               end);
           end);
   aTask.Start;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  // On mobile devices the panel needs to be nearer the edge
  // We use views manually optimized for our intended device targets to
  // make sure that it looks GOOD on all targets
  {$IF DEFINED(IOS) or DEFINED(ANDROID)}
  FloatAnimation1.StopValue := 7;
  {$ENDIF}
end;

procedure TForm1.MainAnimationAnimationFinished(Sender: TObject);
begin
  DoNextAnimation;
end;

procedure TForm1.MainAnimationEffectFinish(Sender: TObject);
begin
  MainAnimation.Visible           := False;
  StaticAnimation.Visible         := True;
end;

end.

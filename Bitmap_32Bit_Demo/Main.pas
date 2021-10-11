{—————————————————————————————————————————————————————————————————————————}
{ Project : Demo.dpr                                                      }
{ Comment :                                                               }
{                                                                         }
{    Date : 05/04/2009 00:03:35                                           }
{  Author : Cirec http://www.delphifr.com/auteur/CIREC/311214.aspx        }
{—————————————————————————————————————————————————————————————————————————}
{ Last modified                                                           }
{    Date : 18/04/2009 12:38:24                                           }
{  Author : Cirec http://www.delphifr.com/auteur/CIREC/311214.aspx        }
{—————————————————————————————————————————————————————————————————————————}
unit Main;     

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtDlgs, jpeg, ExtCtrls, ComCtrls;

type
  TFrm_Main = class(TForm)
    img_BkGround: TImage;
    img_ForeGround: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    btnChangeImg: TButton;
    tkb_Opacity: TTrackBar;
    ckb_NoAlpha: TCheckBox;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    ckb_Center: TCheckBox;
    ckb_Proportional: TCheckBox;
    ckb_Stretched: TCheckBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    btn_ChangeBkgImg: TButton;
    ckb_bkNoAlpha: TCheckBox;
    tkb_bkOpacity: TTrackBar;
    ckb_bkCenter: TCheckBox;
    ckb_bkProportional: TCheckBox;
    ckb_bkStretched: TCheckBox;
    Label3: TLabel;
    ckb_Transparent: TCheckBox;
    ckb_bkTransparent: TCheckBox;
    Image1: TImage;
    procedure btnChangeImgClick(Sender: TObject);
    procedure tkb_OpacityChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ckb_NoAlphaClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Frm_Main: TFrm_Main;

implementation

{$R *.dfm}
uses crBitmap32;

procedure TFrm_Main.btnChangeImgClick(Sender: TObject);
var MemFilter: string;
    aImg: TImage;
begin
  MemFilter := OpenPictureDialog1.Filter;
  aImg := img_ForeGround;
  if TComponent(Sender).Tag > 4 then
    aImg := img_BkGround
  else
    OpenPictureDialog1.Filter := 'Bitmap (*.bmp)|*.bmp';
  if OpenPictureDialog1.Execute then
  begin
    aImg.Picture.LoadFromFile(OpenPictureDialog1.FileName);
    tkb_OpacityChange(Sender);
    ckb_NoAlphaClick(Sender);
  end;
  OpenPictureDialog1.Filter := MemFilter;
end;

procedure TFrm_Main.tkb_OpacityChange(Sender: TObject);
var aImg: TImage;
    aTkb: TTrackBar;
begin
  aImg := img_ForeGround;
  aTkb := tkb_Opacity;
  if TComponent(Sender).Tag > 4 then
  begin
    aImg := img_BkGround;
    aTkb := tkb_bkOpacity;
  end;
  if (aImg.Picture.Graphic is TBitmap) then
    (aImg.Picture.Graphic as TBitmap).Opacity := aTkb.Position;
end;

procedure TFrm_Main.FormCreate(Sender: TObject);
begin
  DoubleBuffered := True;
end;

procedure TFrm_Main.ckb_NoAlphaClick(Sender: TObject);
var aImg: TImage;
begin    
  aImg := img_ForeGround;
  if TComponent(Sender).Tag > 4 then
    aImg := img_BkGround;
  with aImg do
  begin
    case TComponent(Sender).Tag of
      0: begin
           if (Picture.Graphic is TBitmap) then
             (Picture.Graphic as TBitmap).NoAlpha := ckb_NoAlpha.Checked;
         end;
      5: begin
           if (Picture.Graphic is TBitmap) then
             (Picture.Graphic as TBitmap).NoAlpha := ckb_bkNoAlpha.Checked;
         end;
      1, 6: Center := TCheckBox(Sender).Checked;
      2, 7: Proportional := TCheckBox(Sender).Checked;
      3, 8: Stretch := TCheckBox(Sender).Checked;
      4, 9: Transparent := TCheckBox(Sender).Checked;
    end;
    Invalidate;
  end;
end;

end.

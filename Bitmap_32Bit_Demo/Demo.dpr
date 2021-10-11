{—————————————————————————————————————————————————————————————————————————}
{ Project : Demo.dpr                                                      }
{ Comment :                                                               }
{                                                                         }
{    Date : 05/04/2009 00:03:35                                           }
{  Author : Cirec http://www.delphifr.com/auteur/CIREC/311214.aspx        }
{—————————————————————————————————————————————————————————————————————————}
{ Last modified                                                           }
{    Date : 10/04/2009 12:05:46                                           }
{  Author : Cirec http://www.delphifr.com/auteur/CIREC/311214.aspx        }
{—————————————————————————————————————————————————————————————————————————}
program Demo;

uses
  Forms,
  Main in 'Main.pas' {Frm_Main};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFrm_Main, Frm_Main);
  Application.Run;
end.


program LogBook;

uses
  ShareMem,
  Forms,
  SysUtils,
  Windows,
  Dialogs,
  udmMain in 'udmMain.pas' {dmMain: TDataModule},
  uMainWindow in 'uMainWindow.pas' {MainWindow: TForm},
  IniFiles,
  uPluginHeaders,
  ScreenTips,
  ShellApi,
  Controls in 'Controls.pas',
  uPlugins in 'uPlugins.pas',
  uTranslator in 'uTranslator.pas',
  uUtils,
//  CRCUnit,
  uSplashWindow in 'uSplashWindow.pas' {SplashWindow},
  Ping in 'Ping.pas',
  uExchangeQSLServices in 'uExchangeQSLServices.pas' {ExchangeQSLServices},
  uEditBookGroup in 'uEditBookGroup.pas' {EditBookGroup},
  uEditImportRule in 'uEditImportRule.pas' {EditImportRule},
  uImportFromADIFDialog in 'uImportFromADIFDialog.pas' {ImportFromADIFDialog},
  uOptions in 'uOptions.pas' {Options},
  uFieldValueReplace in 'uFieldValueReplace.pas' {FieldValueReplace},
  uCancelDialog in 'uCancelDialog.pas' {CancelDialog};

{$R *.res}


var
 Plugins:TPlugins;
 sLangFileName:string;
 SplashScreen : TSplashWindow;
 lParam,wParam:variant;
 Ini: TIniFile;
 ProfileFile:string;
 RibbonMinimized:boolean;
 i:integer;
 sdDbName:string;
begin
  Application.MainFormOnTaskbar := True;
  SplashScreen := TSplashWindow.Create(Application) ;
  SplashScreen.Show;
  Application.ProcessMessages;
  Application.Initialize;
  SplashScreen.pnlStatus.Caption:='Initialize...';
  DecimalSeparator := '.';
  Application.ProcessMessages;




  Ini:= TIniFile.Create(ExtractFilePath(Application.ExeName)+'LogBook.ini');
  ProfileFile:=Ini.ReadString('Main','ProfileFile','');
  RibbonMinimized:= Ini.ReadBool('Main','RibbonMinimize',True);
  if Trim(ProfileFile)='' then
   begin
      ShowMessage('Error load Profile file');
      Ini.Free;
      Halt;
   end;
  Ini.Free;


//  SplashScreen.Update;
  Plugins:=TPlugins.Create(ExtractFilePath(Application.ExeName)+'Plugins\');

  try
   Application.Title := 'UT4UKW LogBook';
   Application.CreateForm(TdmMain, dmMain);
   dmMain.DBLastModified:=FileLastModified(ExtractFilePath(Application.ExeName)+'Data\Database\LogBook.mdb');
   Ini:= TIniFile.Create(ExtractFilePath(Application.ExeName)+ProfileFile);
   try
    if Ini.ReadString('Options','cbUseDropBox_Checked','')='TRUE' then
     begin
       sdDbName:=Ini.ReadString('Options','deBackupDirectory_Text','')+'\Logbook_backup_auto.zip';
       if FileExists(sdDbName) then
         begin
           dmMain.UnZipper.FileName:=sdDbName;
           if dmMain.UnZipper.Count=0 then
             ShowMessage('Cannot open file - '+sdDbName)
           else
           if dmMain.UnZipper.Items[0].LastModTimeAsDateTime>dmMain.DBLastModified then
            begin
              dmMain.UnZipper.FileName:='';
              CopyFile(ExtractFilePath(Application.ExeName)+'Data\Database\LogBook.mdb',ExtractFilePath(Application.ExeName)+'Data\Database\LogBook.old');
              DeleteFile(PWideChar(ExtractFilePath(Application.ExeName)+'Data\Database\LogBook.mdb'));
              dmMain.UnZipper.FileName:=sdDbName;
              dmMain.UnZipper.BaseDirectory:=ExtractFilePath(Application.ExeName);
              dmMain.UnZipper.ExtractFiles('*.*');
            end;
         end;
     end;
   finally
    Ini.Free;
   end;
  //  Application.CreateForm(TfrmCancelDialog, frmCancelDialog);
//   dmMain.DBCRC:=GetFileCRC(ExtractFilePath(Application.ExeName)+'Data\Database\LogBook.mdb');
   dmMain.DAODatabase.Database:=ExtractFilePath(Application.ExeName)+'Data\Database\LogBook.mdb';

   try
     SplashScreen.pnlStatus.Caption:='Open database...';
     Application.ProcessMessages;
     dmMain.DAODatabase.Open;

     Application.CreateForm(TMainWindow, MainWindow);
     MainWindow.Splash:=SplashScreen;

     MainWindow.rbMain.Minimized:=RibbonMinimized;



     Application.CreateForm(TOptions, Options);
     MainWindow.AppStorage.FileName := ProfileFile;
     Options.GetLangs;
     Options.FormStorage.RestoreFormPlacement;
     MainWindow.FormStorage.RestoreFormPlacement;

     Options.FormStorageOnExit.RestoreFormPlacement;
     if Options.cbLang.Text='' then
        sLangFileName:= ExtractFilePath(Application.ExeName)+ 'Lang\English.lng'
     else
        sLangFileName:= ExtractFilePath(Application.ExeName)+ 'Lang\' + Options.cbLang.Text + '.lng';


     MainWindow.Translator:= TTranslator.Create(sLangFileName);
     Plugins.Translator:=MainWindow.Translator;

     if Options.cbAutoCheckFullUpdate.Checked then
      if FileExists(ExtractFilePath(Application.ExeName)+'Updater.exe') then
           ShellExecute(MainWindow.Handle, 'open', PWideChar(ExtractFilePath(Application.ExeName)+'Updater.exe'), nil, nil, SW_SHOWNORMAL);


{     MainWindow.Translator.TranslateWindow(Options.Name,Options);

     if Options.cbAutoCheckFlashUpdate.Checked then
     begin
       SplashScreen.pnlStatus.Caption:='Check flash update...';
       Application.ProcessMessages;
       MainWindow.CoreCommand(MainWindow.aUpdateFlash);
     end;

     if MainWindow.CallParser.PrefixFile='' then
      begin
         try
            SplashScreen.pnlStatus.Caption:='Loading prefixes...';
            Application.ProcessMessages;
            MainWindow.CallParser.PrefixFile := ExtractFilePath(Application.ExeName) + 'Data\CallInfo\Prefix.lst';
          except
           on E: Exception do
              MessageBox(Application.Handle, PWideChar('Error load prefix file - ' + MainWindow.CallParser.PrefixFile+' : '+E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
           end;
      end;}



     Plugins.OnRegisterWindows:=MainWindow.RegisterWindows;
     Plugins.OnUnRegisterWindow:=MainWindow.UnRegisterWindow;


     MainWindow.Plugins:=Plugins;

     SplashScreen.pnlStatus.Caption:='Open datasets...';
     Application.ProcessMessages;

     dmMain.OpenDatasets;



     SplashScreen.pnlStatus.Caption:='Loading plugins...';
     Application.ProcessMessages;

     MainWindow.LoadPlugins;



     MainWindow.BuildReportsMenu;
     dmMain.GetAllTableForSelect;


     Options.FormStorage.StoredValue['LangId']:=MainWindow.Translator.LangId;
     MainWindow.AppStorage.WriteInteger('MainWindow\LangId',MainWindow.Translator.LangId);
     Options.RegisterPluginsSettings;


     MainWindow.GetDescktopFiles;
     MainWindow.cbProfile.ItemIndex:=MainWindow.cbProfile.Items.IndexOf(Copy(ProfileFile,1,Pos('.',ProfileFile)-1));
     MainWindow.CurrentProfile:=Copy(ProfileFile,1,Pos('.',ProfileFile)-1);

     MainWindow.Translator.TranslateWindow(MainWindow.Name,MainWindow);
     MainWindow.SortWindowList;



     MainWindow.Translator.TranslateWindow(Options.Name,Options);

//     dmMain.DAODatabase.Commit;


     if Options.cbAutoCheckFlashUpdate.Checked then
     begin
       SplashScreen.pnlStatus.Caption:='Check flash update...';
       Application.ProcessMessages;
       MainWindow.CoreCommand(MainWindow.aUpdateFlash);
     end;

     if MainWindow.CallParser.PrefixFile='' then
      begin
         try
            SplashScreen.pnlStatus.Caption:='Loading prefixes...';
            Application.ProcessMessages;
            MainWindow.CallParser.PrefixFile := ExtractFilePath(Application.ExeName) + 'Data\CallInfo\Prefix.lst';
          except
           on E: Exception do
              MessageBox(Application.Handle, PWideChar('Error load prefix file - ' + MainWindow.CallParser.PrefixFile+' : '+E.Message), PWideChar(Options.msgError.Caption), MB_OK or MB_ICONERROR);
           end;
      end;




     if Options.cbLoadManagers.Checked then
     begin
     if dmMain.cdsManagers.IsEmpty then
      begin
        SplashScreen.pnlStatus.Caption:='Loading managers...';
        Application.ProcessMessages;
        MainWindow.LoadManagers;
      end;
     end;


     MainWindow.Translator.TranslateWindow(MainWindow.Name,dmMain);
     for i:=0 to dmMain.qryStations.FieldCount-1 do
      begin
          Options.mdsStations.Fields[i].DisplayLabel:=dmMain.qryStations.Fields[i].DisplayLabel;
      end;


    except
    on E:Exception do
     begin
      ShowMessage(E.Message);
     end;
    end;
  finally
    SplashScreen.Hide;
    SplashScreen.Free;
    MainWindow.Splash:=nil;
    Application.Run;
    if MainWindow<>nil then
     if MainWindow.Translator<>nil then
       MainWindow.Translator.Free;
    Plugins.UnRegisterWindows;
    Options.UnRegisterPluginsSettings;
    MainWindow.Plugins:=nil;
    Plugins.DeInitialize;
    dmMain.CloseDatasets;
    dmMain.DAODatabase.Close;
    Plugins.UnLoad;
    Plugins.Free;
  end;


end.


unit FileVersion;

interface

uses Windows;

type

  TVersion = record
    MajorVersion: Word;
    MinorVersion: Word;
    Release     : Word;
    Build       : Word;
  end;

  TLanguage = packed record
    Name: string;
    Ext : string;
    case Integer of
      0: (LangID, CharsetID: Word);
      1: (Translation:   Longword);
  end;

  TStringFileInfo = record
    Language        : TLanguage;
    CompanyName     : string;
    FileDescription : string;
    FileVersion     : string;
    InternalName    : string;
    LegalCopyright  : string;
    LegalTrademarks : string;
    OriginalFilename: string;
    ProductName     : string;
    ProductVersion  : string;
    Comments        : string;
    PrivateBuild    : string;
    SpecialBuild    : string;
  end;

  Type TFileInfo=Record
         IsFixedFileInfo : Boolean;
         FixedFileInfo   : TVSFixedFileInfo;
         FileVersion     : TVersion;
         StringFileInfo  : TStringFileInfo;
       End;

  Function GetFileInfo(FileName:String; Var FileInfo:TFileInfo):Boolean;

implementation
  Uses sysutils;


  Function GetFileInfo(FileName:String; Var FileInfo:TFileInfo):Boolean;
      var I, J: Integer;
          S: string;

          AFileName: string;

          InfoSize, InfoHandle: DWORD;
          InfoBuf: Pointer;

          ItemBuf: Pointer;
          ItemSize: UINT;

          pDW: PDWORD;
    begin
      Result:=False;
      FileInfo.IsFixedFileInfo := False;
      Finalize(FileInfo.StringFileInfo);

      AFileName := FileName;

      InfoSize := GetFileVersionInfoSize(PChar(AFileName), InfoHandle);

      if InfoSize <> 0 then
        begin
          GetMem(InfoBuf, InfoSize);
          try
            if GetFileVersionInfo(PChar(AFileName), InfoHandle, InfoSize, InfoBuf) then
              begin
                if VerQueryValue(InfoBuf, '\', ItemBuf, ItemSize) then
                  begin
                    FileInfo.FixedFileInfo := PVSFixedFileInfo(ItemBuf)^;
                    FileInfo.IsFixedFileInfo := True;
                  end;

                if VerQueryValue(InfoBuf, '\VarFileInfo\Translation', ItemBuf, ItemSize) then
                  begin
                    pDW := ItemBuf;
                    with FileInfo.StringFileInfo do
                      begin
                        Result:=True;
                        Language.Translation := pDW^;

                        S := Format('\StringFileInfo\%.4x%.4x\', [Language.LangID, Language.CharsetID]);

                        if VerQueryValue(InfoBuf, PChar(S + 'CompanyName'     ), ItemBuf, ItemSize) then
                        CompanyName      := PChar(ItemBuf);

                        if VerQueryValue(InfoBuf, PChar(S + 'FileDescription' ), ItemBuf, ItemSize) then
                        FileDescription  := PChar(ItemBuf);

                        if VerQueryValue(InfoBuf, PChar(S + 'FileVersion'     ), ItemBuf, ItemSize) then
                        FileVersion      := PChar(ItemBuf);

                        if VerQueryValue(InfoBuf, PChar(S + 'InternalName'    ), ItemBuf, ItemSize) then
                        InternalName     := PChar(ItemBuf);

                        if VerQueryValue(InfoBuf, PChar(S + 'LegalCopyright'  ), ItemBuf, ItemSize) then
                        LegalCopyright   := PChar(ItemBuf);

                        if VerQueryValue(InfoBuf, PChar(S + 'LegalTrademarks' ), ItemBuf, ItemSize) then
                        LegalTrademarks  := PChar(ItemBuf);

                        if VerQueryValue(InfoBuf, PChar(S + 'OriginalFilename'), ItemBuf, ItemSize) then
                        OriginalFilename := PChar(ItemBuf);

                        if VerQueryValue(InfoBuf, PChar(S + 'ProductName'     ), ItemBuf, ItemSize) then
                        ProductName      := PChar(ItemBuf);

                        if VerQueryValue(InfoBuf, PChar(S + 'ProductVersion'  ), ItemBuf, ItemSize) then
                        ProductVersion   := PChar(ItemBuf);

                        if VerQueryValue(InfoBuf, PChar(S + 'Comments'        ), ItemBuf, ItemSize) then
                        Comments         := PChar(ItemBuf);

                        if FileInfo.IsFixedFileInfo then
                          begin
                            if FileInfo.FixedFileInfo.dwFileFlags and VS_FF_PRIVATEBUILD <> 0 then
                            if VerQueryValue(InfoBuf, PChar(S + 'PrivateBuild'), ItemBuf, ItemSize) then
                            PrivateBuild := PChar(ItemBuf);

                            if FileInfo.FixedFileInfo.dwFileFlags and VS_FF_SPECIALBUILD <> 0 then
                            if VerQueryValue(InfoBuf, PChar(S + 'SpecialBuild'), ItemBuf, ItemSize) then
                            SpecialBuild := PChar(ItemBuf);
                          end;
                      end;
                  end;
              end; // if GetFileVersionInfo
          finally
            FreeMem(InfoBuf);
          End;
        end;// if InfoSize <> 0
      with FileInfo do
        begin
          FileVersion.MajorVersion := HIWORD(FixedFileInfo.dwFileVersionMS);
          FileVersion.MinorVersion := LOWORD(FixedFileInfo.dwFileVersionMS);
          FileVersion.Release      := HIWORD(FixedFileInfo.dwFileVersionLS);
          FileVersion.Build        := LOWORD(FixedFileInfo.dwFileVersionLS);
        end;
    end;
end.

unit ScorpioDB;

interface
uses ADODB, Classes, DB;

// —писок, содержащий имена переменных и значени€ в текстовом виде
type TVarsList = class(TStringList)
     private

     public
        function Add(name: string; value:string): Integer; overload;
        constructor Create;
end;

type TMyADOConnection=class(TADOConnection)
     public
     constructor Create(AOwner:TComponent; connString:WideString);
end;

type TMyADOQuery=class(TADOQuery)
     private
        Fvarprefix:char;
        FVarsReplaced:boolean;
        procedure FindAndReplaceAllinSQL(fromstr,tostr:string);  // ѕоиск и замены всех вхождений fromstr в SQL-запрос
     public
        vars:TVarsList;                   // —писок переменных, которые перед выполнением запроса которые провер€ютс€ в запросе SQL и замен€ютс€ на значени€
        property varprefix:char read Fvarprefix write FVarPrefix; // ѕрефикс, который определ€ет, что за ней переменна€
        property varsReplaced:boolean read FVarsReplaced;     // ‘лаг того, что переменные в SQL-запросе преобразованы
         constructor Create(AOwner:TComponent; conn:TADOConnection);
         destructor Destroy;
         procedure Open;
         function ExecSQL: Integer;
         procedure AddParameter(name:string;Datatype:TFieldType;value:variant);
         procedure Clear;
         procedure ReplaceVars;               // ѕреобразование всех переменных в запросе в значени€
end;

implementation

uses
  SysUtils;

{ TMyADOConnection }

constructor TMyADOConnection.Create(AOwner: TComponent; connString:widestring);
begin
     inherited Create(Aowner);
     connectionString:=connString;
     KeepConnection:=false;
     LoginPrompt:=false;
end;

{ TMyADOQuery }

procedure TMyADOQuery.AddParameter(name: string; Datatype: TFieldType;
  value: variant);
begin
    self.Parameters.ParamByName(name).DataType:=Datatype;
    self.Parameters.ParamByName(name).Value:=value;
end;

procedure TMyADOQuery.Clear;
begin
     self.SQL.Clear;
     self.Parameters.Clear;
     self.vars.Clear;
end;

constructor TMyADOQuery.Create(AOwner: TComponent; conn: TADOConnection);
begin
  inherited Create(AOwner);
  Connection:=conn;
  vars:=TVarsList.Create;
  varprefix:='@';
end;

destructor TMyADOQuery.Destroy;
begin
     FreeAndNil(vars);
     inherited;
end;

function TMyADOQuery.ExecSQL: Integer;
begin
     if not self.VarsReplaced then self.ReplaceVars;
     result:=inherited ExecSQL;
     self.FVarsReplaced:=false;
end;

procedure TMyADOQuery.FindAndReplaceAllinSQL(fromstr, tostr: string);
var
  I: Integer;
begin
     for I := 0 to self.SQL.Count - 1 do begin
         SQL[i]:=StringReplace(SQL[i],fromstr,tostr,[rfReplaceAll,rfIgnoreCase]);
     end;
end;

procedure TMyADOQuery.Open;
begin
     if not self.VarsReplaced then self.ReplaceVars;
     inherited Open;
     self.FVarsReplaced:=false;
     Last;
     First;
end;

procedure TMyADOQuery.ReplaceVars;
var
  I: Integer;
  varname: string;
  varval: string;
begin
     for I := 0 to vars.Count-1 do begin
         varname:=self.varprefix+vars.Names[i];
         varval:=vars.ValueFromIndex[i];
         FindAndReplaceAllinSQL(varname,varval);
     end;
     self.FvarsReplaced:=true;
end;

{ TVarList }

function TVarsList.Add(name, value: string): Integer;
var
  str1: string;
begin
     str1:=name+NameValueSeparator+value;
     result:=inherited Add(str1);
end;

constructor TVarsList.Create;
begin
     inherited Create;
     NameValueSeparator:=':';
end;

end.

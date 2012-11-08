unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dbxjson,idhttp;

type
  TForm2 = class(TForm)
    Button1: TButton;
    memo: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure memoDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  obj,jArray:TJsonArray;
  obj2:TJsonobject;
  str:string;
  tam,i:Integer;
  obj3:TJsonPair;
begin
// nueva linea mia
  obj:=TJSONArray.Create;
  obj.Add(1);
  obj.Add(2);
  obj.Add(3);
  obj.Add(4);
  obj.Add('foo');
  obj.AddElement((TJSONArray.Create(TJsonNumber.Create(22))));
  (obj.Get(5) as TJSONArray).Add('carlos adrian');
//se agrego funcionalidad
  //showmessage(obj.ToString);

  //('{"a":1}' as TJsonObject)
  With tidhttp.create do begin
   str:=get('http://localhost/jsontest.php');
  end;
  obj2 := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(str), 0) as TJSONObject;
  //showmessage(obj2.ToString);
  tam:=obj2.Size;

  jArray := (obj2.Get(0) as tjsonpair).JsonValue as TJsonArray; // pair value is an array
  memo.Clear;
  for i:=0 to jArray.Size-1 do
   begin
     obj3:= TJSONObject(jArray.Get(i)).Get(0);
     str:=obj3.JsonValue.Value;

     {memo.Lines.Add(str);
     obj2 := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(str), 0) as TJSONObject;
     str:=obj2.Get(0).JsonValue.Value;}
     memo.lines.Add(str);
   end;


end;

procedure TForm2.memoDblClick(Sender: TObject);
begin
        showmessage('hello world');
        showmessage('hello world2');
		showmessage('hello world3');
		showmessage('hello world4');
		
		showmessage('hello world5');
		showmessage('hello world6');
		
end;



end.

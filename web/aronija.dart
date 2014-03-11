import "dart:html";
import "dart:convert";
import "admin.dart";

void main()
{
  if (admin.CheckAddress()) admin.GenerateEditButtons("json/aronija.json");
  HttpRequest.getString("json/aronija.json").then((String response_text)//name is missing (inline function)
  {
    Map<String, String> content = JSON.decode(response_text);
    (querySelector("#aronija_paragraph") as ParagraphElement).innerHtml = content["p"]; 
  }); 
}
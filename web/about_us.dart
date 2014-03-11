import "dart:html";
import "dart:convert";
import "admin.dart";
void main()
{
  if (admin.CheckAddress()) admin.GenerateEditButtons("json/about_us.json");  
  HttpRequest.getString("json/about_us.json").then((String response_text)//name is missing (inline function)
  {
    Map<String, String> content = JSON.decode(response_text);
    (querySelector("#about_us_paragraph") as ParagraphElement).innerHtml = content["about_us_paragraph"]; 
    (querySelector("#about_us_header") as HeadingElement).innerHtml = content["about_us_header"];
  }); 
}
import "dart:html";
import "dart:convert";


void main()
{
  HttpRequest.getString("json/goji.json").then((String response_text)//name is missing (inline function)
  {
    Map<String, String> content = JSON.decode(response_text);
    (querySelector("#goji_paragraph") as ParagraphElement).innerHtml = content["p"]; 
  }); 
}
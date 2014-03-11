import "dart:html";
import "dart:convert";


void main()
{
  HttpRequest.getString("json/stevia.json").then((String response_text)//name is missing (inline function)
  {
    Map<String, String> content = JSON.decode(response_text);
    (querySelector("#stevia_paragraph") as ParagraphElement).innerHtml = content["p"]; 
  }); 
}
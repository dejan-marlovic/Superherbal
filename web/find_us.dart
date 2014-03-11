import "dart:html";
import "dart:convert";

void main()
{
  HttpRequest.getString("json/find_us.json").then((String response_text)//name is missing (inline function)
  {
    Map<String, String> content = JSON.decode(response_text);
    (querySelector("#find_us_description") as ParagraphElement).innerHtml = content["p"];   
  }); 
}
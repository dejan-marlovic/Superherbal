import "dart:html";
import "dart:convert";


void main()
{
  HttpRequest.getString("json/products.json").then((String response_text)//name is missing (inline function)
  {
    Map<String, String> content = JSON.decode(response_text);
    (querySelector("#products_paragraph") as ParagraphElement).innerHtml = content["p"]; 
  }); 
}
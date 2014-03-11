library TextArea;
import "dart:html";

class TextArea 
{
  TextArea(int rows, int cols)
  {
   _element = new TextAreaElement();  
   _element.cols = cols;
   _element.rows = rows;
   _element.maxLength = 1024;
  }
 TextAreaElement get element => _element;
 TextAreaElement _element;
}
library admin;
import "dart:html";
import "TextArea.dart";

class admin
{
  static void GenerateEditButtons(String filename)
  {
      _jsonValues.clear();
      List<Element> editableItems = document.querySelectorAll(".editable");
      for(Element e in editableItems)
      {
        Rectangle parentRect = e.parent.getBoundingClientRect();
        Rectangle rect = e.getBoundingClientRect();
        double elemRight = rect.left + rect.width - parentRect.left;
        ButtonElement editButton = new ButtonElement();
        editButton.innerHtml = "..";
        editButton.style.top = (rect.top - parentRect.top).toString() + "px";
        editButton.style.left = (elemRight - 10).toString() + "px";  
        editButton.id="edit_button";
        editButton.onClick.listen((_) => CreatePropertyWindow(e, filename));
        e.parent.children.add(editButton);
        String elemValue = "";
        
        if (e is SpanElement)
        {
          elemValue = e.innerHtml;
        }
        else if (e is ImageElement)
        {
          elemValue = e.src;
        }  
        else if (e is AnchorElement)
        {
          elemValue = e.href;
        }
        if (elemValue != "") _jsonValues.putIfAbsent(e.id, () => elemValue);
      }
  }
  
  static bool CheckAddress()
  {
    String location = window.location.toString();
    int index = location.indexOf("?", 0);
    if ((index >= 0) && (location.substring(index+1, location.length) == "admin")) 
    {
     return true;
    }
    return false;
  }
  
  static void CreatePropertyWindow(Element e, String filename)
  {
    FormElement form = new FormElement();
    form.action = "http://85.229.11.226/superherbal/contentparser.php"; 
    form.method = "POST";
    SubmitButtonInputElement buttonSave = new SubmitButtonInputElement();
    ButtonElement buttonClose = new ButtonElement();
    buttonClose.text = "Close";
    buttonSave.value = "Save";
    _propertyWindow.id = "property_window";
    buttonClose.onClick.listen((Event e)
    { 
      e.preventDefault();
      _propertyWindow.children.clear(); 
      document.body.children.remove(querySelector("#fullscreen"));
    });
    
    Element elem;
    if (e is SpanElement)
    {
     TextArea textArea = new TextArea(5,60);
     textArea.element.value = e.innerHtml;
     elem = textArea.element;
    }
    else if (e is ImageElement)
    {
      TextArea textArea = new TextArea(5,60);
      textArea.element.value = e.src;
      elem = textArea.element;
    }  
    else if (e is AnchorElement)
    {
      TextArea textArea = new TextArea(5,60);
      textArea.element.value = e.href;
      elem = textArea.element;
    }
    
    /*
    switch(e.nodeName)
    {      
      case "IMG":
        InputField inputField = new InputField();
        inputField.elem.value = (e as ImageElement).src;
        elem = inputField.elem;
        break;       
      case "A":
        InputField linkInputField = new InputField();
        linkInputField.elem.value = (e as AnchorElement).href;
        elem = linkInputField.elem;;
        break;
      default:
        break;
    }
    */
    if (elem != null)
    {
      form.children.add(elem);
      if (elem is TextAreaElement) (elem as TextAreaElement).name = e.id;
    } 
    HiddenInputElement filenameInput = new HiddenInputElement();
    filenameInput.value = filename;
    filenameInput.name = "filename";
    form.children.add(filenameInput);
    form.children.add(buttonSave);
    form.children.add(buttonClose);
    _propertyWindow.children.add(form);
    
    DivElement fullscreen = new DivElement();
    fullscreen.id = "fullscreen";
    fullscreen.children.add(_propertyWindow);
    document.body.children.add(fullscreen);
  }
  
  static Map<String, String> _jsonValues = new Map<String, String>();
  static DivElement _propertyWindow = new DivElement();
}



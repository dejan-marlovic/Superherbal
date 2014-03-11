library admin;
import "dart:html";
import "Input.dart";
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
        editButton.innerHtml = "edit";
        editButton.style.position = "absolute";
        editButton.style.top = (rect.top - parentRect.top - 5).toString() + "px";
        editButton.style.left = (elemRight - 60).toString() + "px";  
        editButton.onClick.listen((_) => CreatePropertyWindow(e, filename));
        editButton.style.zIndex = "99";
        e.parent.children.add(editButton);
        String elemValue = "";
        switch (e.nodeName)
        {
          case "P":
            elemValue = (e as ParagraphElement).innerHtml;
            break;
            
          case "H3":
            elemValue = (e as HeadingElement).innerHtml;
            break;
            
          case "IMG":
            elemValue = (e as ImageElement).src;
            break;
          
          default:
            break;
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
    form.action = "http://www.appfoundry.se/superherbal/fileserver.php"; 
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
    
    switch(e.nodeName)
    {
      case "H3":
        InputField headingInputField = new InputField();
        headingInputField.elem.value = (e as HeadingElement).innerHtml;
        elem = headingInputField.elem;
        break;
      case "P":
        TextArea textArea = new TextArea(25,60);
        textArea.element.value = (e as ParagraphElement).innerHtml;
        elem = textArea.element;
        break;      
      case "IMG":
        InputField inputField = new InputField();
        inputField.elem.value = (e as ImageElement).src;
        elem = inputField.elem;
        break;       
      default:
        break;
    }
    
    if (elem != null)
    {
      form.children.add(elem);
      if (elem is TextAreaElement) (elem as TextAreaElement).name = e.id;
      else if (elem is InputElement) (elem as InputElement).name = e.id;
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



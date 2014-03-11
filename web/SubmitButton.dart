import "dart:html";
import "dart:core";
import "dart:convert" show UTF8, JSON;



class SubmitButton 
{
  SubmitButton(String id)
  {
    _buttonElement = querySelector(id); 
    _buttonElement.onClick.listen(SubmitForm); 
    _request = null;
  }
  
  void SubmitForm(Event e)
  {
    e.preventDefault();
    _request = new HttpRequest();
    _request.onReadyStateChange.listen(OnData);
    _request.open("POST", "http://appfoundry.se/");//"http://127.0.0.1:4040");
    //String from email input Contact Us
    String from = ((querySelector("#email_input") as InputElement).value);
    //Text area input contact us
    String message = ((querySelector("#message_area") as TextAreaElement).value);
    Map <String, String> formData = {"from":from, "message":message};
    String formDataJsonString = JSON.encode(formData);
    //_request.send((querySelector('#message_area') as TextAreaElement).value);
    _request.send(formDataJsonString);
   }
  
  void OnData(Event e)
  {
    if (_request.readyState == HttpRequest.DONE && _request.status == 200)
    {
      print(_request.responseText);
    }
  }
  InputElement get buttonElement => _buttonElement;
  InputElement _buttonElement;
  HttpRequest  _request;
}

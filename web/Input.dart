import "dart:html";

abstract class Input
{
  InputElement get elem => _elem;
  InputElement _elem;
}

class InputField extends Input
{
  InputField()
  {
    _elem = new TextInputElement();
    _elem.maxLength  = 1024;
  }
}


import "dart:html";
class Slider
{
  Slider(Element button_previous, Element button_next)
  {
    button_next.onClick.listen(ShowNext);
    button_previous.onClick.listen(ShowPrevious);
    _slides = querySelectorAll(".slide");    
    _slideIndex = 0;
    _HideAll();
    _slides.first.hidden = false;
  }
  void _HideAll()
  {
    for (Element e in _slides)
    {
      e.hidden = true;
    }
  }

  void ShowNext(Event e)
  {
    _HideAll();
    _slideIndex++;
    if (_slideIndex >= _slides.length)
    {
      _slides.last.style.animation = "slide_out_right 1s";
      _slides.last.hidden = false;
      _slides.last.style.animationFillMode = "forwards";
      _slideIndex = 0; 
    }    
    else
    {
      _slides[_slideIndex-1].style.animation = "slide_out_right 1s";
      _slides[_slideIndex-1].hidden = false;
      _slides.last.style.animationFillMode = "forwards";
    }
  
    _slides[_slideIndex].style.animation = "slide_in_right 1s";
    _slides[_slideIndex].hidden = false;
  }
  void ShowPrevious(Event e)
  {
    _HideAll();
    _slideIndex--;
    if (_slideIndex < 0)
    {
      _slideIndex = _slides.length-1;
      _slides[_slideIndex].style.animation = "slide_in_left 1s";
      _slides[_slideIndex].hidden = false;
      _slides[_slideIndex].style.animationFillMode = "forwards";
      _slides[0].style.animation = "slide_out_left 1s";
      _slides[0].style.animationFillMode = "forwards";
      
    }
    else
    {
      _slides[_slideIndex].style.animation = "slide_in_left 1s";
      _slides[_slideIndex].style.animationFillMode = "forwards";
      _slides[_slideIndex].hidden = false;
      _slides[_slideIndex+1].style.animation = "slide_out_left 1s";
      _slides[_slideIndex+1].style.animationFillMode = "forwards";  
      _slides[_slideIndex+1].hidden = false;
    }
  }
  int _slideIndex;
  List<DivElement> _slides;
}
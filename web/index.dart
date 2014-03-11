import "dart:html";
import "admin.dart";

void main()
{
  if (admin.CheckAddress())
  {
    (querySelector("#main_window") as IFrameElement).src += "?admin";
    UListElement nav = querySelector("#nav");
    UpdateLinks(nav, "?admin");
  }
}

void UpdateLinks(UListElement ul, String ext)
{
  for (Element li in ul.children)
  {
    for (Element e in li.children)
    {
      if (e is AnchorElement) e.href += ext;
      else if (e is UListElement) UpdateLinks(e, ext); 
    }
  }
}

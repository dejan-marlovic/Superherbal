import "dart:io";
import "dart:convert";


void main()
{
  HttpServer.bind("127.0.0.1", 4040).then(GotMessage);
}

void GotMessage(_server)
{
  _server.listen(OnListen);
}

void OnListen(HttpRequest request)
{
   if (request.method == "POST")
  {
    //nameless method with parameter buffer
    request.listen(/**/(List<int> buffer)
    {    
      print(UTF8.decode(buffer));
      File out = new File("json/about_us.json");
      var sink = out.openWrite();
      sink.write(UTF8.decode(buffer));
      sink.close();
      /*
      new File("json/about_us.json").writeAsString(UTF8.decode(buffer), mode:FileMode.WRITE, encoding:UTF8);
      */
    });
  }
}

/*
void AddCorsHeaders(HttpResponse res)
{
    res.headers.add('Access-Control-Allow-Origin', '*, ');
    res.headers.add('Access-Control-Allow-Methods', 'POST, OPTIONS');
    res.headers.add('Access-Control-Allow-Headers',
    'Origin, X-Requested-With, Content-Type, Accept');
}
*/
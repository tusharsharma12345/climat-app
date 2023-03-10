import 'package:http/http.dart' as http;
import 'dart:convert';
class NetworkHelper{
  NetworkHelper(this.url);
  final String url;
  Future getData() async{
    var response = await http.get(Uri.parse(url));
    print('Response status: ${response.statusCode}');
    if(response.statusCode==200) {
      print('Response body: ${response.body}');
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
    }
    else{
      print(response.statusCode);
    }
  }
}

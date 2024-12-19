import 'dart:convert';
import 'package:http/http.dart';

class NetworkHelper {

  NetworkHelper({
    required this.url,
   
  });

  final String url;

  Future<dynamic> getData() async {

      final parseUrl = Uri.parse(url);

      final res = await get(parseUrl);

      if(res.statusCode == 200){
         
          return jsonDecode(res.body);

      } else {
        print(res.statusCode);
      }

  }

}
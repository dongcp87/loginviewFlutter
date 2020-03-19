import 'package:dio/dio.dart';
class LoginService {
  // final url = 'https://stg-sec-sso.click-sec.com/loginweb/tool-redirect?s=09&p=82';
  final url = 'https://jsonplaceholder.typicode.com/albums/1';

  Future<String> login(String username, String password) async {
    // final params = {
    //   'j_username': username,
    //   'j_password': password,
    //   's': '09',
    //   'p': '75',
    //   'LoginForm': 'Login'
    // };
    // try {
    //   final response = await http.get(url);
    //   return response.body;
    // } catch (e) {
    //   return e.toString();
    // }

    
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {

      }
      print(response);
    } on DioError catch(e) {
      var mess = e.type;
      print("e.message: $mess");
    }
    return "";
  }
}

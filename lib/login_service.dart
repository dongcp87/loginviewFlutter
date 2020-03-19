import 'package:dio/dio.dart';
import 'package:loginview/api_response.dart';
class LoginService {
  // final url = 'https://stg-sec-sso.click-sec.com/loginweb/tool-redirect?s=09&p=82';
  final url = 'https://jsonplaceholder.typicode.com/albums/1';

  Future<APIResponse<String>> login(String username, String password) async {
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
        return APIResponse(ResponseStatus.success, null, null);
      } else {
        return APIResponse(ResponseStatus.httpErr, null, null);
      }
    } on DioError catch(e) {
      if (e.type == DioErrorType.DEFAULT) {
        return APIResponse(ResponseStatus.connectionErr, null, null);
      } else if (e.type == DioErrorType.CONNECT_TIMEOUT || e.type == DioErrorType.RECEIVE_TIMEOUT || e.type == DioErrorType.SEND_TIMEOUT) {
        return APIResponse(ResponseStatus.connectionErr, null, null);
      } else if (e.type == DioErrorType.RESPONSE) {
        return APIResponse(ResponseStatus.httpErr, null, null);
      }
      return APIResponse(ResponseStatus.connectionErr, null, null);
    }
  }
}

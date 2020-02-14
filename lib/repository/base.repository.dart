import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Base {
  String securityToken = null;
  Dio httpClient = null;

  config() async {
    var user = await FirebaseAuth.instance.currentUser();
    var token = await user.getIdToken(refresh: true);
    securityToken = token.token;
    httpClient = Dio();
  }

  Future<dynamic> postRequest(String path, {Map<String, dynamic> map}) async {
    Response response = await httpClient.post(path,
        data: map,
        options: Options(headers: {
          Headers.wwwAuthenticateHeader: securityToken, // set content-length
        }));

    return response.data;
  }
}

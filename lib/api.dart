import 'dart:io';

import 'package:http/http.dart' as http;

class Api {
  Api();

  String apiUrl = 'http://localhost:3000';
  String mqttHost = 'localhost';

  Future doRegister(String cid, String pincode, String telephone) async {
    // localhost:3000/user/save - POST : pincode, cid, telephone, emi
    String _url = '$apiUrl/user/save';

    var body = {
      "cid": cid.toString(),
      "pincode": pincode.toString(),
      "telephone": telephone.toString()
    };

    return await http.post(_url, body: body);
  }

  Future doRequest(String symptom, String lat, String lng, String token) async {
    // localhost:3000/request - POST : symptom, lat, lng
    String _url = '$apiUrl/request';

    var body = {
      "symptom": symptom,
      "lat": lat.toString(),
      "lng": lng.toString()
    };

    return await http.post(_url,
        body: body,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
  }

  Future updateLatLng(String lat, String lng, String token) async {
    // localhost:3000/request/update-latlng - POST : lat, lng
    String _url = '$apiUrl/request/update-latlng';

    var body = {"lat": lat.toString(), "lng": lng.toString()};

    return await http.post(_url,
        body: body,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
  }

  Future getStatus(String token) async {
    // localhost:3000/request/status - POST : token
    String _url = '$apiUrl/request/status';
    return await http
        .get(_url, headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
  }

  Future doLoginPincode(String cid, String pincode,
      [String deviceToken]) async {
    // localhost:3000/user/login - POST : pincode, cid
    String _url = '$apiUrl/user/login';

    var body = {
      "cid": cid.toString(),
      "pincode": pincode.toString(),
      "deviceToken": deviceToken.toString() ?? ''
    };

    return await http.post(_url, body: body);
  }
}

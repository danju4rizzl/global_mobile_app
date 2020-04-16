// import 'package:http/http.dart';
import 'dart:convert';

import 'package:http/http.dart';

class GlobalTime {
  String location; // location name for the UI
  String time; // The time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint

  GlobalTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      // make the request
      Response response =
          await get('https://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // print(now);

      // set the time property
      time = now.toString();
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get time data';
    }
  }
}

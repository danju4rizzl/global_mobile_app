// import 'package:http/http.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart' as intl;

class GlobalTime {
  String location; // location name for the UI
  String time; // The time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDayTime; // True or False if daytime or not

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
      isDayTime = now.hour > 6 && now.hour < 19 ? true : false;
      time = intl.DateFormat.jm().format(now);
    } catch (e) {
      print('Caught error: $e');
      time = 'Could not get time data';
    }
  }
}

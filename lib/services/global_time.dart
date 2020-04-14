import 'package:http/http.dart';
import 'dart:convert';

class GlobalTime {

  String location; // location name for the UI
  String time; // The time in that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint

  GlobalTime({this.location, this.flag, this.url});

 Future<void> getTIme() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/Africa/$url');
    Map data = jsonDecode(response.body);
//      print(data);

//      Get properties from data

    String dateTime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);
//    print(dateTime);
//    print(offset);
//      Create a dateTime Object to make it readable to users

    DateTime now = DateTime.parse(dateTime);
    now = now.add(Duration(hours: int.parse(offset)));


    // Sets the time property
    time = now.toString();
  }
}

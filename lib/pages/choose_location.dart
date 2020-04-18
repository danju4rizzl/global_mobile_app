import 'package:flutter/material.dart';
import 'package:globaltime/services/global_time.dart';

// TODO Use the package country_list_pick after the tutorial from https://pub.dev/packages/country_list_pick to get all countrys flags
class ChooseLoacation extends StatefulWidget {
  @override
  _ChooseLoacationState createState() => _ChooseLoacationState();
}

class _ChooseLoacationState extends State<ChooseLoacation> {
  List<GlobalTime> locations = [
    GlobalTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    GlobalTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    GlobalTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    GlobalTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    GlobalTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    GlobalTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    GlobalTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    GlobalTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    GlobalTime instance = locations[index];
    await instance.getTime();

    // now we can navigate to the home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flat': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () {
                  // print(locations[index].location);
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

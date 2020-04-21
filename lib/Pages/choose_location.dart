import 'package:flutter/material.dart';
import 'package:worldtimeapp/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locactions = [
    WorldTime(url: 'Asia/Dhaka', flag: 'dhaka.png', location: 'Dhaka'),
    WorldTime(url: 'Asia/Dubai', flag: 'dhaka.png', location: 'Dubai'),
    WorldTime(url: 'Europe/Copenhagen', flag: 'dhaka.png', location: 'Denmark'),
    WorldTime(url: 'Asia/Famagusta', flag: 'dhaka.png', location: 'Famagusta'),
    WorldTime(url: 'Asia/Gaza', flag: 'dhaka.png', location: 'Gaza'),
  ];

  void updateTime(index) async {
    WorldTime worldTime = locactions[index];
    await worldTime.getTime();
    Navigator.pop(context, {
      'location': worldTime.location,
      'flag': worldTime.flag,
      'time': worldTime.time,
      'isDayTime': worldTime.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locactions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locactions[index].location),
                leading: CircleAvatar(
//                  backgroundImage: AssetImage('assets/usa.png'),
                  radius: 20,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

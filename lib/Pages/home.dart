import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String backgroundImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color backgroundColor =
        data['isDayTime'] ? Colors.blue : Colors.indigo[700];
    Color themeColor = data['isDayTime'] ? Colors.black : Colors.grey[300];
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$backgroundImage'),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic newLocation =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': newLocation['time'],
                        'location': newLocation['location'],
                        'flag': newLocation['flag'],
                        'isDayTime': newLocation['isDayTime'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: themeColor,
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(color: themeColor),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                          fontSize: 28, letterSpacing: 2, color: themeColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  data['time'],
                  style: TextStyle(fontSize: 60, color: themeColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

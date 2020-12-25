import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChooseLoc extends StatefulWidget {
  @override
  _ChooseLocState createState() => _ChooseLocState();
}

class _ChooseLocState extends State<ChooseLoc> {
  List<WorldTime> locations = [
    WorldTime(url: 'Asia/Kolkata', loc: 'Kolkata', flag: 'india.png'),
    WorldTime(url: 'Europe/London', loc: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', loc: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', loc: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', loc: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', loc: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', loc: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', loc: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', loc: 'Jakarta', flag: 'indonesia.png'),
  ];

  void updateTime(index) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: SpinKitWave(
          color: Colors.white,
          size: 50,
          ),
          );
        });
    WorldTime ins = locations[index];
    await ins.getTime();
    Navigator.pop(context);
    Navigator.pop(context, {
      'curLoc': ins.loc,
      'curTime': ins.time,
      'curFlag': ins.flag,
      'isDayTime': ins.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              child: ListTile(
                onTap: () {
                  updateTime(index);
                },
                title: Text(locations[index].loc),
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            ),
          );
        },
      ),
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose location'),
        centerTitle: true,
        elevation: 0,
      ),
    );
  }
}

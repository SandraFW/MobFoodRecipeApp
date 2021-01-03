import 'package:flutter/material.dart';
import 'drawer.dart';

class NotificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Notifications"),
        backgroundColor: Colors.redAccent,
      ),
      endDrawer: InkWellDrawer(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(top: 32.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.only(top: 22.0, left: 42.0, right: 42.0),
                  child: Center(child: Text('No Notification to show ')),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

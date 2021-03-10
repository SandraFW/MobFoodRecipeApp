import 'package:flutter/material.dart';
import 'package:flutter_application_6/widgets/drawer.dart';
import 'package:flutter_application_6/widgets/messaging_widget.dart';
import 'package:flutter_application_6/models/message.dart';

class NotificationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Notifications"),
        backgroundColor: Colors.redAccent,
      ),
      endDrawer: InkWellDrawer(),
      body: MessagingWidget(),
    );
  }
}

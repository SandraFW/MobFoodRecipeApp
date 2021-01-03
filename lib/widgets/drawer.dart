import 'package:flutter/material.dart';
import 'package:screentwo/screens/add_new_recipe.dart';
import 'package:screentwo/screens/saved_page.dart';
import 'profile_view.dart';
import 'notification.dart';
import 'login.dart';
import 'saved_page.dart';
import 'logout.dart';
import 'add_new_recipe.dart';
import 'edit_profile.dart';

class InkWellDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext ctxt) {
    return new Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: <Color>[Colors.redAccent, Colors.red])),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image.asset("images/profileimg.png",
                            height: 90, width: 90),
                      ),
                    ),
                  ],
                ),
              )),
          CustomListTile(
              Icons.person,
              'Profile',
              () => {
                    Navigator.pop(ctxt),
                    Navigator.push(
                        ctxt,
                        new MaterialPageRoute(
                            builder: (ctxt) => new ProfileFirst()))
                  }),
          CustomListTile(
              Icons.post_add,
              'Add new Post',
              () => {
                    Navigator.pop(ctxt),
                    Navigator.push(
                        ctxt,
                        new MaterialPageRoute(
                            builder: (ctxt) => new AddNewRecipe()))
                  }),
          CustomListTile(
              Icons.list,
              'My Posts',
              () => {
                    Navigator.pop(ctxt),
                    Navigator.push(
                        ctxt,
                        new MaterialPageRoute(
                            builder: (ctxt) => new ProfileFirst()))
                  }),
          CustomListTile(
              Icons.save,
              'Saved Posts',
              () => {
                    Navigator.pop(ctxt),
                    Navigator.push(
                        ctxt,
                        new MaterialPageRoute(
                            builder: (ctxt) => new SavedPage()))
                  }),
          CustomListTile(
              Icons.notifications,
              'Notification',
              () => {
                    Navigator.pop(ctxt),
                    Navigator.push(
                        ctxt,
                        new MaterialPageRoute(
                            builder: (ctxt) => new NotificationView()))
                  }),
          CustomListTile(Icons.settings, 'Settings', () => {}),
          CustomListTile(
              Icons.lock,
              'Log Out',
              () => {
                    Navigator.pop(ctxt),
                    Navigator.push(
                        ctxt,
                        new MaterialPageRoute(
                            builder: (ctxt) => new Logout()))
                  }),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onTap;

  CustomListTile(this.icon, this.text, this.onTap);
  @override
  Widget build(BuildContext context) {
    //ToDO
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade400))),
        child: InkWell(
            splashColor: Colors.orangeAccent,
            onTap: onTap,
            child: Container(
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(icon),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                        Text(
                          text,
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Icon(Icons.arrow_right)
                  ],
                ))),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final imagrurl =
        "https://media-exp2.licdn.com/dms/image/C4D03AQHdFZLMEpqAUw/profile-displayphoto-shrink_800_800/0/1653640692672?e=1660780800&v=beta&t=P7ReQhob475LvwBy-LDh7uDN6Js8sa1NlV0Eap2aHms";

    return Drawer(
      child: Container(
        color: context.canvasColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: context.canvasColor),
                    margin: EdgeInsets.zero,
                    accountEmail: Text(
                      "amitbaliyan071@gmail.com",
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Colors.black),
                    ),
                    accountName: Text(
                      "amit_baliyan",
                      textScaleFactor: 1.2,
                      style: TextStyle(color: Colors.black),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(imagrurl),
                    ))),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.black,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.2,
                // style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.black,
              ),
              title: Text(
                "profile",
                textScaleFactor: 1.2,
                // style: TextStyle(color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.black,
              ),
              title: Text(
                "Email me",
                textScaleFactor: 1.2,
                // style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

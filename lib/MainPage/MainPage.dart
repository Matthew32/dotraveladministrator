import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:flutter/material.dart';
import 'Controller/MainPageController.dart';

/// Class for view MainPage
class MainPage extends StatefulWidget {
  MainPage({Key key, this.title, this.email}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final String email;

  @override
  MainPageState createState() => MainPageState(title, email);
}

class MainPageState extends StateMVC {
  final String title;
  final String email;
  MainPageController _con;

  ///Constructor to set up the controller, the  title and keep the email from the login Page
  MainPageState(this.title, this.email) : super(MainPageController()) {
    this._con = MainPageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
          child: new Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
            new RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.blue,
              onPressed: () {
                _con.passToFormDate(context, email);
              },
              child: new Text("Add"),
            ),
          ]))),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: DecoratedBox(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                image: AssetImage('graphics/background.png'),
                // ...
              ))),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Report'),
              onTap: () {
                //go to report page

                _con.passToReportPage(context, email);
              },
            ),
          ],
        ),
      ),
    );
  }
}

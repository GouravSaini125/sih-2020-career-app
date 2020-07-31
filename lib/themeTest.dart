import 'package:flutter/material.dart';
import 'package:hello/configs.dart';
import 'package:hello/yt.dart';
import 'package:provider/provider.dart';

class ThemeTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Theme Test",
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 50.0,
              ),
              child: Text(
                "Hello World!",
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            RaisedButton(
              onPressed: () {
                Provider.of<Config>(context, listen: false).toggleTheme();
              },
              child: Text(
                "Toggle",
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Yt()));
              },
              child: Text(
                "YT",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

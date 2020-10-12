import 'package:flutter/material.dart';

class NavigatorPane extends StatefulWidget {
  @override
  _NavigatorPaneState createState() => _NavigatorPaneState();
}

class _NavigatorPaneState extends State<NavigatorPane> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Card(
      child: Container(
        width: screenWidth,
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 50.0),
        child: Row(
          children: [
            Expanded(
                child: IconButton(
              icon: Icon(
                Icons.search,
              ),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, "/search"),
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.home),
              onPressed: () => Navigator.pushReplacementNamed(context, "/"),
            )),
            Expanded(
                child: IconButton(
              icon: Icon(Icons.info),
              onPressed: () => Navigator.pushReplacementNamed(context, "/info"),
            ))
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBarNav extends StatelessWidget {
  const BottomBarNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Color.fromRGBO(55, 57, 84, 1.0),
            primaryColor: Colors.pinkAccent,
            textTheme: Theme.of(context).textTheme.copyWith(
                caption: TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: IconButton(
                  icon: Icon(
                    Icons.help_outline_rounded,
                    size: 35.0,
                    color: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'helpPage');
                  },
                ),
                // ignore: deprecated_member_use
                title: Container()),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: IconButton(
                  icon: Icon(Icons.home_outlined,
                      size: 35.0, color: Theme.of(context).primaryColor),
                  onPressed: () {
                    Navigator.pushNamed(context, 'home');
                  },
                ),
                // ignore: deprecated_member_use
                title: Container()),
            BottomNavigationBarItem(
                // ignore: deprecated_member_use
                icon: IconButton(
                  icon: Icon(Icons.coffee_outlined,
                      size: 35.0, color: Theme.of(context).primaryColor),
                  onPressed: () {
                    Navigator.pushNamed(context, 'coffePage');
                  },
                ),
                // ignore: deprecated_member_use
                title: Container()),
          ],
        ));
  }
}

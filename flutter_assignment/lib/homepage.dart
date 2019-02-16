library flutter_assignment.homepage;

import 'package:flutter/material.dart';

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
        length: 5,
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Center(child: Text('Home')),
              backgroundColor: Color.fromRGBO(255, 140, 146, 1.0),
            ),
            body: TabBarView(children: [
              Container(
                  child: Center(
                child: Text('Home'),
              )),
              Container(
                  child: Center(
                child: Text('Notify'),
              )),
              Container(
                  child: Center(
                child: Text('Map'),
              )),
              Container(
                  child: Center(
                child: Text('Profile'),
              )),
              Container(
                  child: Center(
                child: Text('Setup'),
              )),
            ]),
            bottomNavigationBar: TabBar(
                tabs: [
                  Tab(
                    icon: Icon(Icons.home),
                  ),
                  Tab(
                    icon: Icon(Icons.notifications),
                  ),
                  Tab(
                    icon: Icon(Icons.map),
                  ),
                  Tab(
                    icon: Icon(Icons.person),
                  ),
                  Tab(
                    icon: Icon(Icons.settings),
                  ),
                ],
                labelColor: Colors.yellow,
                unselectedLabelColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.all(5.0),
                indicatorColor: Colors.red),
//        backgroundColor: Colors.pink[200],
          ),
        ),
      ),
    );
  }
}

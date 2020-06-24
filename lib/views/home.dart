import 'package:flutter/material.dart';
import 'package:travelbudget/services/auth_service.dart';
import 'package:travelbudget/widgets/provider_widget.dart';

import '../models/trip_model.dart';

import '../pages.dart';
import '../views/new_trips/location_view.dart';
import 'ExploreView.dart';
import 'home_view.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeView(),
    ExplorePage(),
    PastTripsPage(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final newTrip = Trip(
        title: null,
        startDate: null,
        endDate: null,
        budget: null,
        travelType: null);

    return Scaffold(
      appBar: AppBar(
        title: Text("Travel Budgeeeeet"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewTripLocationView(
                              trip: newTrip,
                            )));
              }),
          IconButton(
              icon: Icon(Icons.undo),
              onPressed: () async {
                try {
                  AuthService auth = Provider.of(context).auth;
                  await auth.signOut();
                  print("Singed out successfully");
                } catch (error) {
                  print(error);
                }
              }),
        ],
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
          BottomNavigationBarItem(
              icon: Icon(Icons.explore), title: Text("Explore")),
          BottomNavigationBarItem(
              icon: Icon(Icons.history), title: Text("History")),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/trip_model.dart';

class HomeView extends StatelessWidget {
  final List<Trip> _tripsList = [
    Trip(
        title: "New York",
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        budget: 200.0,
        travelType: "Car"),
    Trip(
        title: "Dubai",
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        budget: 600.0,
        travelType: "Boat"),
    Trip(
        title: "Berlin",
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        budget: 300.0,
        travelType: "Plane"),
    Trip(
        title: "California",
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        budget: 400.0,
        travelType: "Train"),
    Trip(
        title: "Sydney",
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        budget: 500.0,
        travelType: "Boat"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _tripsList.length,
        itemBuilder: (context, i) {
          return buildTripCard(context, i);
        },
      ),
    );
  }

  Widget buildTripCard(BuildContext context, int i) {
    var trip = _tripsList[i];
    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      trip.title,
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0, bottom: 80.0),
                child: Row(
                  children: <Widget>[
                    Text(
                        "${DateFormat('dd/MM/yyyy').format(trip.startDate).toString()} to ${DateFormat('dd/MM/yyyy').format(trip.endDate).toString()}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment
                      .spaceBetween, //can also use a Spacer() widget
                  children: <Widget>[
                    Text(
                      "\$${trip.budget.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 35),
                    ),
                    Icon(Icons.directions_car),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

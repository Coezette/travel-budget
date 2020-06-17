import 'package:flutter/material.dart';
import 'package:travelbudget/models/trip_model.dart';
import 'package:travelbudget/views/new_trips/new_trip_budget_view.dart';

class NewTripDateView extends StatelessWidget {
  final Trip trip;

  NewTripDateView({@required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Trip Dates"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("When will you be travelling?"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Enter Start Date"),
                Text("Enter End Date"),
              ],
            ),
            RaisedButton(
              child: Text("Continue"),
              onPressed: () {
                trip.startDate = DateTime.now();
                trip.endDate = DateTime.now();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewTripBudgetView(trip: trip)));
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:intl/intl.dart';

import 'package:travelbudget/models/trip_model.dart';
import 'package:travelbudget/views/new_trips/new_trip_budget_view.dart';

class NewTripDateView extends StatefulWidget {
  final Trip trip;

  NewTripDateView({@required this.trip});

  @override
  _NewTripDateViewState createState() => _NewTripDateViewState();
}

class _NewTripDateViewState extends State<NewTripDateView> {
  DateTime _startDate = DateTime.now();
  DateTime _endDate = DateTime.now().add(Duration(days: 7));

  Future displayDateRangePicker(BuildContext context) async {
    final List<DateTime> picked = await DateRagePicker.showDatePicker(
      context: context,
      initialFirstDate: _startDate,
      initialLastDate: _endDate,
      firstDate: new DateTime(DateTime.now().year - 20),
      lastDate: new DateTime(DateTime.now().year + 20),
    );
    if (picked != null && picked.length == 2) {
      setState(() {
        _startDate = picked[0];
        _endDate = picked[1];
      });
    }
  }

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
            RaisedButton(
                child: Text("Select Dates"),
                onPressed: () async {
                  await displayDateRangePicker(context);
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                    "from: ${DateFormat('dd/MM/yyyy').format(_startDate).toString()}"),
                Text(
                    "till: ${DateFormat('dd/MM/yyyy').format(_endDate).toString()}"),
              ],
            ),
            RaisedButton(
              child: Text("Continue"),
              onPressed: () {
                widget.trip.startDate = _startDate;
                widget.trip.endDate = _endDate;

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            NewTripBudgetView(trip: widget.trip)));
              },
            )
          ],
        ),
      ),
    );
  }
}

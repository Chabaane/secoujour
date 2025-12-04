import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late List<Appointment> _appointments;

  @override
  void initState() {
    super.initState();
    _appointments = <Appointment>[];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advanced Calendar Page'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SfCalendar(
              view: CalendarView.month,
              initialSelectedDate: DateTime.now(),
              cellBorderColor: Colors.transparent,
              todayHighlightColor: Colors.blue,
              onTap: (CalendarTapDetails details) {
                if (details.targetElement == CalendarElement.calendarCell) {
                  _showAddDialog(details.date!);
                }
              },
              dataSource: AppointmentDataSource(_appointments),
            ),
          ),
          SizedBox(height: 20.0),
          Text('Events', style: Theme.of(context).textTheme.titleLarge
),
          Expanded(
            child: ListView.builder(
              itemCount: _appointments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_appointments[index].subject),
                  subtitle: Text(
                    '${_appointments[index].startTime.day}/${_appointments[index].startTime.month}/${_appointments[index].startTime.year}',
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showAddDialog(DateTime date) {
    TextEditingController _eventController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Add Event"),
          content: TextField(
            controller: _eventController,
            decoration: InputDecoration(
              labelText: 'Event',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Save"),
              onPressed: () {
                setState(() {
                  _appointments.add(
                    Appointment(
                      startTime: date,
                      endTime: date.add(Duration(hours: 1)),
                      subject: _eventController.text,
                      color: Colors.blue,
                    ),
                  );
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class AppointmentDataSource extends CalendarDataSource {
  AppointmentDataSource(List<Appointment> source) {
    appointments = source;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  CalendarPage();
  }
}

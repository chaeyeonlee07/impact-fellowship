import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//void main() => runApp(MyApp());

class Calendar extends StatelessWidget {
  const Calendar({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Calendars(),
    );
  }
}

class Calendars extends StatefulWidget {
  const Calendars({super.key});


  @override
  State<Calendars> createState() => _CalendarsState();
}

class _CalendarsState extends State<Calendars> {

  DateTime today = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Memories",
        ),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w600
        ),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: content(),
      )
    );
  }  
  Widget content() {
    return Column(
      children: [
        Container(
          child: TableCalendar(
            firstDay: DateTime(2024, 1, 1, 0, 0, 0),
            lastDay: DateTime(2030, 1, 1, 0, 0, 0),
            focusedDay: today,
          ),
        )
      ],
    );
  }
 
}

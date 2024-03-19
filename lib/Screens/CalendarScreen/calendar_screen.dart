import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';



class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {


  DateTime today = DateTime.now();


  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: Colors.black,),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Color(0xFFffd7e3),
                Color(0xFFffd7e3),
                Color(0xFFea99a2),
                Color(0xFFea99a2),
              ]
          ),
        ),
        child: Column(
          children: [
            Text("Selected day is " + today.toString().split(' ')[0]),
            TableCalendar(
              locale: "en_US",
              rowHeight: 50,
              focusedDay: today,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day,today),
              firstDay: DateTime.utc(2010,10,16),
                lastDay: DateTime.utc(2050,10,16),
              onDaySelected: _onDaySelected,
            ),
          ],
        ),
      ),
    );
  }
}

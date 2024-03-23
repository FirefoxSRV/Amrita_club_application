import 'package:club_application/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../Models/event.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});
  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime today = DateTime.now();
  List<Event> selectedDayEvents = [];


  void _onDaySelected(DateTime day, DateTime focusedDay){
    setState(() {
      today = day;
    });
    _fetchEventsForDay(day);
  }

  String getOrdinal(int number) {
    if (number >= 11 && number <= 13) {
      return '${number}th';
    }
    switch (number % 10) {
      case 1:
        return '${number}st';
      case 2:
        return '${number}nd';
      case 3:
        return '${number}rd';
      default:
        return '${number}th';
    }
  }
  void _fetchEventsForDay(DateTime day) async {
    var eventsForTheDay = await getEventsForDate(day); // This is a placeholder
    setState(() {
      selectedDayEvents = eventsForTheDay;
    });
  }


  @override
  void initState() {
    super.initState();
    _fetchEventsForDay(today);
  }


  Future<List<Event>> getEventsForDate(DateTime date) async {
    List<Event> allEvents = [
      Event(title: "Event 1", description: "Description of Event 1", date: DateTime.now()),
      Event(title: "Event 2", description: "Description of Event 2", date: DateTime(2024, 3, 26)),
      Event(title: "Event 3", description: "Description of Event 3", date: DateTime(2024, 3, 27)),
    ];
    return allEvents.where((event) => isSameDay(event.date, date)).toList();
  }




  String formatEventDate(String dateStr) {
    print(dateStr);
    DateTime date = DateTime.parse(dateStr);
    String monthYear = DateFormat('MMMM yyyy').format(date);
    String ordinalDay = getOrdinal(date.day);

    return "$ordinalDay $monthYear";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color(0xFFffd7e3),
              Color(0xFFffd7e3),
            ]
        ),
      ),
      child: Scaffold(
         backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("The Event Calendar",style: GoogleFonts.quicksand(color:Colors.black),),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: Colors.black,),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              color: Colors.transparent,
              child: TableCalendar(
                locale: "en_US",
                rowHeight: 50,
                focusedDay: today,
                headerStyle: HeaderStyle(
                  leftChevronIcon: const Icon(Icons.chevron_left,),
                  titleTextStyle: GoogleFonts.quicksand(fontSize:24,fontWeight:FontWeight.bold),
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarStyle: CalendarStyle(
                    defaultTextStyle: GoogleFonts.quicksand(color:Colors.black),
                    outsideTextStyle:GoogleFonts.quicksand(color:Colors.grey) ,
                    todayTextStyle: GoogleFonts.quicksand(color:Colors.black),
                    todayDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black)
                    ),
                    selectedDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kappBarColor,
                    )
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day,today),
                firstDay: DateTime.utc(2010,10,16),
                lastDay: DateTime.utc(2050,10,16),
                onDaySelected: _onDaySelected,
              ),
            ),
          ],
        ),
        bottomSheet: DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.4,
          minChildSize: 0.4,
          maxChildSize: 1,
          builder: (BuildContext context, ScrollController scrollController) {
            // This boolean will dynamically check if there are events for 'today'
            bool hasEventsForSelectedDay = selectedDayEvents.isNotEmpty;

            return Container(
              decoration: BoxDecoration(
                  color: kappBarColor,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
              ),
              child: ListView(
                controller: scrollController,
                children: [
                  if (hasEventsForSelectedDay)
                    ...selectedDayEvents.map((event) {
                      // Map your events to widgets as needed
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                          Padding(
                            padding:EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Events for "+ formatEventDate(event.date.toString()),style: GoogleFonts.quicksand(color:Colors.black,fontSize:20),),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding:EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03,right:MediaQuery.of(context).size.width*0.03 ),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(child: Text(event.title,style: GoogleFonts.quicksand(color:Colors.black,fontSize:20),)),
                                    Text(event.description,style: GoogleFonts.quicksand(color:Colors.black,fontSize:20),),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      );
                    }).toList()
                  else
                  // Display a message if there are no events for the selected day
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.white,width: 2)
                        ),
                        child: Text(
                          "No events available for this date.",
                          style: GoogleFonts.quicksand(color: Colors.white, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            );
          },
        ),

      ),
    );
  }
}

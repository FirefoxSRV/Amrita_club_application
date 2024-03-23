import 'package:club_application/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
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
          initialChildSize: 0.4, // Initial size of the bottom sheet when built
          minChildSize: 0.4, // Minimum size of the bottom sheet (collapsed state)
          maxChildSize: 1, // Maximum size of the bottom sheet when expanded
          builder: (BuildContext context,ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                color: kappBarColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20))
              ),
              width: MediaQuery.of(context).size.width * 0.98,
              child: ListView.builder(
                shrinkWrap: true,
                controller: scrollController,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
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
                            child: Text("Events for "+ formatEventDate(today.toString().split(' ')[0]),style: GoogleFonts.quicksand(color:Colors.black,fontSize:20),),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding:EdgeInsets.only(left: MediaQuery.of(context).size.width*0.03,right:MediaQuery.of(context).size.width*0.03 ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Switch to weekly view button. Switch to week view. Displays your activities that are scheduled for the selected week. You can designate a 5 Day Weekly format .Switch to weekly view button. Switch to week view. Displays your activities that are scheduled for the selected week. You can designate a 5 Day Weekly format .Switch to weekly view button. Switch to week view. Displays your activities that are scheduled for the selected week. You can designate a 5 Day Weekly format .",style: GoogleFonts.quicksand(color:Colors.black,fontSize:20),),
                          ),
                        ),
                      )
                    ],
                  );
                },

              ),
            );
          },

        ),
      ),
    );
  }
}

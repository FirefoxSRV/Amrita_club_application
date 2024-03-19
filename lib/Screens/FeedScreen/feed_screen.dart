import 'package:club_application/Screens/FeedScreen/Filter/scrollable_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';
import 'Filter/filter_chip.dart';
import 'card_list_view.dart';
import 'feed_card.dart';

enum Windows { news, clubs }
class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  Windows _windows = Windows.news;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var height = constraints.maxHeight;
      var width = constraints.maxWidth;
      return Container(
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
          )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(),
          body: AnimatedSwitcher(
            switchInCurve: Curves.linearToEaseOut,
            switchOutCurve: Curves.decelerate,
            reverseDuration: Duration(milliseconds: 700),
            duration: Duration(milliseconds: 700),
            child: _windows == Windows.news
                ? Center(
                    child: Column(
                      children: [
                        CardListView(width: width, height: height)
                      ],
                    ),
                  )
                : Text("Yeee"),
          ),
          bottomNavigationBar: BottomAppBar(
            height: MediaQuery.of(context).size.height*0.1,
            elevation: 0,
            color: Colors.transparent,
            shape: const CircularNotchedRectangle(),
            child: Container(

              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildBottomNews(),
                    buildBottomClubs(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: Icon(
        Icons.list_sharp,
        color: kappBarContentColor,
        size: 30,
      ),
      title: Text(
        'Amrita Club Hub',
        style: TextStyle(color: kappBarContentColor, fontWeight: FontWeight.w800, fontSize: 20),
      ),
      backgroundColor: kappBarColor,
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        children: [
                          Center(child: Text("Filters",style: GoogleFonts.quicksand(fontSize:24),),),
                          Center(child: FilterChipDemo()),
                        ],
                      ),
                    ), // Your FilterChipDemo widget
                  );
                },
              );
            },
            icon:Icon(Icons.filter_alt_outlined, size: 30,),
            color: kappBarContentColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.calendar_month,
            color: kappBarContentColor,
            size: 30,
          ),
        ),
      ],
    );
  }

  Column buildBottomClubs() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: _windows == Windows.clubs ? kIconColor : kBackgroundColor,
          ),
          width: width*0.195,
          height: height*0.05,
          duration: const Duration(milliseconds: 250),
          child: MaterialButton(
            onPressed: () {
              setState(() {
                _windows = Windows.clubs; // Set state to clubs
              });
            },
            child: Icon(
              FontAwesomeIcons.peopleGroup,
              color: _windows == Windows.clubs ? kBackgroundColor : kIconColor,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }

  Column buildBottomNews() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30.0),
            color: _windows == Windows.news ? kIconColor : kBackgroundColor,
          ),
          duration: const Duration(milliseconds: 250),
          width: width*0.195,
          height: height*0.05,
          child: IconButton(
            onPressed: () {
              setState(() {
                _windows = Windows.news; // Set state to news
              });
            },
            splashRadius: 10.0,
            icon: Icon(FontAwesomeIcons.newspaper),
            color: _windows == Windows.news ? kBackgroundColor : kIconColor,
            splashColor: Colors.black38,
          ),
        ),
      ],
    );
  }
}

import 'package:club_application/Screens/FeedScreen/Filter/scrollable_filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';
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
      return Scaffold(
        backgroundColor: Color(0xFF657e7a),
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
                      ScrollableFilter(height: height,width: width,),
                      CardListView(width: width, height: height)
                    ],
                  ),
                )
              : Text("Yeee"),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: kBackgroundColor,
          shape: const CircularNotchedRectangle(),
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
          child: Icon(
            Icons.notifications,
            color: kappBarContentColor,
            size: 30,
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: _windows == Windows.clubs ? kIconColor : kBackgroundColor,
          ),
          height: 33.0,
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
        Text(
          "Clubs",
          style: GoogleFonts.quicksand(fontSize: 16.0),
        )
      ],
    );
  }

  Column buildBottomNews() {
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
          width: 80.0,
          height: 33.0,
          child: IconButton(
            onPressed: () {
              setState(() {
                _windows = Windows.news; // Set state to news
              });
            },
            splashRadius: 10.0,
            icon: const Icon(FontAwesomeIcons.newspaper, size: 20),
            color: _windows == Windows.news ? kBackgroundColor : kIconColor,
            splashColor: Colors.black38,
          ),
        ),
        Text(
          "News",
          style: GoogleFonts.quicksand(fontSize: 16.0),
        )
      ],
    );
  }
}

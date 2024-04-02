import 'package:club_application/Screens/CalendarScreen/calendar_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';
import '../ClubScreen/club_search_page.dart';
import 'Filter/filter_chip.dart';
import 'card_list_view.dart';
enum Windows { news, clubs }
class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  Windows _windows = Windows.news;
  bool isGDSC = false;
  bool isIETE = false;
  bool isElite = false;
  bool isASCII = false;
  bool isIDEA = false;
  bool isIntelIOT = false;

  void _updateFilterStates(bool isGDSC, bool isIETE,
      bool isElite, bool isASCII, bool isIDEA, bool isIntelIOT) {
      setState(() {
          isGDSC = isGDSC;
          isIETE = isIETE;
          isElite = isElite;
          isASCII = isASCII;
          isIDEA = isIDEA;
          isIntelIOT = isIntelIOT;
          // _handleFilters();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var height = constraints.maxHeight;
      var width = constraints.maxWidth;
      return Container(
        decoration: const BoxDecoration(
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
          drawer: Drawer(
            surfaceTintColor: Colors.amberAccent,
            backgroundColor: kBackgroundColor,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: kappBarColor
                  ),
                  accountName: Text("Shreyas Visweshwaran",style: GoogleFonts.quicksand(color:Colors.black87,fontWeight:FontWeight.w600),),
                  accountEmail: Text("shreyasvisweshwaran@gmail.com",style: GoogleFonts.quicksand(color:Colors.black87,fontWeight:FontWeight.w400),),
                  currentAccountPicture: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "S",
                      style: TextStyle(fontSize: 40.0),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          appBar: buildAppBar(),
          body: Stack(
            children: [
              AnimatedSwitcher(
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
                    : SearchPage()
              ),
              Positioned(left: 10,bottom: 10,right: 10,child: buildBottomNavigationBar())
            ],
          ),
        ),
      );
    });
  }
  Widget buildBottomNavigationBar() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
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
  }


  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        onPressed: (){
          _scaffoldKey.currentState?.openDrawer();
        },
        icon : Icon(Icons.list_sharp,size: 30,),
        color: Colors.black87,
      ),
      title: const Text(
        'Amrita Club Hub',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 20),
      ),
      backgroundColor: Colors.white,
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
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 50,bottom: 50),
                      child: Wrap(
                        children: [
                          Center(child: Text("Filters",style: GoogleFonts.quicksand(fontSize:32),),),
                          SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                          Center(child: FilterChipDemo(isASCII: isASCII,isElite: isElite,isGDSC: isGDSC,isIDEA: isIDEA,isIETE: isIETE,isIntelIOT: isIntelIOT,onUpdateFilterStates: _updateFilterStates,)),
                        ],
                      ),
                    ), // Your FilterChipDemo widget
                  );
                },
              );
            },
            icon:Icon(Icons.filter_alt_outlined, size: 30,color: Colors.black,),
            color: kappBarContentColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return const CalendarScreen();
              }));
            },
            icon:const Icon(Icons.calendar_month,size: 30,),
            color: Colors.black,

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

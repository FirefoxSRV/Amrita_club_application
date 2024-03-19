import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ScrollableFilter extends StatefulWidget {
  ScrollableFilter({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  State<ScrollableFilter> createState() => _ScrollableFilterState(this.height,this.width);
}

class _ScrollableFilterState extends State<ScrollableFilter> {

  _ScrollableFilterState(this.height,this.width);
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      height: height * 0.07,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: width*0.02,),
            FilterClubButton(height:height, width: width,clubTitle: "All",),
            SizedBox(width: width*0.05,),
            FilterClubButton(height:height, width: width,clubTitle: "iDEA",),
            SizedBox(width: width*0.05,),
            FilterClubButton(height:height, width: width,clubTitle: "GDSC",),
            SizedBox(width: width*0.05,),
            FilterClubButton(height:height, width: width,clubTitle: "IETE",),
            SizedBox(width: width*0.05,),
            FilterClubButton(height:height, width: width,clubTitle: "SAE",),
            SizedBox(width: width*0.05,),
            FilterClubButton(height:height, width: width,clubTitle: "Rando",),
            SizedBox(width: width*0.05,),
            FilterClubButton(height:height, width: width,clubTitle: "Rando",),
            SizedBox(width: width*0.05,),
            FilterClubButton(height:height, width: width,clubTitle: "Rando",),


          ],
        ),
      ),
    );
  }
}


class FilterClubButton extends StatefulWidget {
  FilterClubButton({
    super.key,
    required this.height,
    required this.width,
    required this.clubTitle
  });

  final double height;
  final double width;
  final String clubTitle;

  @override
  State<FilterClubButton> createState() => _FilterClubButtonState(this.height,this.width,this.clubTitle);
}

class _FilterClubButtonState extends State<FilterClubButton> {

  _FilterClubButtonState(this.height,this.width,this.clubTitle);
  final double height;
  final double width;
  final String clubTitle;

  late double containerWidth;


  @override
  Widget build(BuildContext context) {
    containerWidth = width*0.2;
    return Padding(
      padding: EdgeInsets.only(top: height*0.01,bottom: height*0.01),
      child: GestureDetector(
        onTap: () {
          setState(() {
            containerWidth = width*0.2;
          });
        },
        child: Container(
          width: containerWidth,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.grey.shade300,),
          child: Center(
            child: Text(
              clubTitle,
              style: GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.w900),
            ),
          ),
        ),
      ),
    );
  }
}



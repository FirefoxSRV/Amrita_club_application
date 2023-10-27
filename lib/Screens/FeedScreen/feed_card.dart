


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedCard extends StatelessWidget {
  const FeedCard({super.key, required this.height, required this.width, required this.imageUrl});

  final double height;
  final double width;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
          decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.blueGrey), borderRadius: BorderRadius.circular(30)),
          height: height * 0.2,
          width: width * 0.8,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Opacity(
                  opacity: 0.2,
                  child: Image.asset(
                    imageUrl,
                    fit: BoxFit.cover,
                    height: height * 0.2,
                    width: width * 0.9,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width*0.03),
                    child: Center(
                        child: Text(
                          "Workshop",
                          style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.w900),
                        )),
                  ),
                  VerticalDivider(
                    width: width*0.1,
                    thickness: 1,
                    color: Colors.black,
                    endIndent: height * 0.03,
                    indent: height * 0.03,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.01),
                        Text("Venue: C102 5:30pm",style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text("Click to register",style: GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: height * 0.01),
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}

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
    var containerHeight = MediaQuery.of(context).size.height;
    var containerWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return OpenMaterialAlertDialog(imageUrl: 'assets/images/club_poster_1.jpg',containerWidth: containerWidth, containerHeight: containerHeight, title: "DJ Night OLAM'22", content: "Acharya Hall, AB1");
            });
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
                    padding: EdgeInsets.only(left: width * 0.03),
                    child: Center(
                        child: Text(
                      "Workshop",
                      style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.w900),
                    )),
                  ),
                  VerticalDivider(
                    width: width * 0.1,
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
                        Text("Venue: C102 5:30pm", style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.bold)),
                        Text("Click to register", style: GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.bold)),
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



class OpenMaterialAlertDialog extends StatelessWidget {
  const OpenMaterialAlertDialog({super.key, required this.imageUrl,required this.containerHeight, required this.containerWidth, required this.title, required this.content});
  final double containerWidth;
  final double containerHeight;
  final String title;
  final String content;
  final String imageUrl;



  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      titlePadding: EdgeInsets.all(0),
      title: Image.asset(
        imageUrl,
        fit: BoxFit.fill,
        height: containerHeight*0.6,
        width: containerWidth,
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: containerWidth*0.8,
          height: containerHeight * 0.1,
          child: Row(
            children: [
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.quicksand(fontSize: 25,fontWeight: FontWeight.w800),
                        ),
                        IconButton(icon:Icon(Icons.keyboard_double_arrow_right,color: Colors.black,size: 50,), onPressed: () {  },)
                      ],
                    ),
                    Divider(thickness: 3,color: Colors.black,indent: containerWidth*0.1,endIndent: containerWidth*0.1,),
                    Text(
                      content,
                      style: GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.normal, color: Theme.of(context).disabledColor),
                    ),
                    SizedBox(height: containerHeight*0.01,),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

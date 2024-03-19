import 'package:animated_text_kit/animated_text_kit.dart';
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
              return OpenMaterialAlertDialog(imageUrl: 'assets/images/club_poster_1.jpg',containerWidth: containerWidth, containerHeight: containerHeight, title: "DJ Night OLAM'22", venue1: "Acharya Hall, AB1",secondScreenContent: "We are delighted to extend an invitation to you for our upcoming workshop,  which is scheduled to take place on [Date] at [Venue]. This workshop promises to be an engaging and insightful event designed to enhance your skills and knowledge more...",venue2: "Acharya Hall, AB1, Amrita School of Engineering",date: "Sat, Noevember 11, 2023",entryFee: "Free",);
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




class OpenMaterialAlertDialog extends StatefulWidget {
  final String imageUrl;
  final double containerHeight;
  final double containerWidth;
  final String title;
  final String venue1;
  final String entryFee;
  final String venue2;
  final String date;
  final String secondScreenContent;

  const OpenMaterialAlertDialog({
    Key? key,
    required this.imageUrl,
    required this.containerHeight,
    required this.containerWidth,
    required this.title,
    required this.venue1,
    // String title, String venue1,String entryFee,String venue2,String date,String secondScreenContent
    required this.entryFee,
    required this.venue2,
    required this.date,
    required this.secondScreenContent,
  }) : super(key: key);

  @override
  _OpenMaterialAlertDialogState createState() => _OpenMaterialAlertDialogState();
}

class _OpenMaterialAlertDialogState extends State<OpenMaterialAlertDialog> {
  int _currentPage = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(0),
      backgroundColor: Theme.of(context).dialogBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      content: Container(
        width: widget.containerWidth,
        height: widget.containerHeight*0.8,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  buildPage1(widget.imageUrl, widget.title, widget.venue1),
                  // String title, String venue1,String entryFee,String venue2,String date,String secondScreenContent

                  // "We are delighted to extend an invitation to you for our upcoming workshop,  which is scheduled to take place on [Date] at [Venue]. This workshop promises to be an engaging and insightful event designed to enhance your skills and knowledge more..."
                  buildPage2(widget.title, widget.venue1,widget.entryFee,widget.venue2,widget.date,widget.secondScreenContent),
                  // Add more pages as needed
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(2, (index) => buildDot(index, context)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage1(String imageUrl, String title, String content) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            imageUrl,
            fit: BoxFit.fill,
            height: widget.containerHeight * 0.6,
            width: widget.containerWidth,
          ),
          SizedBox(height: 10),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(fontSize: 25, fontWeight: FontWeight.w800),
          ),
          Divider(thickness: 3, color: Colors.black, indent: widget.containerWidth * 0.1, endIndent: widget.containerWidth * 0.1),
          Text(
            content,
            style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.normal, color: Theme.of(context).disabledColor),
          ),
          SizedBox(height: widget.containerHeight * 0.04),
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              FadeAnimatedText(
                "<< Slide for more info >>",
                textStyle: GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.normal, color: Theme.of(context).disabledColor),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPage2(String title, String venue1,String entryFee,String venue2,String date,String secondScreenContent) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.quicksand(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            Divider(thickness: 3, color: Colors.black, indent: widget.containerWidth * 0.1, endIndent: widget.containerWidth * 0.1),
            Text(
              venue1,
              style: GoogleFonts.quicksand(fontSize: 18, fontWeight: FontWeight.normal, color: Theme.of(context).disabledColor),
            ),
            SizedBox(height: widget.containerHeight * 0.01),
            Text(
              entryFee,
              style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: widget.containerHeight * 0.03),
            Divider(color: Colors.black,),
            SizedBox(height: widget.containerHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: Icon(Icons.location_on_outlined,color: Colors.black,)),
                Expanded(
                  flex: 3,
                  child: Text(
                    venue2,
                    style: GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.w800,color: Theme.of(context).disabledColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.containerHeight * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(child: Icon(Icons.calendar_month,color: Colors.black,)),
                Expanded(
                  flex: 3,
                  child: Text(
                    date,
                    style: GoogleFonts.quicksand(fontSize: 15, fontWeight: FontWeight.w800,color: Theme.of(context).disabledColor),
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.containerHeight * 0.05),
            Text(secondScreenContent,textAlign: TextAlign.center,style: GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.w500),),
          ],
        ),
      ),
    );
  }



  Widget buildDot(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.black : Colors.grey,
      ),
    );
  }
}
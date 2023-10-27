
import 'package:flutter/cupertino.dart';

import 'feed_card.dart';

class CardListView extends StatelessWidget {
  const CardListView({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(left: width*0.05,right: width*0.05),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 20,),
            FeedCard(
              height: height,
              width: width,
              imageUrl: "assets/images/gdsc.png",
            ),
            SizedBox(height: height * 0.02),
            FeedCard(
              height: height,
              width: width,
              imageUrl: "assets/images/amrita.png",
            ),
            SizedBox(height: height * 0.02),
            FeedCard(
              height: height,
              width: width,
              imageUrl: "assets/images/amrita.png",
            ),
            SizedBox(height: height * 0.02),
            FeedCard(
              height: height,
              width: width,
              imageUrl: "assets/images/amrita.png",
            ),
            SizedBox(height: height * 0.02),
            FeedCard(
              height: height,
              width: width,
              imageUrl: "assets/images/amrita.png",
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class ClubPage extends StatefulWidget {
  const ClubPage({super.key,required this.clubImage,required this.clubName});

  final String clubImage;
  final String clubName;

  @override
  State<ClubPage> createState() => _ClubPageState();
}

class _ClubPageState extends State<ClubPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomSheet: BottomSheet(onClosing: () {

      }, builder: (context){
        return Container(
          decoration: BoxDecoration(color: kappBarColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
          height: MediaQuery.of(context).size.height*0.7,
          width: double.infinity,
          alignment: Alignment.center,
          child: const Text('Permanent Bottom Sheet'),
        );
      }),
      body: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
        height: MediaQuery.of(context).size.height*0.3,
        child: Center(
          child: CircleAvatar(
            radius: 70,
            backgroundImage: NetworkImage(widget.clubImage),
          ),
        ),
      ),
    );
  }
}
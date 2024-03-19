import 'package:club_application/Screens/ClubScreen/Clubmainpage/principal_page.dart';
import 'package:club_application/Screens/ClubScreen/clubs.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});
  @override
  State<SearchPage> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  final searchController = TextEditingController();
  List<Map<String, dynamic>> foundClubs = [];
  @override
  void initState() {
    foundClubs = clubs;
    super.initState();
  }

  void runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = clubs;
    } else {
      results = clubs
          .where((club) => club['clubName']
              .toString()
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundClubs = results;
    });
  }

  Widget searchBar() {
    return TextField(
      controller: searchController,
      onChanged: runFilter,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        hintText: "Search Clubs...",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }

  Widget listTile(int index) {
    final club = foundClubs[index];
    return Container(
      margin: EdgeInsets.only(bottom: 15, left: 10, right: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(club['clubImage']),
        ),
        trailing: IconButton(
            onPressed: () {}, icon: Icon(Icons.arrow_forward_ios_outlined)),
        iconColor: Colors.white,
        title: Text(
          club['clubName'],
          style: (TextStyle(color: Colors.white)),
        ),
        tileColor: const Color.fromARGB(255, 87, 56, 45),
        contentPadding: EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            title: Container(
              child: searchBar(),
            ),
            floating: true,
            snap: true,
            // Other SliverAppBar properties you might want to set
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return listTile(index);
              },
              childCount: foundClubs.length,
            ),
          ),
        ],
      ),
    );
  }
}

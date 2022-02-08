import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  static const String id = "search_screen";

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  bool isEmpty = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 10.0),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: TextField(
                    controller: searchController,
                    onChanged: (text) {
                      setState(() {
                        text.length > 0 ? isEmpty = false : isEmpty = true;
                      });
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: "Search",
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      suffixIcon: isEmpty
                          ? null
                          : GestureDetector(
                              onTap: () {
                                setState(() {
                                  searchController.clear();
                                  isEmpty = true;
                                });
                              },
                              child: Icon(
                                Icons.clear,
                                color: Colors.black,
                              ),
                            ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

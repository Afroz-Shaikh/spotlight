import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:spotlight/constants.dart';
import 'package:spotlight/controllers/search_controller.dart';
import 'package:spotlight/views/screens/profile_screen.dart';

import '../../models/user.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController searchController = Get.put(SearchController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: TextFormField(
            decoration: const InputDecoration(
              filled: false,
              hintText: 'Search',
              hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onFieldSubmitted: (value) =>
                searchController.searchUser(value.toUpperCase()),
          ),
        ),
        body: searchController.searchedUsers.isEmpty
            ? const Center(
                child: Text(
                  'Search for users!',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: searchController.searchedUsers.length,
                itemBuilder: (context, index) {
                  User user = searchController.searchedUsers[index];
                  return InkWell(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(uid: user.uid),
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          user.profilePhoto,
                        ),
                      ),
                      title: Text(
                        user.name,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}

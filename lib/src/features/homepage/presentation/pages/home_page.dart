import 'package:dfs_flutter_application/core/constants/app_color.dart';
import 'package:dfs_flutter_application/core/constants/app_images.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/provider/advisory_page_provider.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/widgets/advertisement_box.dart';
import 'package:dfs_flutter_application/src/features/homepage/presentation/widgets/categories.dart';
import 'package:dfs_flutter_application/src/widgets/app_input_border.dart';
import 'package:dfs_flutter_application/src/widgets/common_single_select_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showSearchvalue = false;
  GlobalKey _menuKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: GestureDetector(
          child: Transform.scale(scale: 0.4, child: const Icon(Icons.abc)),
        ),
        title: const Text('DFS'),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              setState(() {
                showSearchvalue = !showSearchvalue;
              });
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 14.0),
              child: Center(
                child: Icon(Icons.search_sharp),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 14.0),
              child: Center(
                child: true
                    ? Icon(
                        Icons.notifications,
                      )
                    : Badge(
                        child: Icon(
                          Icons.notifications,
                        ), //icon style
                        label: SizedBox(
                          child: Center(
                            child: true
                                ? Text(
                                    'gridScreenController',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                : Text(
                                    '9+',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                          ),
                        ),
                      ),
              ),
            ),
          ),
          PopupMenuButton(
            key: _menuKey,
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              // Handle the selected item here
              switch (value) {
                case 'close':
                  break;
                case 'item1':
                  // Handle item 1
                  break;
                case 'item2':
                  // Handle item 2
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<String>>[
                const PopupMenuItem<String>(
                  value: 'close',
                  child: Text('My Profile'),
                ),
                const PopupMenuItem<String>(
                  value: 'item1',
                  child: Text('Settings'),
                ),
                const PopupMenuItem<String>(
                  value: 'item2',
                  child: Text('Logout'),
                ),
              ];
            },
          ),
          GestureDetector(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Center(
                child: Icon(Icons.person_2_outlined),
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Visibility(
                  visible: showSearchvalue,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: MediaQuery.of(context).size.width * 0.05,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: TextEditingController(),
                            decoration: InputDecoration(
                                border: AppInputBorders.outlineBorder,
                                hintStyle: const TextStyle(
                                  color: AppColors.greyColor2,
                                ),
                                contentPadding: const EdgeInsets.only(
                                  top: 5,
                                  bottom: 5,
                                  left: 20,
                                ),
                                hintText: 'Search...',
                                suffixIcon: false
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.close,
                                        ),
                                        onPressed: () {},
                                      )
                                    : IconButton(
                                        icon: const Icon(
                                          Icons.keyboard_voice_rounded,
                                        ),
                                        onPressed: () {},
                                      )),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                const AdvertisementBox(),
                const Categories(),
                // Add more widgets as needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}

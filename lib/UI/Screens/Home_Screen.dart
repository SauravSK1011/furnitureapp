import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:furnitureapp/UI/Utils/const.dart';
import 'package:furnitureapp/UI/Utils/data.dart';
import 'package:furnitureapp/UI/widgets/badge.dart';
import 'package:furnitureapp/UI/widgets/product_item.dart';
import 'package:furnitureapp/UI/widgets/room_item.dart';
import 'package:furnitureapp/UI/widgets/search_card.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchValue = "";
  final List<String> _suggestions = [
    'Afeganistan',
    'Albania',
    'Algeria',
    'Australia',
    'Brazil',
    'German',
    'Madagascar',
    'Mozambique',
    'Portugal',
    'Zambia'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName,style: TextStyle(fontSize: 25),),
        actions: <Widget>[
          Center(
            child: IconBadge(
              icon: FeatherIcons.shoppingCart,
            ),
          ),
          const SizedBox(width: 20.0),
        ],
      ),
      body:   Expanded(
        child: ListView(
          padding: const EdgeInsets.only(left: 20.0),
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Text(
                "Craft your space. \nShop now!",
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: SearchCard(),
            ),
            
            SizedBox(height: 20.0),
            buildTitleRow(),
            buildProductList(),
            SizedBox(height: 30.0),
            buildRoomList(),
            SizedBox(height: 10.0),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GNav(
            rippleColor: Colors.grey, // tab button ripple color when pressed
            hoverColor: Colors.grey, // tab button hover color
            haptic: true, // haptic feedback
            tabBorderRadius: 15,
            curve: Curves.easeOutExpo, // tab animation curves
            duration:
                const Duration(milliseconds: 200), // tab animation duration
            gap: 8, // the tab button gap between icon and text
            color: Colors.grey[800], // unselected icon color
            activeColor: Constants.lightAccent, // selected icon and text color
            iconSize: 24, // tab button icon size

            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 5), // navigation bar padding
            tabs: const [
              GButton(
                icon: FeatherIcons.home,
                text: 'Home',
              ),
              GButton(
                icon: FeatherIcons.heart,
                text: 'Likes',
              ),
              GButton(
                icon: FeatherIcons.search,
                text: 'Search',
              ),
              GButton(
                icon: FeatherIcons.user,
                text: 'Profile',
              )
            ]),
      ),
    );
  }
}

buildRoomList() {
  return Container(
    height: 275,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: furnitures.length,
      itemBuilder: (BuildContext context, int index) {
        Map furniture = furnitures[index];

        return RoomItem(
          furniture: furniture,
        );
      },
    ),
  );
}

buildTitleRow() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      const Text(
        "Popular Products",
        style: TextStyle(
          fontSize: 23,
          fontWeight: FontWeight.w800,
        ),
      ),
      ElevatedButton(
        child: const Text(
          "View More",
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        onPressed: () {},
      ),
    ],
  );
}

buildProductList() {
  return Container(
    height: 140.0,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: furnitures.length,
      itemBuilder: (BuildContext context, int index) {
        Map furniture = furnitures[index];

        return ProductItem(
          furniture: furniture,
        );
      },
    ),
  );
}

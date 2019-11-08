import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pharmacy_helper/size_config.dart';
import 'package:pharmacy_helper/constants.dart';
import 'package:shape_of_view/shape_of_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: Colors.blue[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              'assets/heart.svg',
              height: SizeConfig.blockSizeVertical * 7,
              color: Colors.white,
            ),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            NavigatorButt(
                icon: 'assets/pills.svg', text: 'Search by medicine name'),
            SizedBox(
              height: SizeConfig.blockSizeVertical * 3,
            ),
            NavigatorButt(
                icon: 'assets/pharmacy2.svg', text: 'Search for Pharmacy'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Search'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time),
            title: Text('Request'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            title: Text('More'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

class NavigatorButt extends StatelessWidget {
  NavigatorButt({this.icon, this.text});
  final String icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: ShapeOfView(
      shape: BubbleShape(
          position: BubblePosition.Right,
          arrowPositionPercent: 0.5,
          borderRadius: 15,
          arrowHeight: 15,
          arrowWidth: 5),
      child: Container(
          height: SizeConfig.blockSizeVertical * 8.5,
          width: SizeConfig.blockSizeHorizontal * 95,
          child: Align(
            alignment: FractionalOffset(0.5, 0.5),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal * 3,
                ),
                SvgPicture.asset(
                  icon,
                  height: SizeConfig.blockSizeVertical * 5,
                  color: Colors.blue[800],
                ),
                SizedBox(
                  width: SizeConfig.blockSizeHorizontal * 3,
                ),
                Text(
                  text,
                  style: TextStyle(
                      fontSize: 17.0,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800]),
                ),
              ],
            ),
          )),
    ));
  }
}

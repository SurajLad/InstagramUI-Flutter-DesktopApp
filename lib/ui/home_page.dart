import 'package:chat_app_desktop/ui/feed_page.dart';
import 'package:chat_app_desktop/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF36394B),
      body: Container(
        width: Get.width,
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Container(
                color: Color(0xFF0D0C12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 30),
                        Image.asset(
                          'assets/logo.png',
                          width: 50,
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'Instagram',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 22),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/suraj.png'),
                      backgroundColor: Colors.white,
                      radius: Get.width / 18,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Suraj Lad',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 22),
                    ),
                    Text(
                      '@SL_27',
                      style: TextStyle(color: Colors.white54, fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildHighlightsWidget(count: '45', title: "Posts"),
                        buildHighlightsWidget(
                            count: "2.5K", title: "Followers"),
                        buildHighlightsWidget(count: "526", title: "Following"),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Expanded(
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: menuitems.length,
                        padding: const EdgeInsets.only(left: 40.0, right: 40),
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {},
                            dense: false,
                            leading: Icon(
                                menuitems.elementAt(index).values.elementAt(0),
                                color: Colors.white),
                            title: Text(
                                menuitems.elementAt(index).values.elementAt(1),
                                style: TextStyle(color: Colors.white)),
                            trailing: Text("1",
                                style: TextStyle(color: Colors.white60)),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 7,
              child: FeedPage(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHighlightsWidget({String count, String title}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          count,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(color: Colors.white54, fontSize: 18),
        ),
      ],
    );
  }
}

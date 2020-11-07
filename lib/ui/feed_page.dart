import 'package:chat_app_desktop/ui/status_widget.dart';
import 'package:chat_app_desktop/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class FeedPage extends StatefulWidget {
  @override
  _FeedPageState createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  bool isPopularSelected = false;
  bool isLatestSelected = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, top: 20, right: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildSearchBar(),
              buildQuickActions(),
            ],
          ),
          const SizedBox(height: 20),
          buildStoriesTitle(),
          const SizedBox(height: 20),
          Container(
            width: Get.width,
            height: 120,
            child: buildStatusWidget(),
          ),
          const SizedBox(height: 20),
          buildFeedTitle(),
          const SizedBox(height: 20),
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 4,
              itemCount: feeds.length,
              itemBuilder: (BuildContext context, int index) => Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 8,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(feeds[index].imgUrl))),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            buildPostAuthorWidget(index),
                            buildPostStats(index),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              staggeredTileBuilder: (int index) =>
                  new StaggeredTile.count(2, index.isEven ? 2 : 1),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 28.0,
            ),
          )
        ],
      ),
    );
  }

  Widget buildPostAuthorWidget(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipOval(
          child: Container(
            color: Colors.white54,
            padding: const EdgeInsets.all(2),
            child: Image.asset(
              feeds[index].user.profilePic,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          feeds[index].user.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }

  Row buildStoriesTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Stories",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        FlatButton(
          onPressed: () {},
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.tv, color: Colors.white70),
              SizedBox(width: 10),
              Text(
                "Watch All",
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
            ],
          ),
        )
      ],
    );
  }

  Row buildFeedTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Feed",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        Container(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FlatButton(
                onPressed: () {
                  setState(() {
                    isLatestSelected = true;
                    isPopularSelected = false;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      "Latest",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: isLatestSelected ? 2.5 : 0,
                    )
                  ],
                ),
              ),
              SizedBox(width: 10),
              FlatButton(
                onPressed: () {
                  setState(() {
                    isPopularSelected = true;
                    isLatestSelected = false;
                  });
                },
                child: Column(
                  children: [
                    Text(
                      "Popular",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    const SizedBox(height: 5),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: isPopularSelected ? 2.5 : 0,
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  ListView buildStatusWidget() {
    return ListView.builder(
      shrinkWrap: false,
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return Container(
            margin: EdgeInsets.only(left: 0, right: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  margin: EdgeInsets.fromLTRB(0, 6, 8, 6),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white30),
                  child: IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),
                const SizedBox(height: 5),
                Text("Your Status",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ))
              ],
            ),
          );
        }
        index -= 1;
        return StatusCircle(index: index);
      },
      itemCount: status.length,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget buildQuickActions() => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            iconSize: 30,
            onPressed: () {},
          ),
          SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.send, color: Colors.white),
            iconSize: 30,
            onPressed: () {},
          ),
          SizedBox(width: 10),
          RaisedButton(
            onPressed: () {},
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0)),
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFFE2336B),
                      Color(0xFFFFCA46),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(80.0))),
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add),
                  SizedBox(width: 5),
                  Text('Add Photo', style: TextStyle(fontSize: 14)),
                ],
              ),
            ),
          )
        ],
      );

  buildSearchBar() {
    return Container(
      constraints: BoxConstraints(
        minWidth: 250,
        maxWidth: 300,
      ),
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.white70),
          hintText: "Search",
          hintStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w200,
            color: Colors.white60,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  buildPostStats(int index) {
    return Row(
      children: [
        FlatButton.icon(
          onPressed: () {},
          label: Text(
            feeds[index].likesCount.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white60,
            ),
          ),
          icon: Icon(Icons.favorite, color: Colors.white70),
        ),
        FlatButton.icon(
          onPressed: () {},
          label: Text(
            feeds[index].commentsCount.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.white60,
            ),
          ),
          icon: Icon(Icons.comment, color: Colors.white70),
        ),
      ],
    );
  }
}

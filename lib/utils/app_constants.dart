import 'package:chat_app_desktop/models/User.dart';
import 'package:chat_app_desktop/models/feeds.dart';
import 'package:chat_app_desktop/models/status.dart';
import 'package:flutter/material.dart';

const menuitems = {
  {"icon": Icons.widgets, "name": "Feed"},
  {"icon": Icons.search, "name": "Explore"},
  {"icon": Icons.notifications, "name": "Notifications"},
  {"icon": Icons.send, "name": "Direct"},
  {"icon": Icons.tv, "name": "IG TV"},
  {"icon": Icons.show_chart, "name": "Reels"},
  {"icon": Icons.settings, "name": "Settings"},
  {"icon": Icons.logout, "name": "Log out"},
};

var status = [
  StatusModel(
    name: "Omkar Gaikwad",
    profilePic: "assets/omkar.png",
  ),
  StatusModel(
    name: "Surendra Bhati",
    profilePic: "assets/surendra.png",
  ),
  StatusModel(
    name: "Revti Pillai",
    profilePic: "assets/Revti.png",
  ),
  StatusModel(
    name: "Karan N",
    profilePic: "assets/karan.png",
  ),
  StatusModel(
    name: "Karan N",
    profilePic: "assets/karan.png",
  ),
];

var feeds = [
  FeedModel(
    imgUrl: "assets/feed/rain_2.jpg",
    commentsCount: 15,
    likesCount: 145,
    user: User(
      name: "Omkar Gaikwad",
      profilePic: "assets/omkar.png",
      isVerified: false,
    ),
  ),
  FeedModel(
    imgUrl: "assets/feed/sunset_2.jpg",
    commentsCount: 42,
    likesCount: 417,
    user: User(
      name: "Surendra Bhati",
      profilePic: "assets/surendra.png",
      isVerified: true,
    ),
  ),
  FeedModel(
    imgUrl: "assets/feed/forest_1.jpg",
    commentsCount: 9,
    likesCount: 16,
    user: User(
      name: "Revti Pillai",
      profilePic: "assets/Revti.png",
      isVerified: false,
    ),
  ),
  FeedModel(
    imgUrl: "assets/feed/sunset_1.jpg",
    commentsCount: 124,
    likesCount: 646,
    user: User(
      name: "Karan N",
      profilePic: "assets/karan.png",
      isVerified: false,
    ),
  ),
  FeedModel(
    imgUrl: "assets/feed/sunset_2.jpg",
    commentsCount: 365,
    likesCount: 1100,
    user: User(
      name: "Mitul Desai",
      profilePic: "assets/mitul.png",
      isVerified: false,
    ),
  ),
  FeedModel(
    imgUrl: "assets/feed/forest_2.jpg",
    commentsCount: 0,
    likesCount: 22,
    user: User(
      name: "Karan N",
      profilePic: "assets/karan.png",
      isVerified: false,
    ),
  ),
];

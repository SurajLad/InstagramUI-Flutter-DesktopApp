import 'package:chat_app_desktop/models/User.dart';

class FeedModel {
  String imgUrl;
  int commentsCount;
  int likesCount;
  User user;

  FeedModel({this.imgUrl, this.commentsCount, this.likesCount, this.user});
}

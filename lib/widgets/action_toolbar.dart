import 'package:flutter/material.dart';
import 'package:ui_block_in_flutter/tik_tok_icons_icons.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ActionToolbar extends StatelessWidget {
  static const double ActionWidgetSize = 60.0;
  static const double ActionIconSize = 35.0;
  static const double ShareActionIconSize = 25.0;
  static const double ProfileImageSize = 50.0;
  static const double PlusIconSize = 20.0;

  Widget _getSocialAction({String title, IconData icon, bool isShare}) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      width: 60,
      height: 60,
      child: Column(
        children: <Widget>[
          Icon(
            icon,
            size: isShare ? 25.0 : 35.0,
            color: Colors.grey[300],
          ),
          Padding(
            padding: EdgeInsets.only(top: isShare ? 5.0 : 2.0),
            child:
                Text(title, style: TextStyle(fontSize: isShare ? 10.0 : 12.0)),
          )
        ],
      ),
    );
  }

  Widget _getProfilePicture(pictureURL) {
    return Positioned(
      left: ((ActionWidgetSize / 2) - (ProfileImageSize / 2)),
      child: Container(
        padding: EdgeInsets.all(1.0),
        height: ProfileImageSize,
        width: ProfileImageSize,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(ProfileImageSize / 2),
          color: Colors.white,
        ),
        child: CachedNetworkImage(
          imageUrl: pictureURL,
          imageBuilder: (context, imageProvider) => Container(
            width: ProfileImageSize,
            height: ProfileImageSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          placeholder: (context, url) => new CircularProgressIndicator(),
          errorWidget: (context, url, error) => new Icon(Icons.error),
        ),
      ),
    );
  }

  Widget _getPlusIcon() {
    return Positioned(
      bottom: 0,
      left: ((ActionWidgetSize / 2) - (PlusIconSize / 2)),
      child: Container(
        width: PlusIconSize,
        height: PlusIconSize,
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 43, 84),
            borderRadius: BorderRadius.circular(15.0)),
        child: Icon(Icons.add, color: Colors.white, size: 20.0),
      ),
    );
  }

  Widget _getFollowAction({String pictureURL}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: 60,
      height: 60,
      child: Stack(
        children: <Widget>[_getProfilePicture(pictureURL), _getPlusIcon()],
      ),
    );
  }

  LinearGradient get musicGradient => LinearGradient(colors: [
        Colors.grey[800],
        Colors.grey[900],
        Colors.grey[900],
        Colors.grey[800]
      ], stops: [
        0.0,
        0.4,
        0.6,
        1.0
      ], begin: Alignment.bottomLeft, end: Alignment.topRight);

  Widget _getMusicPlayerAction({String pictureURL}) {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        width: ActionWidgetSize,
        height: ActionWidgetSize,
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(11.0),
            height: ProfileImageSize,
            width: ProfileImageSize,
            decoration: BoxDecoration(
                gradient: musicGradient,
                borderRadius: BorderRadius.circular(ProfileImageSize / 2)),
            child: CachedNetworkImage(
              imageUrl: pictureURL,
              placeholder: (context, url) => new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _getFollowAction(
              pictureURL:
                  "https://secure.gravatar.com/avatar/dc0b56430c934d3dea8d77e6a7c94d9c"),
          _getSocialAction(
              icon: TikTokIcons.heart, title: '3.2m', isShare: false),
          _getSocialAction(
              icon: TikTokIcons.chat_bubble, title: '16.4k', isShare: false),
          _getSocialAction(
              icon: TikTokIcons.reply, title: 'Share', isShare: true),
          _getMusicPlayerAction(
              pictureURL:
                  "https://secure.gravatar.com/avatar/ef4a9338dca42372f15427cdb4595ef7")
        ],
      ),
    );
  }
}

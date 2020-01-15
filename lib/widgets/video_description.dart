import 'package:flutter/material.dart';

class VideoDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 70.0,
        padding: EdgeInsets.only(left: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('@binhnguyen', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Video title and other stuffs'),
            Row(children: <Widget>[
              Icon(Icons.music_note, size:15.0, color: Colors.white,),
              Text('Artist name - Album name - Song', style: TextStyle(fontSize: 12.0))
            ])
          ],
        ),
      ),
    );
  }
}

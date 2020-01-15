import 'package:flutter/material.dart';
import 'package:ui_block_in_flutter/widgets/video_description.dart';
import 'package:ui_block_in_flutter/widgets/action_toolbar.dart';
import 'package:ui_block_in_flutter/widgets/bottom_toolbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context)
            .textTheme
            .apply(bodyColor: Colors.white, displayColor: Colors.white),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget get topSection => Container(
        height: 100,
        padding: EdgeInsets.only(bottom: 15.0),
        alignment: Alignment(0.0, 0.1),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Following'),
            Container(
              width: 15.0,
            ),
            Text(
              'For you',
              style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      );

  Widget get middleSection => Expanded(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[VideoDescription(), ActionToolbar()],
        ),
      );

  Widget get bottomSection => new BottomToolbar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: <Widget>[topSection, middleSection, BottomToolbar()],
        ),
      ),
    );
  }
}

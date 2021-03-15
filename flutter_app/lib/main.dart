import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/models/song-list.dart';
import 'package:flutter_app/models/song.dart';
import 'package:flutter_app/song-list-widget.dart';
import 'package:provider/provider.dart';

import 'SongListItem.dart';
import 'LoadingSpinner.dart';

void main() {
  runApp(StateApp());
}

class StateApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SongListModel>(
      create: (_) => SongListModel(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,   
      child: Container(
        height: 100,
        decoration: new BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          textDirection: TextDirection.ltr,
          children: [
            Container(
              height: 120,
              child: Stack(
                textDirection: TextDirection.ltr,
                fit: StackFit.expand,
                children: [
                  Container(
                    height: 150,
                    child: CustomPaint(
                      painter: PinkStripePainter(),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(35.0),
                    child: Column(
                      children: [
                        Text(
                          "TOP 10 MOST LISTENED SONGS",
                          textAlign: TextAlign.left,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Montserrat",
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "TODAY",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: "Montserrat",
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  )
                ]
              )
            ),
            Expanded(
              child: Container(
                width: 100,
                height: 100,
                margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [ new BoxShadow( color: Colors.black, blurRadius: 5.0, spreadRadius: 0, offset: Offset.fromDirection(2) )],
                  color: Colors.white
                ),
                transform:  Matrix4.translationValues(0.0, -20.0, 0.0),
                child: Container(
                    child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      SongListWidget(),
                    ],
                  )
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                  // If the item is not in cart, we let the user add it.
                  // We are using context.read() here because the callback
                  // is executed whenever the user taps the button. In other
                  // words, it is executed outside the build method.
                  var songList = context.read<SongListModel>();
                  var song = Song(1, "test", "test a", 32, "ima");
                  songList.add(song);
              },
              style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Theme.of(context).primaryColor;
                }
                return null; // Defer to the widget's default.
              }),
            ),
              child: Text("Press me bitch")
            )
          ],
        )
      )
    );
  }
}

class PinkStripePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xffE36A7D)
      ..style = PaintingStyle.fill;
    //a rectangle
    canvas.drawRect(Offset(0, 0) & Size(size.width, size.height), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

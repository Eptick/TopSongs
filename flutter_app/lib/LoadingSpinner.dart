import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40,
      width: 20,
      alignment: Alignment.center,
      child: CustomPaint(
        painter: LoadingHalfCirclePainter(),
      ),
    );
  }
}

class LoadingHalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xffE36A7D)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    //a rectangle
     canvas.drawArc(Offset(0, -10) & Size(20, 20),
        0, //radians
        2, //radians
        false,
        paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

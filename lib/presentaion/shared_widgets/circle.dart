import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {
  final double strockWidth;
  final Color color;
  const CirclePainter({required this.strockWidth, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strockWidth;

    final path = Path()
      ..addOval(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Circle extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final double strockWidth;
  final List<Widget>? children;
  const Circle(
      {super.key,
      required this.height,
      required this.width,
      required this.color,
      required this.strockWidth,
      this.children});

  const Circle.sameSize({
    super.key,
    required this.color,
    required this.strockWidth,
    required double size,
    this.children,
  })  : width = size,
        height = size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            painter: CirclePainter(color: color, strockWidth: strockWidth),
            size: Size(width, height),
          ),
          ...children ?? [],
        ],
      ),
    );
  }
}

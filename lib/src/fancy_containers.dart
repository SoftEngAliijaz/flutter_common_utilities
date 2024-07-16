import 'package:flutter/material.dart';

class FancyContainers extends StatefulWidget {
  final double? width;
  final double? height;
  final Color? color1;
  final Color? color2;
  final String? title;
  final Color? textColor;
  final String? subtitle;
  final Color? subtitleColor;
  final EdgeInsetsGeometry? padding;

  const FancyContainers({
    Key? key,
    this.width,
    this.height = 120,
    this.color1,
    this.color2,
    this.title = 'title',
    this.textColor,
    this.subtitle = 'subtitle',
    this.subtitleColor,
    this.padding,
  }) : super(key: key);

  @override
  State<FancyContainers> createState() => _FancyContainersState();
}

class _FancyContainersState extends State<FancyContainers> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: widget.height,
        width: widget.width ?? size.width * 0.98,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          gradient: LinearGradient(
            colors: [
              widget.color1 ?? const Color(0xFFCB1841),
              widget.color2 ?? const Color(0xFF2604DE),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                '${widget.title}',
                style: TextStyle(
                  color: widget.textColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                '${widget.subtitle}',
                style: TextStyle(
                  color: widget.subtitleColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

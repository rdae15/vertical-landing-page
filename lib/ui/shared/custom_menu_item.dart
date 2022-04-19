import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomMenuItem extends StatefulWidget {
  final String text;
  final Function onPressed;
  final int delay;

  const CustomMenuItem({ Key? key, required this.text, required this.onPressed, this.delay = 0 }) : super(key: key);

  @override
  _CustomMenuItemState createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  bool isMover = false;

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      from: 10,
      duration: const Duration( milliseconds: 150),
      delay: Duration(milliseconds: widget.delay),
      child: MouseRegion(
        onEnter: ( _ ) => setState(() => isMover = true),
        onExit: ( _ ) => setState(() => isMover = false) ,
        child: GestureDetector(
          onTap: () => widget.onPressed(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300 ),
            width: 150,
            height: 50,
            color: isMover ? Colors.pinkAccent : Colors.black,
            child: Center(
              child: Text(
                widget.text,
                style: GoogleFonts.roboto(fontSize: 20, color: Colors.white ),
              ),
            ),
            ),
        ),
        
      ),
    );
  }
}
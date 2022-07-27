import 'package:app/config/responsive.dart';
import 'package:app/constants.dart';
import 'package:app/widgets/shape_card.dart';
import 'package:app/widgets/text_variants.dart';
import 'package:flutter/material.dart';

class CustomMenuitem extends StatefulWidget {

  final bool isActive;
  final Function onPressed;
  final String text;
  final IconData? icon; 

  const CustomMenuitem({ 
    this.isActive = false,
    required this.onPressed,
    required this.text,
    this.icon,
    Key? key 
  }) : super(key: key);

  @override
  _CustomMenuitemState createState() => _CustomMenuitemState();
}

class _CustomMenuitemState extends State<CustomMenuitem> {

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: isHovered
            ? secondaryColor.withOpacity(0.8)
            : widget.isActive
                ? secondaryColor
                : Colors.transparent,
        borderRadius: BorderRadius.circular(8.0),
      ),      
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: widget.isActive ? null : () => widget.onPressed(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: MouseRegion(
              onEnter: (_) {
                setState(() {
                  isHovered = true;
                });
              },
              onExit: (_) {
                setState(() {
                  isHovered = false;
                });
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if(widget.icon != null) ...[
                    Icon(widget.icon, color: Colors.white, size: 36),
                    const SizedBox(width: 15),
                  ],
                  TextVariant.body(
                    text: widget.text,
                    context: context, 
                    color: Colors.white
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ShoppableIcon extends StatelessWidget {
const ShoppableIcon({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ClipOval(
      child: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Color(0xFFD9D9D9).withOpacity(0.45)
        ),
        child: Icon(Icons.shopping_bag_outlined, size: 16),
      ),
    );
  }
}
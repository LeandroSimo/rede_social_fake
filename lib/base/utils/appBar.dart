import 'package:flutter/material.dart';

class AppBarBase{
 appBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle_rounded,
              color: Colors.black,
            ),
          ),
          Image.asset('lib/assets/images/6.png',
           height: 100,
           width: 200,
           ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.chat,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
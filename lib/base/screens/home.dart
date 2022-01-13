import 'package:flutter/material.dart';
import 'package:lista_posts/base/utils/appBar.dart';
import 'package:lista_posts/base/utils/body.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contButton = 0;

  final AppBarBase _appBarBase = AppBarBase();
  final Body _body = Body();

  bottomNavigatorBar() {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              setState(() => contButton = 0);
            },
            icon: Icon(
              Icons.home,
              color: contButton == 0 ? Colors.orange.shade900 : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() => contButton = 1);
            },
            icon: Icon(
              Icons.supervisor_account_outlined,
              color: contButton == 1 ? Colors.orange.shade900 : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() => contButton = 2);
            },
            icon: Icon(
              Icons.add_box,
              color: contButton == 2 ? Colors.orange.shade900 : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() => contButton = 3);
            },
            icon: Icon(
              Icons.notifications,
              color: contButton == 3 ? Colors.orange.shade900 : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() => contButton = 4);
            },
            icon: Icon(
              Icons.card_travel,
              color: contButton == 4 ? Colors.orange.shade900 : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  infoDeveloper(){
    return Container(
      child: const Center(
        child: Text(
          'EM DESENVOLVIMENTO...',
          style: TextStyle(
            fontSize: 20
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBarBase.appBar(),
        extendBodyBehindAppBar: false,
        body: contButton == 0 ? _body.body() : infoDeveloper(),
        bottomNavigationBar: bottomNavigatorBar());
  }
}

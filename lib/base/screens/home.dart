import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lista_posts/base/utils/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contButton = 0;

  List<Post> parseCliente(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromJson(json)).toList();
  }

  Future<List<Post>> _fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    return parseCliente(response.body.toString());
  }

  Future<void> onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
  }

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
          Image.asset('lib/assets/images/logo-esig1.png'),
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
              color: contButton == 0 ? Colors.red : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() => contButton = 1);
            },
            icon: Icon(
              Icons.supervisor_account_outlined,
              color: contButton == 1 ? Colors.red : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() => contButton = 2);
            },
            icon: Icon(
              Icons.add_box,
              color: contButton == 2 ? Colors.red : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() => contButton = 3);
            },
            icon: Icon(
              Icons.notifications,
              color: contButton == 3 ? Colors.red : Colors.black,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() => contButton = 4);
            },
            icon: Icon(
              Icons.card_travel,
              color: contButton == 4 ? Colors.red : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  body() {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Post>>(
              future: _fetchPosts(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case ConnectionState.active:
                  case ConnectionState.done:
                    if (snapshot.hasData) {
                      var count = snapshot.data?.length;
                      return ListView.builder(
                          itemCount: count,
                          itemBuilder: (context, index) {
                            List<Post>? lista = snapshot.data;
                            Post perfil = lista![index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10),
                                      child: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              'https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947__480.jpg')),
                                    ),
                                    Text(
                                      ' ${perfil.id}° ' + 'perfil',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Spacer(),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.more_vert))
                                  ],
                                ),
                                GestureDetector(
                                  child: Image.asset(
                                      'lib/assets/images/image.jpg'),
                                  onTap: () {
                                    if (index >= 0) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Scaffold(
                                                    backgroundColor:
                                                        Colors.red.shade100,
                                                    body: SingleChildScrollView(
                                                      child: Column(
                                                        children: [
                                                          Padding(
                                                              child: IconButton(
                                                                  icon: Icon(Icons
                                                                      .arrow_back),
                                                                  onPressed: (){}
                                                                  ),
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      right:
                                                                          400,
                                                                      top: 15)),
                                                          Container(
                                                            height: 400,
                                                            width: 400,
                                                            decoration:
                                                                BoxDecoration(
                                                                    image:
                                                                        DecorationImage(
                                                                      fit: BoxFit
                                                                          .cover,
                                                                      image: AssetImage(
                                                                          'lib/assets/images/image.jpg'),
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(20))),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            10),
                                                                child: CircleAvatar(
                                                                    radius: 15,
                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                            'https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947__480.jpg')),
                                                              ),
                                                              Text(
                                                                ' ${perfil.id}° ' +
                                                                    'perfil',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                              ),
                                                              Spacer(),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon: Icon(Icons
                                                                      .more_vert))
                                                            ],
                                                          ),
                                                          Divider(
                                                            color: Colors
                                                                .red.shade100,
                                                          ),
                                                          Text(
                                                            '${perfil.body}',
                                                            style: TextStyle(
                                                                fontSize: 16),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  )));
                                    }
                                  },
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon:
                                              Icon(Icons.thumb_up_alt_outlined),
                                        ),
                                        Text('Gostei')
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.comment_outlined),
                                        ),
                                        Text('Comentar')
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.redo),
                                        ),
                                        Text('Compartilhar')
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.near_me_sharp),
                                        ),
                                        Text('Envivar')
                                      ],
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    children: [
                                      RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: '${perfil.id}° ' + 'perfil ',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                        TextSpan(
                                            text: ' ${perfil.title}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16)),
                                      ]))
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: Colors.white,
                                ),
                              ],
                            );
                          });
                    } else {
                      return Center(
                        child: Text('${snapshot.connectionState}'),
                      );
                    }
                }
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        extendBodyBehindAppBar: false,
        body: contButton == 0 ? body() : Container(),
        bottomNavigationBar: bottomNavigatorBar());
  }
}

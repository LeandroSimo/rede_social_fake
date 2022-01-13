import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:lista_posts/base/utils/post.dart';

class Body {
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

  body() {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Post>>(
              future: _fetchPosts(),
              builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
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
                                        PageRouteBuilder(
                                            transitionDuration:
                                                Duration(milliseconds: 70),
                                            reverseTransitionDuration:
                                                Duration(milliseconds: 30),
                                            transitionsBuilder: (context, animation,secondaryAnimation,child) =>
                                                ScaleTransition(
                                                  alignment: Alignment.bottomCenter,
                                                  scale: animation,
                                                  child: child,
                                                ),
                                            pageBuilder: (context, animation, animationTime) =>
                                            Scaffold(
                                              backgroundColor: Colors
                                                  .orange.shade100,
                                              body:
                                                  SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                        child: IconButton(
                                                            icon: Icon(
                                                                Icons
                                                                    .arrow_back),
                                                            onPressed:
                                                                () {}),
                                                        padding: EdgeInsets.only(
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
                                                                image:
                                                                    AssetImage('lib/assets/images/image.jpg'),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius.all(Radius.circular(20))),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10),
                                                          child: CircleAvatar(
                                                              radius:
                                                                  15,
                                                              backgroundImage:
                                                                  NetworkImage('https://cdn.pixabay.com/photo/2017/08/30/12/45/girl-2696947__480.jpg')),
                                                        ),
                                                        Text(
                                                          ' ${perfil.id}° ' +
                                                              'perfil',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  18,
                                                              fontWeight:
                                                                  FontWeight.bold),
                                                        ),
                                                        Spacer(),
                                                        IconButton(
                                                            onPressed:
                                                                () {},
                                                            icon: Icon(
                                                                Icons
                                                                    .more_vert))
                                                      ],
                                                    ),
                                                    Divider(
                                                      color: Colors
                                                          .red
                                                          .shade100,
                                                    ),
                                                    Text(
                                                      '${perfil.body}',
                                                      style: TextStyle(
                                                          fontSize:
                                                              16),
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
}

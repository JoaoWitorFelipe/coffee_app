import 'package:coffee_app/src/models/blog_model.dart';
import 'package:coffee_app/src/pages/details_blog_page.dart';
import 'package:flutter/material.dart';

class BlogWidget extends StatelessWidget {
  final List<BlogModel> mockImages = <BlogModel>[
    BlogModel(
        1,
        "Lorem ipsum dolor sit amet, consectetur adipiscing",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "https://www.teahub.io/photos/full/315-3150213_coffee-cup-wallpaper-cartoon.jpg"),
    BlogModel(
        2,
        "Lorem ipsum dolor sit amet, consectetur adipiscing",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "https://phandroid.com/wp-content/uploads/2014/10/coffee-illustration.jpg"),
    BlogModel(
        3,
        "Lorem ipsum dolor sit amet, consectetur adipiscing",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        "https://media.istockphoto.com/vectors/cat-seamless-pattern-vector-kitten-coffee-cup-calico-breed-scarf-vector-id1158051779"),
  ].take(3).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 500.0,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Blog",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  fontFamily: 'Chilanka',
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  "View all",
                  style: TextStyle(
                    fontFamily: 'Chilanka',
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              children: mockImages
                  .map(
                    (BlogModel _blog) => Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Hero(
                          tag: _blog.id,
                          child: Container(
                            height: 80.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(_blog.imagePath),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  _blog.title.replaceRange(
                                      30, _blog.title.length, "..."),
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Text(_blog.body.replaceRange(
                                    30, _blog.body.length, "...")),
                              ],
                            ),
                            OutlineButton(
                              borderSide: BorderSide(width: 1.0),
                              child: Text(
                                "Read more",
                                style: TextStyle(
                                  fontFamily: 'Chilanka',
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => DetailsBlogPage(
                                      blog: _blog,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}

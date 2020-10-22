import 'package:coffee_app/src/models/blog_model.dart';
import 'package:flutter/material.dart';

class DetailsBlogPage extends StatefulWidget {
  final BlogModel blog;
  DetailsBlogPage({Key key, this.blog}) : super(key: key);

  @override
  _DetailsBlogPageState createState() => _DetailsBlogPageState();
}

class _DetailsBlogPageState extends State<DetailsBlogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  "Back",
                  style: TextStyle(
                    fontFamily: 'Chilanka',
                  ),
                ),
              ),
            ),
            Container(
              child: Hero(
                tag: widget.blog.id,
                child: Image.network(widget.blog.imagePath),
              ),
            ),
            SizedBox(height: 40.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text(
                      widget.blog.title,
                      style: TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Text(widget.blog.body),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

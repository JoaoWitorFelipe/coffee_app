import 'package:flutter/material.dart';

class PromoCoffeeWidget extends StatelessWidget {
  final List<String> mockImages = <String>[
    "https://images.hdqwalls.com/wallpapers/need-more-coffee-programmer-story.jpg",
    "https://cdn.hipwallpaper.com/i/60/50/1Pi7Gl.png",
    "https://i.pinimg.com/originals/58/17/fe/5817fea6cba5c4c3fc7778618a1c70d5.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          alignment: Alignment.centerLeft,
          child: Text(
            "Promo",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              fontFamily: 'Chilanka',
            ),
          ),
        ),
        Container(
          height: 100.0,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            separatorBuilder: (context, index) {
              return SizedBox(width: 10.0);
            },
            scrollDirection: Axis.horizontal,
            itemCount: mockImages.length,
            itemBuilder: (BuildContext _, int index) {
              return GestureDetector(
                onTap: () async {
                  await showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (BuildContext _) {
                      return AboutPromoModal(imagePath: mockImages[index]);
                    },
                  );
                },
                child: Card(
                  child: Container(
                    width: 200.0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            "Cappucinno 10%",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          mockImages[index],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class AboutPromoModal extends StatelessWidget {
  final String imagePath;
  const AboutPromoModal({Key key, @required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.0),
          topLeft: Radius.circular(50.0),
        ),
        color: Color(0xFF613D2B),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: 30.0),
              CircleAvatar(
                radius: 60.0,
                backgroundImage: NetworkImage(imagePath),
              ),
              SizedBox(height: 30.0),
              Text(
                "Promo 'Need More Coffee'",
                style: TextStyle(
                  fontSize: 25.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "This promotion is 10% for all cappuccinno and espresso coffees! Enjoy!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 80.0,
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              color: Color(0xFF98867D),
              elevation: 1.0,
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Ok, understand!",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Chilanka',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

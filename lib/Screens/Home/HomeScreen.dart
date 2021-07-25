import 'package:flutter/material.dart';
import 'package:refersh_brain/Models/course.dart';
import 'package:refersh_brain/Models/yoga.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = 'homeScreen';
  int changedIndex = 0;
  double heightAppBar;
  @override
  Widget build(BuildContext context) {
    heightAppBar = AppBar().preferredSize.height;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: heightAppBar,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            child: CircleAvatar(
                              // radius: ,
                              backgroundImage: AssetImage(
                                'assets/propic.jpeg',
                              ),
                              backgroundColor: Colors.red,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 2,
                                  color: Colors.cyanAccent,
                                )),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Elahi modi',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                        icon: Stack(
                          children: [
                            Icon(
                              Icons.notifications_active_outlined,
                              color: Colors.black,
                            ),
                            Container(
                              child: Text('1'),
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            )
                          ],
                        ),
                        onPressed: () {}),
                    IconButton(
                        icon: Icon(
                          Icons.search_off,
                          color: Colors.black,
                        ),
                        onPressed: () {}),
                  ]),
            ),
            BuildRowItem(),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: yogaTraining.length,
                    itemBuilder: (ctx, index) =>
                        buildItemTraining(context, index)),
              ),
            ),
            BuildRowItem(),
            Expanded(
                flex: 2,
                child: ListView.builder(
                    itemCount: courses.length,
                    itemBuilder: (context, index) =>
                        BuildItemCard(courses[index]))),
          ],
        ),
      ),
    );
  }
}

class BuildRowItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'For Beginners',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          TextButton(onPressed: () {}, child: Text('See All')),
        ],
      ),
    );
  }
}

Widget buildItemTraining(BuildContext context, int index) {
  return Stack(
    children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.symmetric(horizontal: 4),
          padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
          width: MediaQuery.of(context).size.width / 2,
          height: 180,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(70)),
              boxShadow: [
                BoxShadow(
                  color: Colors.white70,
                  blurRadius: 0,
                  offset: Offset(0, 3),
                )
              ]),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                yogaTraining[index].name,
                style: TextStyle(
                  fontSize: 20,
                ),
                maxLines: 2,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.alarm_on,
                        color: Colors.grey,
                      ),
                      Text(
                        '${yogaTraining[index].timeTraining} min',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(3),
                      child: Icon(Icons.add),
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      Positioned(
        right: 0,
        bottom: 23,
        width: 60,
        height: 140,
        child: Image.asset(
          yogaTraining[index].image,
          fit: BoxFit.fill,
        ),
      ),
    ],
  );
}

class BuildItemCard extends StatefulWidget {
  Course course;
  BuildItemCard(this.course);
  @override
  _BuildItemCardState createState() => _BuildItemCardState();
}

class _BuildItemCardState extends State<BuildItemCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Image.asset(
                      widget.course.image,
                      width: 120,
                      height: 160,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Positioned.fill(
                      child: Container(
                    color: Colors.grey.withOpacity(0.2),
                    alignment: Alignment.center,
                    child: Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(width: 1, color: Colors.white)),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        )),
                  ))
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.course.name),
                DetailsTraining(
                  icon: Icons.file_copy,
                  title: widget.course.level,
                ),
                DetailsTraining(
                  icon: Icons.access_time_outlined,
                  title: '${widget.course.courseTime} min',
                ),
              ],
            ),
            IconButton(
                icon: Icon(
                  widget.course.favourite
                      ? Icons.favorite
                      : Icons.favorite_border_outlined,
                  color: Colors.redAccent,
                ),
                onPressed: () {
                  print('pressed');
                  setState(() {
                    widget.course.favourite = !widget.course.favourite;
                  });
                }),
          ],
        ),
      ),
    );
  }
}

class DetailsTraining extends StatelessWidget {
  String title;
  IconData icon;
  DetailsTraining({this.icon, this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
        ),
        SizedBox(width: 5),
        Text(
          title,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

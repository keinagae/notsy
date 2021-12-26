import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math' as math;

import 'package:notsy/data/models/note.dart' as model;
import 'package:notsy/data/models/category.dart' as categoryModel;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final notes = [
      model.Note(
          isNew: true,
          title: "How to draw a professional wireframe?",
          description:
              "For Wireframe Design, You Need To Have A Pen And Paper With You, And Using These Two You Can Design The Idea You Want On The Paper For Web Or Mobile, Just Learn ...",
          color: Color(0xffF2F6FE),
          dateTime: DateTime(2021, 9, 2),
          categories: [
            categoryModel.Category(name: "Design"),
            categoryModel.Category(name: "Wireframe"),
          ]),
      model.Note(
          title: "Ways to succeed early",
          description: "",
          color: Color(0xfffef6e5),
          dateTime: DateTime(2021, 9, 2),
          categories: [
            categoryModel.Category(name: "Succeed"),
            categoryModel.Category(name: "Goal"),
          ]),
      model.Note(
          title: "Scientific Facts of space",
          description: "",
          color: Color(0xffe4ffe6),
          dateTime: DateTime(2021, 9, 2),
          categories: [
            categoryModel.Category(name: "Scientific"),
            categoryModel.Category(name: "Space"),
          ])
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Iconsax.note_214),
        title: Text(
          "Notsy",
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.search_status),
            visualDensity: VisualDensity.compact,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {},
                icon: Icon(Iconsax.direct_notification),
                visualDensity: VisualDensity.compact),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SlidingControl<String>(items: <String, String>{
                      "notes": "Notes",
                      "highlights": "Highlights",
                      "fav": "Favorite Notes",
                    }),
                  ),
                  Row(
                    children: [
                      Text(
                        "List Notes",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: ListView.separated(
                    itemCount: notes.length,
                    itemBuilder: (ctx, index) {
                      return NoteListItem(
                        note: notes[index],
                      );
                    },
                    separatorBuilder: (ctx, index) {
                      return SizedBox(
                        height: 20,
                      );
                    },
                  ))
                ],
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            shadows: [
              BoxShadow(
                  color: Colors.black.withOpacity(.1),
                  offset: Offset(0, -5),
                  blurRadius: 30,
                  spreadRadius: 20)
            ],
            color: Colors.black),
        child: IconTheme(
          data: IconThemeData(color: Colors.white, size: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Iconsax.home_25)),
              IconButton(onPressed: () {}, icon: Icon(Iconsax.crown)),
              IconButton(onPressed: () {}, icon: Icon(Iconsax.menu)),
              IconButton(onPressed: () {}, icon: Icon(Iconsax.setting_2)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.black,
        child: Icon(Iconsax.add),
      ),
    );
  }
}

class NoteListItem extends StatelessWidget {
  final model.Note note;

  const NoteListItem({Key? key, required this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: note.isNew
                    ? BorderSide(width: 2, color: Color(0xffff8b65))
                    : BorderSide.none),
            color: note.color),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    note.title,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  if (note.isNew) ...[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      note.description,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Color(0xff7b7e83)),
                    ),
                  ],
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                        child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) => Text(
                                  note.categories[index].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 12,
                                          color: Color(0xff99958a)),
                                ),
                            separatorBuilder: (ctx, index) => VerticalDivider(
                                  width: 20,
                                  thickness: 1,
                                  color: Color(0xffd3d3d3),
                                ),
                            shrinkWrap: true,
                            itemCount: note.categories.length),
                      ),
                      Spacer(),
                      Text(
                        "${note.dateTime.year}/${note.dateTime.month}/${note.dateTime.day}",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 12, color: Color(0xff99958a)),
                      )
                    ],
                  )
                ],
              ),
            ),
            if (note.isNew)
              Positioned(
                  right: -1,
                  top: -1,
                  child: Container(
                    height: 50,
                    width: 50,
                    // decoration: ShapeDecoration(
                    //   color: Color(0xffff8b65),
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.only(
                    //         topRight: Radius.circular(15)
                    //       )
                    // ),
                    // ),
                    child: CustomPaint(
                      painter: NotchPainter(),
                      child: Transform.rotate(
                        angle: -math.pi/4,
                        origin: Offset(10,-20),
                          child: Text("New",style: TextStyle(color: Colors.white),)),
                    ),
                  ))
          ],
        ));
  }
}

class NotchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xffff8b65)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;
    var path = Path()..moveTo(0, 0);
    path.quadraticBezierTo(8, size.height * .25, 0, size.height - 10);
    path.quadraticBezierTo(0, size.height, 10, size.height);
    path.quadraticBezierTo(
        size.width * .75, size.height - 8, size.width, size.height);
    path.lineTo(size.width, 10);
    path.quadraticBezierTo(size.width, 4, size.width - 15, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}

class SlidingControl<T> extends StatefulWidget {
  final Map<T, String> items;

  const SlidingControl({Key? key, required this.items}) : super(key: key);

  @override
  State<SlidingControl> createState() => _SlidingControlState();
}

class _SlidingControlState<T> extends State<SlidingControl>
    with SingleTickerProviderStateMixin {
  T? selected;

  GlobalKey containerKey = GlobalKey();
  late AnimationController animationController;
  late Animation<double> animation;

  void onTap(TapUpDetails details) {
    final tapLocation = details.localPosition;
    final RenderBox containerBox =
        containerKey.currentContext!.findRenderObject() as RenderBox;
    totalWidth = containerBox.size.width - 14;
    final singleChildWidth = totalWidth / widget.items.length;
    double childLocation = 0.0;
    int selectedChild = 0;
    for (int i = 1; i <= widget.items.length; i++) {
      if (childLocation <= tapLocation.dx &&
          tapLocation.dx <= singleChildWidth * i) {
        selectedChild = i - 1;
      }
      childLocation += singleChildWidth;
    }
    selected = widget.items.keys.toList()[selectedChild];
    sliderLocation = singleChildWidth * selectedChild;
    sliderLocationPercent = sliderLocation / totalWidth;
    animationController.animateTo(sliderLocationPercent,
        curve: Curves.easeOut);
    setState(() {});
  }
  double sliderWidth=0;
  double sliderLocation = 0;
  double sliderLocationPercent = 0;
  double totalWidth = 0;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 1.0,
        duration: Duration(milliseconds: 600));
    animationController.addListener(() {
      setState(() {});
    });
    if(selected==null){
      selected=widget.items.keys.toList()[0];
    }
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      final RenderBox containerBox =
      containerKey.currentContext!.findRenderObject() as RenderBox;
      totalWidth = containerBox.size.width - 14;
      sliderWidth = totalWidth / widget.items.length;
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: containerKey,
      padding: EdgeInsets.all(7),
      height: 55,
      decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Color(0xfff6f6f6)),
      child: GestureDetector(
        onTapUp: onTap,
        onHorizontalDragStart: (details) {},
        onPanUpdate: (details) {
          print(details.localPosition.dx);
          animationController.value = details.localPosition.dx;
          setState(() {});
        },
        child: Stack(
          children: [
            Transform.translate(
              offset: Offset(totalWidth * animationController.value, 0),
              child: Container(
                width: sliderWidth,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.black),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...widget.items.entries.map((e) => Expanded(
                      child: SlidingControlChip(
                        text: e.value,
                        value: e.key,
                        selected: selected,
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
    // return CupertinoSlidingSegmentedControl<int>(
    //     groupValue: selected,
    //     thumbColor: Colors.black,
    //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    //     backgroundColor: Color(0xffe8e8ed),
    //     children: <int, Widget>{
    //       0: Padding(
    //         padding: EdgeInsets.symmetric(vertical: 10),
    //         child: Text(
    //           'Notes',
    //           style:
    //               TextStyle(color: selected == 0 ? Colors.white : Colors.grey),
    //         ),
    //       ),
    //       1: Padding(
    //         padding: EdgeInsets.symmetric(vertical: 10),
    //         child: Text(
    //           'Highlights',
    //           style:
    //               TextStyle(color: selected == 1 ? Colors.white : Colors.grey),
    //         ),
    //       ),
    //       2: Padding(
    //         padding: EdgeInsets.symmetric(vertical: 10),
    //         child: Text(
    //           'Favorite Notes',
    //           style:
    //               TextStyle(color: selected == 2 ? Colors.white : Colors.grey),
    //         ),
    //       )
    //     },
    //     onValueChanged: (value) {
    //       setState(() {
    //         selected = value;
    //       });
    //     });
  }
}

class SlidingControlChip<T> extends StatelessWidget {
  const SlidingControlChip(
      {Key? key, required this.value, required this.text, this.selected})
      : super(key: key);
  final String text;
  final T? selected;
  final T value;

  // final GlobalKey gestureKey;
  // final Function(GlobalKey,T) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        text,
        style: TextStyle(
            color: selected == value ? Colors.white : Color(0xffc3c3c3),
            fontWeight: selected == value ? FontWeight.bold : FontWeight.w500),
      )),
    );
  }
}

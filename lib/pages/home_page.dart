import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:math' as math;

import 'package:notsy/data/models/note.dart' as model;
import 'package:notsy/data/models/category.dart' as categoryModel;
import 'package:notsy/utils/painters.dart';
import 'package:notsy/widgets/bars.dart';
import 'package:notsy/widgets/controls.dart';

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
      bottomNavigationBar: BottomBar(),
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




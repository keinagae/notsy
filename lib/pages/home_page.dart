import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Divider(),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: SlidingControl(),
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
                  )
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

class SlidingControl extends StatefulWidget {
  const SlidingControl({
    Key? key,
  }) : super(key: key);

  @override
  State<SlidingControl> createState() => _SlidingControlState();
}

class _SlidingControlState extends State<SlidingControl> {
  int? selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      height: 55,
      decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Color(0xfff6f6f6)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: InkWell(
                  onTap: () {
                    selected = 1;
                    setState(() {

                    });
                  },
                  child: SlidingControlChip(
                    text: "Notes",
                    selected: selected==1,
                  ))),
          Expanded(
              child: InkWell(
                  onTap: () {
                    selected = 2;
                    setState(() {});
                  },
                  child: SlidingControlChip(
                    text: "Highlights",
                    selected: selected==2,
                  ))),
          Expanded(
              child: InkWell(
                  onTap: () {
                    selected = 3;
                    setState(() {});
                  },
                  child: SlidingControlChip(
                    text: "Favorite Notes",
                    selected: selected==3,
                  ))),
        ],
      ),
    );
    return CupertinoSlidingSegmentedControl<int>(
        groupValue: selected,
        thumbColor: Colors.black,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        backgroundColor: Color(0xffe8e8ed),
        children: <int, Widget>{
          0: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Notes',
              style:
                  TextStyle(color: selected == 0 ? Colors.white : Colors.grey),
            ),
          ),
          1: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Highlights',
              style:
                  TextStyle(color: selected == 1 ? Colors.white : Colors.grey),
            ),
          ),
          2: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Favorite Notes',
              style:
                  TextStyle(color: selected == 2 ? Colors.white : Colors.grey),
            ),
          )
        },
        onValueChanged: (value) {
          setState(() {
            selected = value;
          });
        });
  }
}

class SlidingControlChip extends StatelessWidget {
  const SlidingControlChip(
      {Key? key, required this.text, this.selected = false})
      : super(key: key);
  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      decoration: ShapeDecoration(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: selected ? Colors.black : Colors.transparent,
        shadows: selected?[
          BoxShadow(
            color: Colors.black.withOpacity(.01),
            spreadRadius: 1,
            blurRadius: 1
          )
        ]:null
      ),
      child: Center(
          child: Text(
        text,
        style: TextStyle(color: selected?Colors.white:Color(0xffc3c3c3),fontWeight: selected?FontWeight.bold:FontWeight.w500),
      )),
    );
  }
}

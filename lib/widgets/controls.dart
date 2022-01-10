
import 'package:flutter/material.dart';

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
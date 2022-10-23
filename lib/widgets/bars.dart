import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:notsy/pages/categories_page.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
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
        data: IconThemeData(color: Colors.white, size: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Iconsax.home_25)),
            IconButton(onPressed: () {}, icon: Icon(Iconsax.crown)),
            IconButton(onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>CategoriesPage()));
            }, icon: Icon(Iconsax.menu)),
            IconButton(onPressed: () {}, icon: Icon(Iconsax.setting_2)),
          ],
        ),
      ),
    );
  }
}

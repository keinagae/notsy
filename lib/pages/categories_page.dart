import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:notsy/widgets/bars.dart';
import 'package:notsy/widgets/scafold.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotsyScafold(
      appBarTitle: Text(
        "Categories",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
        appBarActions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.add_circle),
            visualDensity: VisualDensity.compact,
          ),
        ],
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "List Categories",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  Expanded(child: GridView(
                    padding: EdgeInsets.only(top: 20),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      mainAxisExtent: 200
                    ),
                    children: [
                      CategoryGridTile(color: Color(0xff428AFB), subTitle: '15 Notes',name: "Design",),
                      CategoryGridTile(color: Color(0xffFFC545), subTitle: '45 Notes',name: "Succees",),
                      CategoryGridTile(color: Color(0xff54D35C), subTitle: '29 Notes',name: "Scientific",),
                      CategoryGridTile(color: Color(0xffE86AFF), subTitle: '19 Notes',name: "Freelancer",),
                      CategoryGridTile(color: Color(0xff428AFB), subTitle: '15 Notes',name: "Design",),
                      CategoryGridTile(color: Color(0xffFFC545), subTitle: '45 Notes',name: "Succees",),
                      CategoryGridTile(color: Color(0xff54D35C), subTitle: '29 Notes',name: "Scientific",),
                      CategoryGridTile(color: Color(0xffE86AFF), subTitle: '19 Notes',name: "Freelancer",),
                      CategoryGridTile(color: Color(0xff428AFB), subTitle: '15 Notes',name: "Design",),
                      CategoryGridTile(color: Color(0xffFFC545), subTitle: '45 Notes',name: "Succees",),
                      CategoryGridTile(color: Color(0xff54D35C), subTitle: '29 Notes',name: "Scientific",),
                      CategoryGridTile(color: Color(0xffE86AFF), subTitle: '19 Notes',name: "Freelancer",),
                    ],
                  ))
                ]
            )
        ),
        bottomBar: BottomBar(),
    );
  }
}

class CategoryGridTile extends StatelessWidget {
  final Color color;
  final String name;
  final String subTitle;
  const CategoryGridTile({Key? key,required this.color,required this.name,required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: 20
      ),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
          ),
          color: color.withOpacity(.2)
      ),
      child: Column(
        children: [
          Icon(Iconsax.folder_25,color: color,size: 100,),
          Text(name,style: Theme.of(context).textTheme.headline6,),
          Text(subTitle,style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Color(0xff6B6D6F)))
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:notsy/pages/home_page.dart';
class SetupPage extends StatelessWidget {
  SetupPage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Iconsax.note_214,
                        color: Colors.white,
                        size: 70,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Notsy",
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.copyWith(color: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Easly Manage Your Notes On Your Phone & You can Have Infinite Notes",
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            ?.copyWith(color: Color(0xff626362)),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                  child: Text("Loading..",style: TextStyle(color: Color(0xffc6c7ce)),),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 30),
                child: TextButton(
                  onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>HomePage()));
                  },
                  child: Text("Home Page",style: TextStyle(color: Colors.white),),
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: Theme.of(context)
          .primaryColor, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

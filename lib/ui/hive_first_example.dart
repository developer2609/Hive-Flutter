import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hiveflutter/ui/hive_second_example.dart';

class HiveFirstExample extends StatefulWidget {
   HiveFirstExample({Key? key}) : super(key: key);

  @override
  State<HiveFirstExample> createState() => _HiveFirstExampleState();
}

class _HiveFirstExampleState extends State<HiveFirstExample> {
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var   box=Hive.box('vegetable');
    return Scaffold(
      appBar: AppBar(title: Text("App bar"),),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 440,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder()
                ),
              ),
            ),
            IconButton(onPressed: (){
               box.add(controller.text);
               setState(() {

               });
              // print(box.name);
            }, icon:Icon(Icons.add)),
            SizedBox(height: 100,),
            ListView.builder(
              shrinkWrap: true,
              itemCount: box.values.length,
              itemBuilder: (context, index) => Text(box.values.toList()[index]),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HiveSecondExample()));
      }),
    );
  }
}

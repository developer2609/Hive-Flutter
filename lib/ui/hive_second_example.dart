import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hiveflutter/data/models/car_model.dart';

class HiveSecondExample extends StatefulWidget {
   HiveSecondExample({Key? key}) : super(key: key);

  @override
  State<HiveSecondExample> createState() => _HiveSecondExampleState();
}

class _HiveSecondExampleState extends State<HiveSecondExample> {
  TextEditingController name=TextEditingController();

  TextEditingController brand=TextEditingController();

  TextEditingController price=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var   gmbox=Hive.box('gmShowRoom');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("App bar "),),
      floatingActionButton: FloatingActionButton(onPressed: (){
         gmbox.add(CarModel(name: name.text, price:int.parse(price.text.trim()), brand: brand.text));
         setState(() {

         });
         name.clear();
         brand.clear();
         price.clear();
      }),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(

          children: [
            SizedBox(
              height: 100,
              width: 200,
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  label: Text("name"),
                    border: OutlineInputBorder()
                ),
              ),
            ),
            SizedBox(
              height: 100,
              width: 200,
              child: TextField(
                controller: brand,
                decoration: InputDecoration(
                    label: Text("brand"),

                    border: OutlineInputBorder()
                ),
              ),
            ),
            SizedBox(
              height: 100,
              width: 200,
              child: TextField(
                controller: price,
                decoration: InputDecoration(
                    label: Text("price"),

                    border: OutlineInputBorder()
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: gmbox.values.length,
              itemBuilder: (context, index){
                List<CarModel> cars=gmbox.values.toList().cast();
                return  ListTile(
                  title: Text(cars[index].name),
                  subtitle: Text(cars[index].brand),

                );
              })

          ],
        ),
      ),
    );
  }
}

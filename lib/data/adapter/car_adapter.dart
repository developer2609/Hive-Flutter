


import 'package:hive/hive.dart';
import 'package:hiveflutter/data/models/car_model.dart';

class CarAdapter extends TypeAdapter<CarModel>{
  @override
  final int typeId=0;
  @override
  CarModel read(BinaryReader reader) {
    final name =reader.read() as String;
    final brand =reader.read() as String;
    final price =reader.read() as int;

    return CarModel(name: name, price: price, brand: brand);
  }


  @override
  void write(BinaryWriter writer, CarModel obj) {
    writer.write(obj.name);
    writer.write(obj.brand);
    writer.write(obj.price);
  }
  
}
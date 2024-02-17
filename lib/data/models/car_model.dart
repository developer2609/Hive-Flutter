


import 'package:hive/hive.dart';

class CarModel{
  @HiveField(0)
  String name;
  @HiveField(0)
  String brand;
  @HiveField(1)
  num price;

  CarModel({required this.name,required this.price,required this.brand});
}
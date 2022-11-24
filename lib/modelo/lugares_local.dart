import 'package:hive/hive.dart';
part 'lugares_local.g.dart';


@HiveType(typeId:0)
class LugaresLocal extends HiveObject{
  @HiveField(0)
  String? id;

  @HiveField(1)
  String? email;

}
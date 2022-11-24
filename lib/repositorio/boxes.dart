import 'package:hive/hive.dart';
import 'package:proyecto_final/modelo/lugares_local.dart';

class Boxes{
  static Box<LugaresLocal> boxFavoritos()=>Hive.box<LugaresLocal>('favoritos');
}
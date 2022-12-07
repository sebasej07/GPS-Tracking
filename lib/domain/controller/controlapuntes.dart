import 'package:crud_local/data/services/peticionesBD.dart';
import 'package:get/get.dart';

class ControlApuntes extends GetxController{
  final Rxn<List<Map<String, dynamic>>> _listaDetalle=
  Rxn<List<Map<String, dynamic>>>();

  List<Map<String, dynamic>>? get listaDetalle => _listaDetalle.value;

  Future<void> consultarGral() async{
    _listaDetalle.value=await PeticionesBd.listar();
  }

  Future<void> addApuntes(detalle, lon, lat) async{
    await PeticionesBd.adicionar(detalle, lon, lat)
    .then((value) => Get.showSnackbar(const GetSnackBar(
          title: 'Adicionar Apuntes',
          message: 'Datos Almacenados',
          duration: Duration(seconds: 4),
        )) )
    .catchError((e)=> print(e));
  }

  Future<void> delApuntes(id) async{
    await PeticionesBd.eliminar(id)
    .then((value) => null)
    .catchError((e)=>null);
  }
}
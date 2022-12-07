import 'package:sqflite/sqflite.dart' as sql;

class PeticionesBd{

  static Future<void> crearTabla(sql.Database database) async{
    await database.execute(""" CREATE TABLE apuntes(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      detalle TEXT,
      lon TEXT,
      lat TEXT
    )


     """);

  }

  static Future<sql.Database> db() async{

    return sql.openDatabase('reto4.db', version: 1,
    onCreate: (sql.Database database, int version) async {
        await crearTabla(database);
    });

  }

  static Future<void> adicionar(detalle , lon, lat) async{
    final db =await PeticionesBd.db();
    final datos={"detalle": detalle,"lon": lon,"lat": lat};
    await db.insert("apuntes", datos,
     conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }

  static Future<List<Map<String, dynamic>>> listar() async{
    final db =await PeticionesBd.db();
    return db.query("apuntes", orderBy: "detalle");
  }

  static Future<void> eliminar(int id) async{
    final db =await PeticionesBd.db();
    await db.delete("apuntes", where: "id=?", whereArgs: [id]);
  }
}
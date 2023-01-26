

mixin DbAbstractFunction {
  Future insertInTable(Map<String,dynamic>data);
  Future<List<Map<String, dynamic>>> returnFromTable();
  Future delete(int? id);
}

import '../../domain/model/origin_model.dart';

import 'fakeDB.dart';

class Memory {
  List<OriginModel> findAll() {
    return fakeDB.map((e) => OriginModel.fromMap(e)).toList();
  }
}

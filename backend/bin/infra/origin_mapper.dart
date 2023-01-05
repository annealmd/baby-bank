import '../domain/model/origin_model.dart';

class OriginMapper {
  OriginModel toDomain(Map map) => OriginModel.create(
        map['id'],
        map['name'],
      );
}

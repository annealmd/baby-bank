import 'package:password_dart/password_dart.dart';

import '../model/user_model.dart';
import '../port/input/service.dart';
import '../port/output/repository.dart';

class UserServiceIpml implements Service<UserModel> {
  final Repository<UserModel> _userRepository;

  UserServiceIpml(this._userRepository);

  @override
  Future<bool> saveItem({int? idUser, required item}) async {
    if (item.id != null) {
      return await _userRepository.update(idUser, item);
    } else {
      String password = item.password!;
      final algorithm = PBKDF2();
      final hash = Password.hash(password, algorithm);
      item.password = hash;
      return await _userRepository.create(idUser, item);
    }
  }

  @override
  Future<bool> deleteItem({int? idUser, required int id}) async {
    return await _userRepository.delete(idUser, id);
  }

  @override
  Future<List<UserModel>> getList({int? idUser}) async {
    return await _userRepository.findAll(idUser);
  }
}

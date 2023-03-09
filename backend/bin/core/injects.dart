import '../application/web/login_controller.dart';
import '../application/web/origin_controller.dart';
import '../domain/model/origin_model.dart';
import '../domain/port/input/service.dart';
import '../domain/port/output/repository.dart';
import '../domain/service/origin_service_ipml.dart';
import '../infra/database/db_configuration.dart';
import '../infra/database/mysql_db_configuration.dart';
import '../infra/database/origin_repository_ipml_db.dart';
import '../infra/security/security_service.dart';
import '../infra/security/security_service_ipml.dart';
import 'dependency_injector.dart';

class Injects {
  static DependencyInjector initialize() {
    var di = DependencyInjector();

    //BD
    di.register<DBConfiguration>(() => MySqlDBConfiguration());

    //Login
    //Controller
    di.register<LoginController>(() => LoginController());

    //Origin
    //Security
    di.register<SecurityService>(() => SecurityServiceIpml());
    //Repository
    di.register<Repository<OriginModel>>(
        () => OriginRepositoryIpmlDB(di<DBConfiguration>()));
    //Repository internal
    //di.register<Repository<OriginModel>>(() => Memory());
    //Service
    di.register<Service<OriginModel>>(
        () => OriginServiceIpml(di<Repository<OriginModel>>()));
    //Controller
    di.register<OriginController>(
        () => OriginController(di<Service<OriginModel>>()));

    return di;
  }
}

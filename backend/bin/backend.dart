import 'application/web/origin_controller.dart';
import 'core/custom_env.dart';
import 'core/injects.dart';
import 'infra/service/custom_server.dart';

void main(List<String> arguments) async {
  final di = Injects.initialize();
  //await di.get<OriginController>().deleteOrigin(8);
  di.get<OriginController>().getAll(3);
  // print(
  //     '\n rows affected ${await di.get<OriginController>().addOrigin('gym', 3)}');
  // di.get<OriginController>().getAll(3);

  // server
  await CustomServer.initialize(
      address: await CustomEnv.get<String>(key: 'server_address'),
      port: await CustomEnv.get<int>(key: 'server_port'),
      handler: di.get<OriginController>().handler);
}



// inicia o docker,  workbench, run backend
// netstat -ano | findstr :8080
// taskkill /F /PID <LISTENING>
import 'application/web/origin_controller.dart';
import 'core/injects.dart';

void main(List<String> arguments) async {
  final di = Injects.initialize();
  await di.get<OriginController>().deleteOrigin(8);
  di.get<OriginController>().getAll();
  print(
      '/n rows affected ${await di.get<OriginController>().addOrigin('flor')}');
  di.get<OriginController>().getAll();
}



// inicia o docker,  workbench, run backend
// netstat -ano | findstr :8080
// taskkill /F /PID <LISTENING>
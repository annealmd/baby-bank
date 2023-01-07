import 'application/web/origin_controller.dart';
import 'core/injects.dart';

void main(List<String> arguments) async {
  final di = Injects.initialize();
  di.get<OriginController>().getAll();
}



// inicia o docker,  workbench, run backend
// netstat -ano | findstr :8080
// taskkill /F /PID <LISTENING>
import 'package:flutter_patterns/network_repo/network_repository.dart';
import 'package:flutter_patterns/src/models/mv_list_obj.dart';
import 'package:rxdart/subjects.dart';

class SimpleBloc extends NetworkRepository {
  final controller = PublishSubject<List<MvResults>?>();
  Stream<List<MvResults>?> mvStream() => controller.stream;

  getMv(String url, Map<String, dynamic>? param) async {
    await mvFetch(url: url, params: param).then((resp) {
      MvListObj mvObj = MvListObj.fromJson(resp);
      if (!controller.isClosed) {
        controller.sink.add(mvObj.results);
      }
    });
  }

  dispose() {
    controller.close();
  }
}

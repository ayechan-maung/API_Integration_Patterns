import 'package:flutter_patterns/network_repo/network_repository.dart';
import 'package:flutter_patterns/src/models/mv_list_obj.dart';
import 'package:flutter_patterns/utils/api_response.dart';
import 'package:rxdart/subjects.dart';

class SimpleBloc extends NetworkRepository {
  // final controller = PublishSubject<List<MvResults>?>();
  // You can use another static object class in stream data type *****
  // Stream<List<MvResults>?> mvStream() => controller.stream;

  final controller = PublishSubject<SnapshotResponse>();
  Stream<SnapshotResponse> mvStream() => controller.stream;

  SnapshotResponse snap = SnapshotResponse(data: null);

  getMv(String url, Map<String, dynamic>? param) async {
    SnapshotResponse snapshot = await mvFetch(url: url, params: param);
    if (snapshot.hasData) {
      MvListObj mvObj = MvListObj.fromJson(snapshot.data);
      snapshot.data = mvObj.results;
      if (!controller.isClosed) {
        controller.sink.add(snapshot);
      }
    } else {
      controller.sink.add(snapshot);
    }
  }

  dispose() {
    controller.close();
  }
}

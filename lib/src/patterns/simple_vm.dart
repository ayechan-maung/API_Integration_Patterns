import 'package:flutter/material.dart';
import 'package:flutter_patterns/network_repo/network_repository.dart';
import 'package:flutter_patterns/src/models/mv_list_obj.dart';
import 'package:flutter_patterns/utils/api_response.dart';

class SimpleViewModel extends ChangeNotifier {
  NetworkRepository network = NetworkRepository();

  SnapshotResponse snapshot = SnapshotResponse(data: null);
  notifyListeners();

  getMvList({required String url, Map<String, dynamic>? para}) async {
    network.mvFetch(url: url,params: para).then((snap) {
      if (snap.hasData) {
        MvListObj obj = MvListObj.fromJson(snap.data);
        snapshot.data = obj.results;
        notifyListeners();
      } else {
        snapshot.error = snap;
        notifyListeners();
      }
    });

  }
}

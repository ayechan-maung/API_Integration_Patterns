enum ErrorStatus { NotFound, Unknown }

class SnapshotResponse {
  dynamic data;
  dynamic error;
  //to check status
  bool get inLoading => data == null;
  bool get hasData => data != null;
  bool get hasError => error != null;

  SnapshotResponse({this.data, this.error});
}

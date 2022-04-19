import 'package:flutter/material.dart';
import 'package:flutter_patterns/src/models/mv_list_obj.dart';
import 'package:flutter_patterns/src/patterns/simple_vm.dart';
import 'package:flutter_patterns/src/widgets/mv_grid_item.dart';
import 'package:flutter_patterns/utils/api_response.dart';
import 'package:flutter_patterns/utils/url.dart';
import 'package:provider/provider.dart';

class MovieWithVM extends StatefulWidget {
  const MovieWithVM({Key? key}) : super(key: key);

  @override
  State<MovieWithVM> createState() => _MovieWithVMState();
}

class _MovieWithVMState extends State<MovieWithVM> {
  @override
  void initState() {
    super.initState();
    final vm = Provider.of<SimpleViewModel>(context,listen: false);
    vm.getMvList(url: 'popular', para: {'api_key': API_KEY, "page": "1", "language": "en-US"});
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SimpleViewModel>(builder: (context, vm, child){
      SnapshotResponse snap = vm.snapshot;
      if (snap.hasData) {
        List<MvResults> mvList = snap.data;
        return GridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          childAspectRatio: 70 / 130,
          children: mvList.map((e) => MvGridItem(e)).toList(),
        );
      } else if (snap.hasError) {
        return Center(
          child: Text(snap.error.toString()),
        );
      } else {
        return Center(child: CircularProgressIndicator());
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_patterns/src/models/mv_list_obj.dart';
import 'package:flutter_patterns/src/patterns/simple_bloc.dart';
import 'package:flutter_patterns/src/widgets/mv_grid_item.dart';
import 'package:flutter_patterns/utils/api_response.dart';
import 'package:flutter_patterns/utils/url.dart';

class MvWithBloc extends StatefulWidget {
  const MvWithBloc({Key? key}) : super(key: key);

  @override
  State<MvWithBloc> createState() => _MvWithBlocState();
}

class _MvWithBlocState extends State<MvWithBloc> {
  SimpleBloc spBl = SimpleBloc();

  @override
  void initState() {
    super.initState();
    spBl.getMv('now_playing', {'api_key': API_KEY, "page": "1", "language": "en-US"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Now Playing')),
      body: StreamBuilder<SnapshotResponse>(
        stream: spBl.mvStream(),
        initialData: SnapshotResponse(data: null),
        builder: (context, snapshot) {
          SnapshotResponse snap = snapshot.data!;
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
        },
      ),
    );
  }

  @override
  void dispose() {
    spBl.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_patterns/src/ui/movie_with_vm.dart';
import 'package:flutter_patterns/src/ui/mv_with_bloc.dart';

class RootPage extends StatefulWidget {
  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  List<Widget> widgets = [MvWithBloc(),MovieWithVM()];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patterns'),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         context.read<SimpleViewModel>().getMvList(url: 'now_playing', para: {'api_key': API_KEY, "page": "1", "language": "en-US"});
        //       },
        //       icon: Icon(Icons.arrow_forward))
        // ],
      ),
      body: widgets.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.stacked_bar_chart), label: 'Bloc'),
          BottomNavigationBarItem(icon: Icon(Icons.stacked_bar_chart), label: 'MVVM'),
        ],
      ),
    );
  }
}

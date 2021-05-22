import 'package:flutter/material.dart';
import 'package:one_million_tap_egg/model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '100万回の卵を作ってみる',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageModel>(
      create: (_) => HomePageModel(),
      child: Consumer<HomePageModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('100万回タップしよう'),
              centerTitle: true,
            ),
            body: Center(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    model.remainingTapCountToBreakEgg > 0 ? '残り${model.remainingTapCountToBreakEgg}回です' : '卵は割れました',
                    style: TextStyle(fontSize: 24),
                  ),
                  InkWell(
                    onTap: () {
                      model.eggTapped();
                    },
                    child: Container(
                      width: 200,
                      height: 300,
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Center(child: Text('ここに卵の絵', style: TextStyle(fontSize: 20)),),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: ElevatedButton(
              onPressed: () {
                model.resetTapCount();
              },
              child: Text('リセット')
            ),
          );
        },
      ),
    );
  }
}
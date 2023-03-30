import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'count_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child){
            return ListView.builder(
              itemCount: ref.watch(counterProvider).listOfName?.length ?? 0,
                itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${ref.watch(counterProvider).listOfName?[index]}"),
              );
            });
          },
        )
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     const Text(
        //       'You have pushed the button this many times:',
        //     ),
        //     Consumer(
        //       builder: (context, ref, child) {
        //         return Text("${ref.watch(counterProvider).count}", style: Theme.of(context).textTheme.headlineMedium,);
        //       },
        //     ),
        //   ],
        // ),
      ),
      floatingActionButton: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: (){
              //ref.read(counterProvider.notifier).increment();
              showDialog(context: context, builder: (context){
                return AlertDialog(
                  title: Column(
                    children: [
                      TextFormField(
                        controller: controller,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder()
                        ),
                      ),
                      ElevatedButton(onPressed: (){
                        ref.read(counterProvider.notifier).addName(controller.text);
                        Navigator.pop(context);
                      }, child: const Text("Save"))
                    ],
                  ),
                );
              });
            }
          );
        },
      ),
    );
  }
}

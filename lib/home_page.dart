import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_exapmle/user_model.dart';

import 'count_provider.dart';
import 'di/dependency_injection.dart';
import 'profile_page.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends ConsumerState<MyHomePage> {
  TextEditingController controller = TextEditingController();
  UserModel _userModel = getIt<UserModel>();
  UserModel _user = getIt<UserModel>();

  @override
  void initState() {
    _userModel.setName = "Najot talim";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(counterProvider, (previous, next) {
      if (next.count == 5) {}
    });
    return Scaffold(
      appBar: AppBar(
        title:Row(
      children: [
      Text(_userModel.name ?? "test"),
      Text(_user.name ?? ""),
      ],
    ),
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
              // showDialog(context: context, builder: (context){
              //   return AlertDialog(
              //     title: Column(
              //       children: [
              //         TextFormField(
              //           controller: controller,
              //           decoration: const InputDecoration(
              //             border: OutlineInputBorder()
              //           ),
              //         ),
              //         ElevatedButton(onPressed: (){
              //           ref.read(counterProvider.notifier).addName(controller.text);
              //           Navigator.pop(context);
              //         }, child: const Text("Save"))
              //       ],
              //     ),
              //   );
              // });
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProfilePage()));
            }
          );
        },
      ),
    );
  }
}

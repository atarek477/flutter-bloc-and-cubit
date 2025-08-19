import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/models/task_model.dart';
import 'package:untitled/todo_bloc/todo_cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  TextEditingController controller =TextEditingController();
  List<String> listName = ["ahmed ", "mohamed"];
  var testSet = {"ahmed", "ahmed", "mohamed"};



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(

              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              title: Text("todo App"),
            ),
            body: Center(
              child:Column(
                children: [
                  TextField(
                    controller: controller,

                  ),
                  ElevatedButton(onPressed: (){
                    context.read<TodoCubit>().addTask(TaskModel(id:_counter++ , title: controller.text));

                  }, child: Text("create a task")),
                  Expanded(
                      child: ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      final task = state.list[index];
                      return ListTile(
                        title: Text(task.title),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            context.read<TodoCubit>().removeTask(task);
                          },
                        ),
                      );
                    },
                  ))
                ],
              ) ,


            ),
           // This trailing comma makes auto-formatting nicer for build methods.
          );
        },
      ),
    );
  }
}

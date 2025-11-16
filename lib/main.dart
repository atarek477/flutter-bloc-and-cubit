import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/genericList/generic_list_cubit.dart';


void main() => runApp(const TabBarApp());

class TabBarApp extends StatelessWidget {
  const TabBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: BlocProvider(
      create: (context) =>
      GenericListCubit()
        ..getData(1),
      child: const TabBarExample(),
    ));
  }
}

class TabBarExample extends StatefulWidget {
  const TabBarExample({super.key});

  @override
  State<TabBarExample> createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<TabBarExample>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(() {
      if (_tabController.indexIsChanging) return;
      final currentIndex = _tabController.index;

      if (currentIndex == 0) {
        context.read<GenericListCubit>().getData(1);
      } else if (currentIndex == 1) {
        context.read<GenericListCubit>().getData(2);

      } else if (currentIndex == 2) {
        context.read<GenericListCubit>().getData(3);

      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TabBar Sample'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.cloud_outlined)),
            Tab(icon: Icon(Icons.beach_access_sharp)),
            Tab(icon: Icon(Icons.brightness_5_sharp)),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          BlocBuilder<GenericListCubit, GenericListState>(
            builder: (context, state) {
              if (state is GenericListLoaded && state.type == 1) {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) =>
                      ListTile(title: Text(state.list[index])),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          BlocBuilder<GenericListCubit, GenericListState>(
            builder: (context, state) {
              if (state is GenericListLoaded && state.type == 2) {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) =>
                      ListTile(title: Text(state.list[index])),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
          BlocBuilder<GenericListCubit, GenericListState>(
            builder: (context, state) {
              if (state is GenericListLoaded && state.type == 3) {
                return ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) =>
                      ListTile(title: Text(state.list[index])),
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
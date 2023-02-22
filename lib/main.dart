import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.account_circle))
              ],
            ),
            title: const Text('Tab Bar Sample'),
          ),
          body: const TabBarView(children: [
            HomeFregView(),
            ProfileFregView()
          ]),
        ),
      ),
    );
  }
}

class HomeFregView extends StatelessWidget {
  const HomeFregView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade100,
      child: const Center(
            child: Text('Welcome to the Home Page'),
          ),
    );
  }
}

class ProfileFregView extends StatelessWidget {
  const ProfileFregView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade100,
      child: const Center(
            child: Text('Welcome to the Profile Page'),
          ),
    );
  }
}

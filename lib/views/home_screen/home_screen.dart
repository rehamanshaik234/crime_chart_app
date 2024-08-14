import 'package:crime_chart_app/controller/riverpod/home_state.dart';
import 'package:crime_chart_app/utils/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  HomeState homeState=HomeState();
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text("Home",style: TextStyle(color: Colors.white),),centerTitle: true
        ,),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: (){
              context.go("/${RouteNames.chartScreen}");
            }, child: Text("Lets Get Started",style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}

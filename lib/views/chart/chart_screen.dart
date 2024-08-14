import 'package:crime_chart_app/controller/riverpod/home_state.dart';
import 'package:crime_chart_app/models/CrimeModel.dart';
import 'package:crime_chart_app/views/chart/widgets/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChartScreen extends ConsumerStatefulWidget {
  @override
  _CrimeDataWidgetState createState() => _CrimeDataWidgetState();
}

class _CrimeDataWidgetState extends ConsumerState<ChartScreen> {
  HomeState homeState=HomeState();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      homeState.getCrimeData(ref);
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    bool loader=ref.watch(homeState.loader);
    CrimeModel? data= ref.read(homeState.crimeChartModel);
    return Scaffold(
      appBar: AppBar(
        title: Text("Crime Chart",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
        child: loader? CircularProgressIndicator():CrimeDataChart(crimeData: data?.records ?? [],),
      ),
      // Your widget tree here
    );
  }
}

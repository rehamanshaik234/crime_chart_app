import 'package:crime_chart_app/controller/repo/crime_repo.dart';
import 'package:crime_chart_app/models/CrimeModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

class HomeState{
  final loader= StateProvider<bool>((ref)=> false);
  final crimeChartModel= StateProvider<CrimeModel?>((ref)=> null);
  CrimeRepo crimeRepo= CrimeRepo();

  void getCrimeData(WidgetRef ref)async{
    ref.read(loader.notifier).state=true;
    final result= await crimeRepo.getCrimeInfo();
    print(result.response?.data);
    CrimeModel crimeModel=CrimeModel.fromJson(result.response?.data);
    ref.read(crimeChartModel.notifier).state=crimeModel;
    ref.read(loader.notifier).state=false;
  }
}
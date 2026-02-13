import 'package:mvvm_flutter/features/gold/data/models/gold_model.dart';

abstract class GoldState {}
class GoldInitialState extends GoldState {}
class GoldLoadingState extends GoldState {}
class GoldSuccessState extends GoldState {
  final GoldModel goldModel;

  GoldSuccessState({required this.goldModel});
}
class GoldErrorState extends GoldState {
  final String errMsg;

  GoldErrorState({required this.errMsg});
}

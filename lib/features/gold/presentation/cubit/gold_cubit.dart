import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_flutter/features/gold/data/repo/gold_repo.dart';
import 'package:mvvm_flutter/features/gold/presentation/cubit/gold_state.dart';

class GoldCubit extends Cubit<GoldState> {
  final GoldRepo goldRepo;

  GoldCubit(this.goldRepo) : super(GoldInitialState());

  Future<void> getGold() async {
    emit(GoldLoadingState());
    final res = await goldRepo.getGold();
    res.fold(
      (error) {
        emit(GoldErrorState(errMsg: error));
      },
      (goldModel) {
        emit(GoldSuccessState(goldModel: goldModel));
      },
    );
  }
}

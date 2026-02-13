import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_flutter/core/constants/app_images.dart';
import 'package:mvvm_flutter/features/gold/data/repo/gold_repo.dart';
import 'package:mvvm_flutter/features/gold/presentation/cubit/gold_cubit.dart';
import 'package:mvvm_flutter/features/gold/presentation/cubit/gold_state.dart';
import 'package:mvvm_flutter/core/widgets/custom_text.dart';

import '../../../../../core/constants/app_colors.dart';

class GoldScreen extends StatelessWidget {
  const GoldScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldCubit(GoldRepo())..getGold(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: CustomText(text: 'Gold', color: AppColors.goldColor,),
        ),
        body: BlocBuilder<GoldCubit, GoldState>(
          builder: (context, state) {
            if (state is GoldLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GoldErrorState) {
              return Center(child: Text(state.errMsg));
            } else if (state is GoldSuccessState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.goldPhoto, width: 200, height: 250),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: state.goldModel.price.toString(), color: AppColors.goldColor,),
                      CustomText(text: '   USD', color: AppColors.goldColor,),
                    ],
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

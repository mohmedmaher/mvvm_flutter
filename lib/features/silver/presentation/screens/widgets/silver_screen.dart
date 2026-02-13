import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_flutter/core/constants/app_images.dart';
import 'package:mvvm_flutter/features/silver/data/repo/silver_repo.dart';
import 'package:mvvm_flutter/features/silver/presentation/cubit/silver_cubit.dart';
import 'package:mvvm_flutter/features/silver/presentation/cubit/silver_state.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widgets/custom_text.dart';

class SilverScreen extends StatelessWidget {
  const SilverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SilverCubit(SilverRepo())..getSilver(),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: CustomText(text: 'Silver', color: AppColors.silverColor,),
        ),
        body: BlocBuilder<SilverCubit, SilverState>(
          builder: (context, state) {
            if (state is SilverLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is SilverErrorState) {
              return Center(child: Text(state.errMsg));
            } else if (state is SilverSuccessState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.silverPhoto, width: 200, height: 250),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomText(text: state.silverModel.price.toString(), color: AppColors.silverColor,),
                      CustomText(text: '   USD', color: AppColors.silverColor,),
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

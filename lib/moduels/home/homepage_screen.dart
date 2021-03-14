import 'package:beauty_treatment_app/moduels/home/cubit/cubit.dart';
import 'package:beauty_treatment_app/moduels/home/cubit/states.dart';
import 'package:beauty_treatment_app/moduels/home/widgets/bottom_navigation_bar.dart';
import 'package:beauty_treatment_app/moduels/home/widgets/drawer.dart';
import 'package:beauty_treatment_app/shared/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit,HomeStates>(
      builder: (context, state) {
        return state is HomeStateLoading ? Scaffold(body: LoadingIndicator()) : Scaffold(
          appBar: AppBar(
            backgroundColor: HexColor('#f5bebc'),
            title: HomeCubit.get(context).titles[HomeCubit.get(context).currentIndex],
            centerTitle: true,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
          ),
          drawer: HomeDrawer(),
          body: HomeCubit.get(context).widgets[HomeCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavBar(),
        );
      },
    );
  }
}
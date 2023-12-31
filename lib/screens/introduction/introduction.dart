import 'package:flutter/material.dart';
import 'package:flutter_study_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';

class AppIntroductionScreen extends StatelessWidget {
  const AppIntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(gradient: mainGradient()),
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
              children: [
          const Icon(
            Icons.star,
            size: 65,
          ),
          SizedBox(height: 40),
          const Text(

              'This is a study app. you can use it as you want. If you understand how it works, you would be able to scale it. with this you will master firebase backend and flutter front end.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 40),
              AppCircleButton(
                onTap: ()=>Get.offAllNamed("/home"),
                child: const Icon(Icons.arrow_forward, size: 35),
              )
        ]),
      )));
  }
}

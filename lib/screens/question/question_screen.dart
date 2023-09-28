import 'package:flutter/material.dart';
import 'package:flutter_study_app/configs/themes/app_colors.dart';
import 'package:flutter_study_app/configs/themes/ui_parameters.dart';
import 'package:flutter_study_app/controllers/question_papers/questions_controller.dart';
import 'package:flutter_study_app/firebase_ref/loading_status.dart';
import 'package:flutter_study_app/screens/home/custom_text_styles.dart';
import 'package:flutter_study_app/screens/question/test_overview_screen.dart';
import 'package:flutter_study_app/widgets/common/background_decoration.dart';
import 'package:flutter_study_app/widgets/common/custom_app_bar.dart';
import 'package:flutter_study_app/widgets/common/main_button.dart';
import 'package:flutter_study_app/widgets/common/question_place_holder.dart';
import 'package:flutter_study_app/widgets/content_area.dart';
import 'package:flutter_study_app/widgets/questions/answer_card.dart';
import 'package:flutter_study_app/widgets/questions/countdown_timer.dart';
import 'package:get/get.dart';

class QuestionsScreen extends GetView<QuestionsController> {
  const QuestionsScreen({super.key});
  static const String routeName = "/questionsscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: const ShapeDecoration(
              shape: StadiumBorder(
                  side: BorderSide(color: onSurfaceTextColor, width: 2))),
          child: Obx(() => CountdownTimer(
                time: controller.time.value,
                color: onSurfaceTextColor,
              )),
        ),
        showActionIcon: true,
        titleWidget: Obx(() => Text(
              'Q. ${(controller.questionIndex.value + 1).toString().padLeft(2, '0')}',
              style: appBarTS,
            )),
      ),
      body: BackgroundDecoration(
        child: Obx(() => Column(
              children: [
                if (controller.loadingStatus.value == LoadingStatus.loading)
                  const Expanded(
                      child: ContentArea(child: QuestionScreenHolder())),
                if (controller.loadingStatus.value == LoadingStatus.completed)
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.allQuestions.length,
                      itemBuilder: (BuildContext context, int questionIndex) {
                        return ContentArea(
                          child: Column(
                            children: [
                              Text(
                                controller.allQuestions[questionIndex].question,
                                style: questionTS,
                              ),
                              GetBuilder<QuestionsController>(
                                  id: 'answers_list',
                                  builder: (context) {
                                    return ListView.separated(
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.only(top: 25),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        final answer = controller
                                            .allQuestions[questionIndex]
                                            .answers[index];
                                        return AnswerCard(
                                          answer:
                                              '${answer.identifier}.${answer.answer}',
                                          onTap: () {
                                            controller.selectedAnswer(
                                                answer.identifier,
                                                questionIndex);
                                          },
                                          isSelected: answer.identifier ==
                                              controller
                                                  .allQuestions[questionIndex]
                                                  .selectedAnswer,
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              const SizedBox(height: 10),
                                      itemCount: controller
                                          .allQuestions[questionIndex]
                                          .answers
                                          .length,
                                    );
                                  }),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ColoredBox(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Padding(
                    padding: UIParameters.mobileScreenPadding,
                    child: Row(children: [
                      Expanded(
                        child: Visibility(
                            visible: controller.loadingStatus.value ==
                                LoadingStatus.completed,
                            child: MainButton(
                                onTap: () {
                                  Get.toNamed(TestOverviewScreen.routeName);
                                },
                                title: 'Complete')),
                      )
                    ]),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

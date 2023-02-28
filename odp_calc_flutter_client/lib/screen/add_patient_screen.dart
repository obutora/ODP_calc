import 'package:flutter/material.dart';

import '../const.dart';
import '../usecase/form/validator.dart';
import '../widget/frame/main_frame.dart';
import '../widget/style/search_input_decoration.dart';

class AddPatientScreen extends StatelessWidget {
  const AddPatientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();

    return MainFrame(
      title: '患者登録',
      titleDescription: '新しい患者を登録します',
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 28),
          child: Form(
            key: form,
            child: Column(
              children: [
                Center(
                  child: SizedBox(
                    width: 567,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('患者名（空白は不要です）',
                            style: kTextDescription.copyWith(color: kGreen)),
                        const SizedBox(height: 8),
                        TextFormField(
                          cursorColor: kGreen,
                          decoration: searchInputDecoration(hintText: '名前'),
                          style: kTextH4,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              Validator.validate(value: value, validationList: [
                            Validator.notEmpty(value),
                            Validator.notContainSpace(value),
                          ]),
                        ),
                        const SizedBox(height: 32),
                        Text('フリガナ（カタカナ）',
                            style: kTextDescription.copyWith(color: kGreen)),
                        const SizedBox(height: 8),
                        TextFormField(
                          cursorColor: kGreen,
                          decoration:
                              searchInputDecoration(hintText: 'フリガナを入力してください'),
                          style: kTextH4,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              Validator.validate(value: value, validationList: [
                            Validator.notEmpty(value),
                            Validator.notContainSpace(value),
                            Validator.onlyKatakana(value)
                          ]),
                        ),
                        const SizedBox(height: 32),
                        Text('患者ID （半角数字で入力してください）',
                            style: kTextDescription.copyWith(color: kGreen)),
                        const SizedBox(height: 8),
                        TextFormField(
                          cursorColor: kGreen,
                          decoration: searchInputDecoration(hintText: '名前'),
                          style: kTextH4,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              Validator.validate(value: value, validationList: [
                            Validator.notEmpty(value),
                            Validator.notContainSpace(value),
                            Validator.isNum(value)
                          ]),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Row(
                    children: [
                      SelectButtonStandard(
                        text: 'キャンセル',
                        desctiption: 'なにもせずに1つ前の画面に戻ります',
                        onPressed: () {},
                      ),
                      const Spacer(),
                      SelectButtonStandard(
                          text: '登録して次へ',
                          desctiption: 'この内容で患者を登録し、集薬登録画面に進みます。',
                          mainColor: kGreen,
                          textColor: kWhite,
                          onPressed: () {
                            final formState = form.currentState;
                            print(formState!.validate());
                          })
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SelectButtonStandard extends StatelessWidget {
  const SelectButtonStandard({
    super.key,
    required this.text,
    required this.desctiption,
    required this.onPressed,
    this.mainColor = kGrey20,
    this.textColor = kBlack,
  });

  final String text;
  final String desctiption;
  final Function() onPressed;
  final Color mainColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          height: 80,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              // foregroundColor: kWhite,
              backgroundColor: mainColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: kTextH3.copyWith(color: textColor),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(desctiption)
      ],
    );
  }
}

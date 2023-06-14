import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_virtual_live/localization/application_localizations.dart';
import 'package:flutter_virtual_live/ui/auth/tag_page.dart';
import 'package:flutter_virtual_live/utils/component/button/fill_button.dart';
import 'package:flutter_virtual_live/utils/component/text/header_text.dart';
import 'package:flutter_virtual_live/utils/component/text/large_text.dart';
import '../../utils/component/text/extra_small_text.dart';
import '../../utils/component/text/small_text.dart';
import '../../utils/component/text/sub_heading_text.dart';
import '../../utils/helper/app_colors.dart';

class OtpPage extends StatefulWidget {
  String phone;

  OtpPage({Key? key, required this.phone}) : super(key: key);

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  String _otp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor1,
      body: _getBody(),
    );
  }

  _getBody() {
    return Container(
      decoration: (AppColors.backGroundColor()),
      child: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .9519,
            width: double.infinity,
            child: Stack(children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: (const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.backgroundColor1,
                      AppColors.backgroundColor2
                    ],
                  ),
                )),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment: FractionalOffset.topRight,
                        child: Container(
                          margin: const EdgeInsets.only(right: 16),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          height: 30,
                          width: 114,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: AppColors.whiteColor20,
                              borderRadius: BorderRadius.circular(6)),
                          child: SmallText(
                            text: "backToLogin".toLocalization(context),
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    LargeText(
                      text: "otpAuthentication".toLocalization(context),
                      fontWeight: FontWeight.w400,
                      color: AppColors.whiteColor,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 118,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20),
                  child: Container(
                    height: 30,
                    decoration: const BoxDecoration(
                        color: AppColors.whiteColor20,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                        )),
                  ),
                ),
              ),
              Positioned(
                top: 128,
                right: 0,
                left: 0,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0, left: 20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 24,
                            ),
                            HeaderText(
                                text:
                                    "verifyYourNumber".toLocalization(context)),
                            const SizedBox(
                              height: 10,
                            ),
                            SmallText(
                              text: "checkOtpText".toLocalization(context),
                              color: AppColors.blackTheme,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            SmallText(
                              text: widget.phone,
                              color: AppColors.textGreyColor,
                              fontWeight: FontWeight.w400,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            FittedBox(
                              child: SizedBox(
                                height: 50,
                                child: OtpTextField(
                                  fieldWidth: 50,
                                  numberOfFields: 4,
                                  borderColor: AppColors.borderColor,
                                  cursorColor: AppColors.black,
                                  borderRadius: BorderRadius.circular(4),
                                  enabledBorderColor: AppColors.borderColor,
                                  focusedBorderColor: AppColors.borderColor,
                                  textStyle: const TextStyle(
                                      fontSize: 18,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.w400),
                                  showFieldAsBox: true,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  borderWidth: 1,
                                  onCodeChanged: (String code) {
                                    _otp = code;
                                  },
                                  onSubmit: (String verificationCode) {
                                    _otp = verificationCode;
                                  },
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            _otp.isEmpty
                                ? Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: AppColors.Gradient2,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Center(
                                      child: SubHeadingText(
                                        text: "submit",
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  )
                                : FillButton(
                                    text: "submit".toLocalization(context),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => const TagPage()));
                                    }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          )
        ],
      )),
    );
  }
}

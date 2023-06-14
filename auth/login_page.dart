import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_virtual_live/localization/application_localizations.dart';
import 'package:flutter_virtual_live/utils/component/button/fill_button.dart';

import '../../utils/component/other/text_field_style.dart';
import '../../utils/component/text/large_text.dart';
import '../../utils/component/text/extra_small_text.dart';
import '../../utils/component/text/small_text.dart';
import '../../utils/constant/assets_const.dart';
import '../../utils/helper/app_colors.dart';
import '../setting/account_setting_page.dart';
import 'otp_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
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
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Spacer(),
                          ExtraSmallText(
                            text: "dontHaveAccount".toLocalization(context),
                            color: AppColors.whiteColor,
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          AccountSettingPage()));
                            },
                            child: Align(
                              alignment: FractionalOffset.topRight,
                              child: Container(
                                height: 30,
                                width: 78,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.whiteColor20,
                                    borderRadius: BorderRadius.circular(6)),
                                child: SmallText(
                                  text: "signUp".toLocalization(context),
                                  color: AppColors.whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      LargeText(
                        text: "signInToAccount".toLocalization(context),
                        fontWeight: FontWeight.w400,
                        color: AppColors.whiteColor,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
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
                    decoration: BoxDecoration(
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
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0, left: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 24,
                            ),
                            LargeText(
                                text: "welcomeBack".toLocalization(context)),
                            const SizedBox(
                              height: 10,
                            ),
                            SmallText(
                                text: "enterYourMobileNumber"
                                    .toLocalization(context),
                                fontWeight: FontWeight.w400,
                                color: AppColors.textGreyColor),
                            const SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              textAlignVertical: TextAlignVertical.center,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(15),
                              ],
                              decoration: TextFieldStyle.inputDecoration(
                                "phoneHint".toLocalization(context),
                                prefixIconWidget: IntrinsicHeight(
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Stack(
                                        alignment: Alignment.centerRight,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12),
                                            child: Image.asset(
                                              triangleDownArrow,
                                              height: 6,
                                              width: 10,
                                              color: AppColors.iconColor,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 78,
                                            child: CountryCodePicker(
                                                padding: const EdgeInsets.only(
                                                    left: 6),
                                                onChanged: (code) {
                                                  // return country code and details
                                                },
                                                alignLeft: true,
                                                showFlag: false,
                                                initialSelection: 'US',
                                                textStyle:
                                                    TextFieldStyle.textStyle,
                                                onInit: (code) => {
                                                      print(
                                                          "on init ${code!.name} ${code.dialCode} ${code.name}"),
                                                    }),
                                          ),
                                        ],
                                      ),
                                      const VerticalDivider(
                                        color: AppColors.borderSecondaryColor,
                                        thickness: 1.5,
                                        indent: 12,
                                        endIndent: 12,
                                        width: 0,
                                      ),
                                      const SizedBox(width: 12)
                                    ],
                                  ),
                                ),
                                labelText: '',
                              ),
                              style: TextFieldStyle.textStyle,
                              controller: _phoneController,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            FillButton(
                                text: "login".toLocalization(context),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => OtpPage(
                                                phone: _phoneController.text,
                                              )));
                                }),
                            const SizedBox(
                              height: 24,
                            ),
                            SmallText(
                              text: "signInWith".toLocalization(context),
                              color: AppColors.textGreyColor,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      googleIcon,
                                      height: 20,
                                      width: 20,
                                    ),
                                    //icon data for elevated button
                                    label: SmallText(
                                        text: "google".toLocalization(context)),
                                    //label text
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.whiteColor,
                                        fixedSize: Size(160, 50),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)))),
                                  ),
                                ),
                                const SizedBox(
                                  width: 13,
                                ),
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: Image.asset(
                                      facebookIcon,
                                      height: 20,
                                      width: 20,
                                    ),
                                    //icon data for elevated button
                                    label: SmallText(
                                        text:
                                            "facebook".toLocalization(context)),
                                    //label text
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.whiteColor,
                                        fixedSize: Size(160, 50),
                                        shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8)))),
                                  ),
                                )
                              ],
                            ),
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

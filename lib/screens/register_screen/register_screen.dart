
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/clip_path.dart';
import 'package:newapexproject/component/register_button.dart';
import 'package:newapexproject/component/rich_text.dart';
import 'package:newapexproject/component/text_field.dart';
import 'package:newapexproject/routes/app_route.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: Get.width.w,
              height: Get.height * 0.4.h,
              child: CustomPaint(
                child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100.w,
                    height: 80.h,
                    child: Image.asset("assets/images/logo.png"),
                  ),
                ],
              ),
                painter: Shapes(),
              ),
            ),
            FixedTextField(
              key: key,
              label: "Name",
              function: (v) {},
            ),
            FixedTextField(
              key: key,
              label: "Email",
              function: (v) {},
            ),
            FixedTextField(
              key: key,
              label: "Phone",
              function: (v) {},
            ),
            FixedTextField(
              key: key,
              label: "Password",
              function: (v) {},
            ),
            box(),
            RegisterButton(
              key: key,
              function: () {
                Get.toNamed(AppRoutes.productScreen);
              },
              label: "Register",
            ),
            box(),
            FixedRichText(
              key: key,
              leftLabel: "Already have an account?",
              rightLabel: "Log in",
              onTab: () {
                Get.toNamed(AppRoutes.loginScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget box() {
    return  SizedBox(
      height: 40.h,
    );
  }
}

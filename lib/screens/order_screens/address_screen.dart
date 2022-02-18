
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:newapexproject/component/add_button.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:newapexproject/component/text_field.dart';
import 'package:newapexproject/routes/app_route.dart';

class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        label: "Order",
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0, right: 10.0),
            child: Column(
              children: [
                FixedTextField(
                  key: key,
                  label: "First name",
                  function: (v) {},
                ),
                FixedTextField(
                  key: key,
                  label: "Last name",
                  function: (v) {},
                ),
                FixedTextField(
                  key: key,
                  label: "Email name *Optional",
                  function: (v) {},
                ),
                FixedTextField(
                  key: key,
                  label: "Address ",
                  function: (v) {},
                ),
                FixedTextField(
                  key: key,
                  label: "Phone 1",
                  function: (v) {},
                ),
                FixedTextField(
                  key: key,
                  label: "Phone 2 *Optional",
                  function: (v) {},
                ),
                FixedTextField(
                  key: key,
                  label: "Note ",
                  function: (v) {},
                ),
                box(),
                Center(
                  child: AddButton(
                      text: 'Continue to Payment',
                      onPressed: () {
                        Get.toNamed(AppRoutes.paymentScreen);
                      }),
                ),
              ],
            )
            // Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       // ListTile(
            //       //   selectedTileColor: K.mainColor,
            //       //   enabled: true,
            //       //   leading:TextButton.icon(
            //       //     onPressed: () => showDialog<String>(
            //       //       context: context,
            //       //       builder: (BuildContext context) =>
            //       //           AlertDialog(
            //       //         actions: <Widget>[
            //       //           TextButton(child: const Text('Add'),
            //       //             onPressed: () {
            //       //               Get.back();
            //       //               ScaffoldMessenger.of(context).showSnackBar(
            //       //                   const SnackBar(
            //       //                     content: Text('Category cannot be empty'),));
            //       //             },),
            //       //           TextButton(child: const Text('Cancel'), onPressed: () { Get.back(); },),
            //       //         ],
            //       //         content: TextFormField(
            //       //           controller: categoryController,
            //       //           onChanged: (value) {},
            //       //           decoration: const InputDecoration(
            //       //               hintText: 'add address'
            //       //           ),
            //       //         ),
            //       //       ),
            //       //     ),
            //       //     label: Text( 'Add new Address',),
            //       //     icon: const Icon(
            //       //       Icons.category,
            //       //       color: K.blackColor,
            //       //     ),
            //       //   ),
            //       // ),
            //     ]),
            ),
      ),
    );
  }

  Widget box() => SizedBox(
        height: 100.h,
      );
}

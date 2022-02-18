import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newapexproject/component/appbar.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../constant.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(

        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline,
              color: Colors.black,
              size: 28,
            ),
          ),
          K.sizedBoxW,
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0,right: 10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Text(
                  'Order No. #15252',
                  style: TextStyle(fontSize: 20),
                ),
                K.sizedBoxH,
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text('Classic Hoodie',style: TextStyle(color: K.grayColor,fontSize: 16),),
                    K.sizedBoxW,
                    K.sizedBoxW,
                    const Text('x3',style: TextStyle(color: K.grayColor,fontSize: 20),),
                    const Text('\$338.00',style: TextStyle(color: K.blackColor ),),
                  ],
                ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    const Text('jonie Women Shoes',style: TextStyle(color: K.grayColor,fontSize: 16),),
                    K.sizedBoxW,
                    K.sizedBoxW,
                    Text('x1',style: const TextStyle(color: K.grayColor,fontSize: 20),),
                    Text('\122.00',style: const TextStyle(color: K.blackColor ),),
                  ],
                ), K.sizedBoxH,
                Container(
                  height: MediaQuery.of(context).size.height*.15,
                  padding: EdgeInsets.all(15),
                  color: K.grayColor.withOpacity(.3),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text(
                            'Subtotal',
                            style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(color: K.blackColor),
                            ),
                          ),
                          const Text(
                            '\$360.00',
                            style: TextStyle(
                                fontSize: 15,
                                color: K.blackColor),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text('Shipping Method',
                            style: GoogleFonts.aBeeZee(
                              textStyle: TextStyle(color: K.blackColor),
                            ),
                          ),
                          const Text('\$Shipping',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: K.blackColor,
                                  height: 2)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Text(
                            'Total',
                            style: GoogleFonts.aBeeZee(
                              textStyle: const TextStyle(color: K.blackColor,
                                fontWeight: FontWeight.bold,

                              ),
                            ),
                            ),
                          const Text(
                            '\$400.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: K.blackColor,
                                height: 3),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                K.sizedBoxH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Status', style: TextStyle(color: K.blackColor,fontSize: 14 ,fontWeight: FontWeight.bold)),
                    Text('PROCESSING'.toUpperCase(),style: TextStyle(color: K.mainColor),)
                  ],
                ),
                K.sizedBoxH,

                const StepProgressIndicator(
                  totalSteps: 5,
                  currentStep: 2,
                  selectedColor: K.mainColor,
                  unselectedColor: K.grayColor,
                ),

                K.sizedBoxH,
                const Text('Shipping Address',style: TextStyle(color: K.blackColor,fontSize: 18 ,fontWeight: FontWeight.bold),),
                const Text('128 trandonSt ,london ,Mit ',style: TextStyle(color: K.grayColor,fontSize: 14 ,fontWeight: FontWeight.normal ,height: 2),),
                ],
          ),
        ),
      ),
    );
  }
}

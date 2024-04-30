import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monami/controller/users/auth/Login_controller.dart';
import 'package:monami/core/class/handlingDataview.dart';
import 'package:monami/core/constant/colorApp.dart';
import 'package:monami/core/constant/routes.dart';
import 'package:monami/linkapi.dart';
import 'package:monami/view/widget/profile/SujetsFavorite.dart';
import '../../../../controller/users/profile/viewprofilecontroller.dart';

class profile2_0 extends StatelessWidget {
  const profile2_0({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
      LogincontrollerImp controlleraut = Get.put(LogincontrollerImp());
    Get.put(usersprofilecontrollerImp());

    return Scaffold(
        body: Container(
            child: GetBuilder<usersprofilecontrollerImp>(
                builder: (controller) => handlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                              height: 700,
                              width: double.infinity,
                              child: ListView(children: [
                                SingleChildScrollView(
                                  scrollDirection: Axis.vertical,
                                  child: Column(children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 170,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                                colors: [
                                                  Colors.white,
                                                  Color.fromARGB(
                                                      255, 255, 239, 215),
                                                  Color.fromARGB(
                                                      255, 247, 224, 191),
                                                ],
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter),
                                            borderRadius: BorderRadius.only(
                                                bottomLeft: Radius.circular(60),
                                                bottomRight:
                                                    Radius.circular(60)),
                                          ),
                                        ),
                                        Center(
                                          child: InkWell(
                                            onTap: () {
                                              controller.gotoeditprofileusers(
                                                  controller.data[index]);
                                            },
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 175),
                                                height: 20,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  60),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  60),
                                                          topRight:
                                                              Radius.circular(
                                                                  60),
                                                          topLeft:
                                                              Radius.circular(
                                                                  60)),
                                                  // border: Border.all(
                                                  //     width: 1,
                                                  //     color: AppColor
                                                  //         .buttommonami),
                                                ),
                                                child: Center(
                                                    child: Text(
                                                  '18'.tr,
                                                ))),
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(top: 200),
                                            height: 0.5,
                                            width: double.infinity,
                                            decoration: const BoxDecoration(
                                                color: AppColor.grey)),
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  top: 15, left: 25),
                                              width: 108,
                                              height: 129,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: AssetImage(
                                                          "images/profile.png"),
                                                      fit: BoxFit.cover),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(16.0),
                                                    bottomRight:
                                                        Radius.circular(16.0),
                                                    topRight:
                                                        Radius.circular(16.0),
                                                    bottomLeft:
                                                        Radius.circular(16.0),
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppColor.black
                                                          .withOpacity(0.1),
                                                      spreadRadius: 2,
                                                      blurRadius: 4,
                                                      offset: Offset(0,
                                                          4), // changes position of shadow
                                                    ),
                                                  ],
                                                  border: Border.all(
                                                      color: AppColor.white,
                                                      width: 3)),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 10, top: 60),
                                                  child: Text(
                                                    controller
                                                        .data[index].usersName!,
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: AppColor.black),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    child: Text(
                                                      controller.data[index]
                                                          .usersAge!,
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    )),
                                                Row(
                                                  children: [
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 9),
                                                        child: Text(
                                                          controller.data[index]
                                                              .usersCuntry!,
                                                          style: TextStyle(
                                                              fontSize: 10,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                        )),
                                                    Container(
                                                        child: Text(
                                                      "  ans",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .normal),
                                                    )),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 15, left: 25),
                                          width: 108,
                                          height: 129,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                    '${AppLink.imagesprof}/${controller.data[index].usersImage}',
                                                  ),
                                                  fit: BoxFit.cover),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(16.0),
                                                bottomRight:
                                                    Radius.circular(16.0),
                                                topRight: Radius.circular(16.0),
                                                bottomLeft:
                                                    Radius.circular(16.0),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColor.black
                                                      .withOpacity(0.1),
                                                  spreadRadius: 2,
                                                  blurRadius: 4,
                                                  offset: Offset(0,
                                                      4), // changes position of shadow
                                                ),
                                              ],
                                              border: Border.all(
                                                  color: AppColor.white,
                                                  width: 3)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // Container(
                                    //     alignment: Alignment.topLeft,
                                    //     margin: EdgeInsets.only(left: 30),
                                    //     child: Text(
                                    //       '23'.tr,
                                    //       style: TextStyle(
                                    //           fontWeight: FontWeight.w500,
                                    //           fontSize: 12,
                                    //           color: AppColor.black),
                                    //     )),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                            topRight: Radius.circular(0),
                                            topLeft: Radius.circular(0)),
                                        border: Border.all(
                                            width: 1,
                                            color: AppColor.buttommonami),
                                      ),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Inviter des amis ",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "et prifité 2 min gratuite ",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            ),
                                            Icon(Icons.person_add)
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Get.toNamed(AppRoutes.serviceClients);
                                      },
                                      child: ListTile(
                                        trailing:
                                            Icon(Icons.arrow_forward_ios_sharp),
                                        title: Text(
                                          '4'.tr,
                                          style:
                                              TextStyle(color: AppColor.black),
                                        ),
                                        leading: const Icon(Icons.help_outline,
                                            color: AppColor.black),
                                      ),
                                    ),
                                    ListTile(
                                      trailing:
                                          Icon(Icons.arrow_forward_ios_sharp),
                                      title: Text(
                                        "32".tr,
                                        style: TextStyle(color: AppColor.black),
                                      ),
                                      leading: Icon(Icons.translate_outlined,
                                          color: AppColor.black),
                                      onTap: () {
                                        Get.toNamed(AppRoutes.language);
                                      },
                                    ),
                                    ListTile(
                                      trailing:
                                          Icon(Icons.arrow_forward_ios_sharp),
                                      title: Text(
                                        "33".tr,
                                        style: TextStyle(color: AppColor.black),
                                      ),
                                      leading: Icon(
                                          Icons.notifications_outlined,
                                          color: AppColor.black),
                                    ),
                                    ListTile(
                                      trailing:
                                          Icon(Icons.arrow_forward_ios_sharp),
                                      title: Text(
                                        'Sécurité',
                                        style: TextStyle(color: AppColor.black),
                                      ),
                                      leading: Icon(Icons.lock_outlined,
                                          color: AppColor.black),
                                    ),
                                    ListTile(
                                      trailing:
                                          Icon(Icons.arrow_forward_ios_sharp),
                                      title: Text(
                                        '36'.tr,
                                        style: TextStyle(color: AppColor.black),
                                      ),
                                      leading: Icon(Icons.person_off_rounded,
                                          color: AppColor.black),
                                    ),
                                    ListTile(
                                      trailing:
                                          Icon(Icons.arrow_forward_ios_sharp),
                                      title: Text(
                                        "35".tr,
                                        style: TextStyle(color: AppColor.black),
                                      ),
                                      leading: Icon(Icons.description_outlined,
                                          color: AppColor.black),
                                      onTap: () {
                                        Get.toNamed(AppRoutes.Conditions);
                                      },
                                    ),
                                    ListTile(
                                      trailing:
                                          Icon(Icons.arrow_forward_ios_sharp),
                                      title: Text(
                                        "37".tr,
                                        style: TextStyle(color: AppColor.black),
                                      ),
                                      leading: Icon(Icons.logout,
                                          color: AppColor.black),
                                      onTap: () {
                                     Get.defaultDialog(
                    title: '37'.tr,
                    content: Column(
                      children: [
                        Wrap(
                          children: [
                            Text("121".tr),
                          ],
                        ),
                      ],
                    ),
                    actions: [
                      MaterialButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          'No',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          controlleraut.logouat();
                          //  Get.back();
                        },
                        child: Text(
                          '96'.tr,
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ]);
                                      },
                                    ),
                                  ]),
                                )
                              ]));
                        })))));
  }
}

                                      // Container(
                                      //     alignment: Alignment.topLeft,
                                      //     margin: EdgeInsets.only(left: 30),
                                      //     child: Text(
                                      //       '24'.tr,
                                      //       style: TextStyle(
                                      //         fontSize: 12,
                                      //         fontWeight: FontWeight.w500,
                                      //       ),
                                      //     )),
                                      // Container(
                                      //   padding: EdgeInsets.symmetric(
                                      //       horizontal: 10),
                                      //   child: Wrap(
                                      //     children: [
                                      //       Sujetsfavoriteprofile(
                                      //           titleappbar: "Sport"),
                                      //       Sujetsfavoriteprofile(
                                      //           titleappbar:
                                      //               "Problemes sociaux"),
                                      //       Sujetsfavoriteprofile(
                                      //           titleappbar: "Voyage"),
                                      //       Sujetsfavoriteprofile(
                                      //           titleappbar: "Cuisine"),
                                      //       Sujetsfavoriteprofile(
                                      //           titleappbar: "shoping"),
                                      //       Sujetsfavoriteprofile(
                                      //           titleappbar: "Les histoi"),
                                      //       Sujetsfavoriteprofile(
                                      //           titleappbar:
                                      //               "Curture générale"),
                                      //       Sujetsfavoriteprofile(
                                      //           titleappbar:
                                      //               "fitness et santé "),
                                      //     ],
                                      //   ),
                                      // ),
                                
                
         

              
              
              
              
              
              
              
//               Cstmedatausers(
//                 usersmodel: usersModel.fromJson(controller.data[i]),
//                 ontap: () {
//                  
//                   // Get.offNamed(AppRoutes.editprofile);
//                 },
//               );
//             }),
//       ),
//     )));
//   }
// }

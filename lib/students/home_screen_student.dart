import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monami/students/auth/controller/login_controller.dart';
import 'package:monami/students/profile/controller/get_profile_page_students_controller.dart';
import 'package:monami/core/constant/app_color.dart';
import 'package:monami/core/constant/routes.dart';
import 'package:monami/students/home/views/pages/home_page.dart';
import 'package:monami/students/messages/views/pages/messages_page_students.dart';
import 'package:monami/students/favorites/views/pages/favorite_page.dart';
import 'package:monami/students/profile/views/pages/profile_page_students.dart';
import 'package:monami/students/search/views/pages/search_page_students.dart';
import 'package:monami/students/auth/views/widget/cstmBottomAuth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SearchPageStudents(),
    MyFavorite(),
    MessagesPageStudents(),
    ProfilePageStudents(),
  ];
  @override
  Widget build(BuildContext context) {
    LogincontrollerImp controller = Get.put(LogincontrollerImp());

    Get.put(GetProfilePageStudentsControllerImp());

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined,
                color: AppColor.buttommonami),
            onPressed: () {
              Get.toNamed(AppRoutes.notifusers);
            },
          ),
        ],
        flexibleSpace: Container(
            margin: EdgeInsets.only(top: 50),
            height: 150,
            width: 250,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/monami.png'),
                  fit: BoxFit.fitHeight),
            )),
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
              ),
              color: AppColor.buttommonami);
        }),
      ),
      drawerScrimColor: Colors.orange.withOpacity(0.2),
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColor.white, Color(0xffF7EAD6)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: ListView(padding: EdgeInsets.zero, children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                '',
                style: TextStyle(color: AppColor.black),
              ),
              accountEmail: Text(
                '',
                style: TextStyle(color: AppColor.black),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
              ),
            ),
            Column(
              children: [
                ListTile(
                  title: Text(
                    '1'.tr,
                    style: TextStyle(color: AppColor.black),
                  ),
                  leading: const Icon(
                    Icons.home,
                    color: AppColor.black,
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed("HomeScreen");
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.account_balance_wallet_rounded,
                    color: AppColor.black,
                  ),
                  title: Text(
                    '2'.tr,
                    style: TextStyle(color: AppColor.black),
                  ),
                  onTap: () {},
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.Setting);
                  },
                  child: ListTile(
                    title: Text(
                      '3'.tr,
                      style: TextStyle(color: AppColor.black),
                    ),
                    leading: Icon(Icons.settings, color: AppColor.black),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AppRoutes.CustomerServicesStudents);
                  },
                  child: ListTile(
                    title: Text(
                      '4'.tr,
                      style: TextStyle(color: AppColor.black),
                    ),
                    leading:
                        const Icon(Icons.help_outline, color: AppColor.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 240),
            cstmBottomchesir(
              onPressed: () {
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
                          controller.logouat();
                          //  Get.back();
                        },
                        child: Text(
                          '96'.tr,
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ]);
              },
              text: '5'.tr,
            )
          ]),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        // tabBorderRadius: 20,
        height: 60,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        // duration: Duration(milliseconds: 900),
        // color: AppColor.buttommonami,
        // activeColor: Color.fromRGBO(249, 186, 92, 1),
        // iconSize: 20,
        // tabBackgroundColor: Colors.orange.withOpacity(0.1),
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        onDestinationSelected: (_selectedIndex) => setState(
          () => this._selectedIndex = _selectedIndex,
        ),
        destinations: [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: AppColor.buttommonami,
            ),
            selectedIcon: Icon(
              Icons.home,
              color: AppColor.buttommonami,
            ),
            label: '12'.tr,
          ),
          NavigationDestination(
            icon: Icon(
              Icons.search_outlined,
              color: AppColor.buttommonami,
            ),
            selectedIcon: Icon(
              Icons.search,
              color: AppColor.buttommonami,
            ),
            label: '13'.tr,
          ),
          NavigationDestination(
            icon: Icon(
              Icons.favorite_outline,
              color: AppColor.buttommonami,
            ),
            selectedIcon: Icon(
              Icons.favorite,
              color: AppColor.buttommonami,
            ),
            label: '16'.tr,
          ),
          NavigationDestination(
            icon: Icon(
              Icons.message_outlined,
              color: AppColor.buttommonami,
            ),
            selectedIcon: Icon(
              Icons.message,
              color: AppColor.buttommonami,
            ),
            label: '14'.tr,
          ),
          NavigationDestination(
            icon: Icon(
              Icons.person_outlined,
              color: AppColor.buttommonami,
            ),
            selectedIcon: Icon(
              Icons.person,
              color: AppColor.buttommonami,
            ),
            label: '15'.tr,
          ),
        ],
        selectedIndex: _selectedIndex,
        // onTabChange: (index) {
        //   setState(() {
        //     _selectedIndex = index;
        //   });
        // },
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          AppColor.primaryColormonami,
          AppColor.white,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}

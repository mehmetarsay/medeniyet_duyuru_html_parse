import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';
import 'package:flutter/material.dart';
import 'package:medeniyet_duyuru/app/color.dart';
import 'package:medeniyet_duyuru/app/department_list.dart';
import 'package:medeniyet_duyuru/ui/all_announcement_page.dart';
import 'package:medeniyet_duyuru/ui/get_departmant_sheet.dart';
class HomePage extends StatefulWidget with ChangeNotifier {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Department department = deparment1[0][0];
  String appBarText = deparment1[0][0].name;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTable.color1,
        title: Text('${appBarText} Duyurular',
            style: TextStyle(color: Colors.white)),
      ),
      body: AllAnnouncementPage(department),
      bottomNavigationBar: BottomBarWithSheet(
        selectedIndex: _selectedIndex,
        sheetChild:GetDepartmant((Department value){
          setState(() {
            department.url  = value.url;
            department.loc = value.loc;
            appBarText = value.name;
          });

        }),
        bottomBarTheme: BottomBarTheme(
          mainButtonPosition: MainButtonPosition.Middle,
        ),
        mainActionButtonTheme: MainActionButtonTheme(
          size: 55,
          color: ColorTable.color1,
          icon: Icon(
            Icons.autorenew,
            color: Colors.white,
            size: 35,
          ),
        ),
        onSelectItem: (index) => setState(() => _selectedIndex = index),
        items: [
         // BottomBarWithSheetItem(icon: Icons.people),
         // BottomBarWithSheetItem(icon: Icons.shopping_cart),
        ],
      ),
    );
  }
}

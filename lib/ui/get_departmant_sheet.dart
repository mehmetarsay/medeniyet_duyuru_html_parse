

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:medeniyet_duyuru/app/Constants.dart';
import 'package:medeniyet_duyuru/app/color.dart';
import 'package:medeniyet_duyuru/app/department_list.dart';
import 'package:medeniyet_duyuru/ui/home_page.dart';
import 'package:medeniyet_duyuru/widget/kategori_widget.dart';
import 'package:provider/provider.dart';

class GetDepartmant extends StatefulWidget {
  Function onTap;
  @override
  _GetDepartmantState createState() => _GetDepartmantState();

  GetDepartmant(this.onTap);
}

class _GetDepartmantState extends State<GetDepartmant> {
 List<List<Department>> list = deparment1;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Constants.setHeight(context, 400),
      width: Constants.getWidth(context),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(8),
          itemCount:list.length,
          itemBuilder: (BuildContext context, int index) {
            return Material(
              child: InkWell(
                splashColor: ColorTable.color1,
                child: KategoriWidget(
                  text: list[index][0].name,padding: index == 0 ?0:50,
                ),
                onTap: () {
                  widget.onTap(list[index][0]);
                },
              ),
            );
          }),
    );
  }
}

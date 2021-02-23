import 'package:flutter/material.dart';
import 'package:medeniyet_duyuru/app/Constants.dart';
class KategoriWidget extends StatelessWidget {
  double padding;
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Container(
        height: Constants.setHeight(context, 50),
        width: Constants.getWidth(context),
        alignment: Alignment.centerRight,

        child: Container(
          height: Constants.setHeight(context, 50),
          width: Constants.getWidth(context)-Constants.setWidth(context, padding),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8
                )
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text(
              text,
            ),
          ),
        ),
      ),
    );
  }

  KategoriWidget({this.padding=10, this.text='text'});
}

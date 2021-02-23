import 'package:flutter/cupertino.dart';

class Constants{
  static double setHeight(BuildContext context,double value){
    return MediaQuery.of(context).size.height/759*value;
  }
  static double setWidth(BuildContext context,double value){
    return MediaQuery.of(context).size.width/392*value;
  }
  static double getHeight(BuildContext context){
    return MediaQuery.of(context).size.height;
  }
  static double getWidth(BuildContext context){
    return MediaQuery.of(context).size.width;
  }
}
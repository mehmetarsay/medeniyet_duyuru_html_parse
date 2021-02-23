import 'dart:io';

import 'package:flutter/material.dart';
import 'package:medeniyet_duyuru/app/color.dart';
import 'package:medeniyet_duyuru/app/department_list.dart';
import 'package:medeniyet_duyuru/model/announcement_model.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  Announcement data;
  Department department;
  @override
  WebViewPageState createState() => WebViewPageState();

  WebViewPage(this.data,this.department);
}

class WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: ColorTable.color1,
        title: Text(
          widget.data.detailUrl,
          style: TextStyle(
            fontSize: 12
          ),
        ),
      ),
      body: SafeArea(
        child: WebView(
          initialUrl: widget.department.url+widget.data.detailUrl,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:medeniyet_duyuru/app/Constants.dart';
import 'package:medeniyet_duyuru/app/department_list.dart';
import 'package:medeniyet_duyuru/model/announcement_model.dart';
import 'package:medeniyet_duyuru/ui/web_view_page.dart';
class AllAnnouncementPage extends StatefulWidget {
  Department department;
  @override
  _AllAnnouncementPageState createState() => _AllAnnouncementPageState();

  AllAnnouncementPage(this.department);
}

class _AllAnnouncementPageState extends State<AllAnnouncementPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    htmlParse1();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      FutureBuilder(
        future: htmlParse1(),
        builder:(context,AsyncSnapshot<List<Announcement>> sn)  {
          if(sn.data != null){
            return ListView.builder(
              physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.all(8),
                itemCount: sn.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WebViewPage(sn.data[index],widget.department)),
                          );
                        },
                        child: Container(
                          height: Constants.setHeight(context, 100),
                          child: //Center(child: Text('${sn.data[0].day} ')),
                          Row(
                            children: [
                              Container(
                                height: Constants.setHeight(context, 70),
                                width:Constants.setHeight(context, 70) ,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      height: Constants.setHeight(context, 35),
                                      width:Constants.setHeight(context, 70) ,
                                      color: Colors.grey.withOpacity(0.5),
                                      alignment: Alignment.center,
                                      child: Text(
                                        sn.data[index].day,
                                        style: TextStyle(
                                          fontSize: Constants.setHeight(context, 15),
                                          fontWeight: FontWeight.w900
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: Constants.setHeight(context, 35),
                                      width:Constants.setHeight(context, 70) ,
                                      alignment: Alignment.center,
                                      child: Text(
                                        sn.data[index].date,
                                        style: TextStyle(
                                            fontSize: Constants.setHeight(context, 12),
                                            fontWeight: FontWeight.w700
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: Constants.setWidth(context, 10)),
                                height: Constants.setHeight(context, 70),
                                width: Constants.setWidth(context, 300),
                                child: Text(
                                  sn.data[index].text
                                ),
                              )
                            ],
                          )
                        ),
                      ),
                      Divider()
                    ],
                  );

                }

            );
          }
          else
            return Center(child: CircularProgressIndicator());

        }
      ),
    );
  }
  Future< List<Announcement>> htmlParse() async{
    List<Announcement> announcement = [];
    final response =
    await http.Client().get(Uri.parse('https://muhendislikdogabilimleri.medeniyet.edu.tr/tr/duyurular'));
    //await http.Client().get(Uri.parse('https://medeniyet.edu.tr/tr/duyurular'));
    if(response.statusCode == 200){
      var document = parse(response.body);
      int i =0;
      var elements = document.getElementsByClassName("media lm-b1");
      var satring = elements[i].children[0].children[0].children[0].children[1].text;
      while( i<elements.length) {
        announcement.add(Announcement(
          id: i,
          day: elements[i].children[0].children[0].children[0].children[0].text,
          date: elements[i].children[0].children[0].children[0].children[1].text,
         text: elements[i].children[1].children[0].children[0].children[0].text,
        ),);
        i++;
      }
    }
    else{
      return null;
    }
    return announcement;
  }
  Future< List<Announcement>> htmlParse1() async{
    List<Announcement> announcement = [];
    final response =
    //await http.Client().get(Uri.parse('https://bm.medeniyet.edu.tr/tr'));

    //await http.Client().get(Uri.parse('https://muhendislikdogabilimleri.medeniyet.edu.tr/tr/duyurular'));
    await http.Client().get(Uri.parse(widget.department.url));
    if(response.statusCode == 200){
      var document = parse(response.body);
      int i =0;
      var elements = document.getElementsByClassName("slider-container")[widget.department.loc].getElementsByClassName("media");

      var satring = elements[i].getElementsByClassName("date")[0].getElementsByClassName("day")[0].text;
      var satring1 = elements[i].getElementsByClassName("date")[0].getElementsByClassName("month")[0].text;
      var satring2 = elements[i].nodes[3].nodes[1].attributes.values.first;
      while( i<elements.length) {
        announcement.add(Announcement(
          id: i,
          day: elements[i].getElementsByClassName("date")[0].getElementsByClassName("day")[0].text,
          date: elements[i].getElementsByClassName("date")[0].getElementsByClassName("month")[0].text,
          text: elements[i].getElementsByClassName("media-body")[0].getElementsByTagName('p').first.text,
          detailUrl: elements[i].nodes[3].nodes[1].attributes.values.first,
        ),);
        i++;
      }
    }
    else{
      return null;
    }
    return announcement;
  }
}

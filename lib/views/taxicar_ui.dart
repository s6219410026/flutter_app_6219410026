import 'package:flutter/material.dart';
import 'package:flutter_app_6219410026/views/show_taxicar_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaxicarUI extends StatefulWidget {
  const TaxicarUI({Key? key}) : super(key: key);

  @override
  State<TaxicarUI> createState() => _TaxicarUIState();
}

class _TaxicarUIState extends State<TaxicarUI> {
  TextEditingController distance_ctrl = TextEditingController();
  TextEditingController time_ctrl = TextEditingController();

  showWarningDialog(context, msg) {
    //เรียกใช้งานฟังก์ชัน showDialog
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.deepPurple,
            padding: EdgeInsets.only(
              top: 10.0,
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text(
          'Taxi App',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Text(
                'TAXI',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Image.asset(
                'assets/images/taxi-logo-template_1057-4907.webp',
                height: 150.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 30.0,
                ),
                child: TextField(
                  controller: distance_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'ระยะทาง(กิโลเมตร)',
                    labelStyle: TextStyle(
                      color: Colors.blue[700],
                      fontFamily: 'Kanit',
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(
                          10.0,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(
                          10.0,
                        )),
                    filled: true,
                    fillColor: Colors.blue[50],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                  top: 20.0,
                ),
                child: TextField(
                   controller: time_ctrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'เวลารถติด(นาที)',
                    labelStyle: TextStyle(
                      color: Colors.blue[700],
                      fontFamily: 'Kanit',
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(
                          10.0,
                        )),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.0,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(
                          10.0,
                        )),
                    filled: true,
                    fillColor: Colors.blue[50],
                  ),
                ),
              ),
              SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    double? money;
                    double? money_cal;
                    if (distance_ctrl.text.isEmpty) {
                      showWarningDialog(context, 'ป้อนระยะทางด้วยครับ');
                      return;
                    } else if (time_ctrl.text.isEmpty) {
                      showWarningDialog(context, 'ป้อนเวลารถติดด้วยครับ');
                      return;
                    } else {
                      double? distance = double.parse(distance_ctrl.text);
                      if (distance <= 1) {
                        money = 35;
                      } else if (distance >= 2 && distance <= 10) {
                        money = (35 + (distance - 1) * 5.5);
                      } else if (distance >= 11 && distance <= 20) {
                        money = (84.5 + (distance - 10) * 6.5);
                      } else if (distance >= 21 && distance <= 40) {
                        money = (149.5 + (distance - 20) * 7.5);
                      } else if (distance >= 41 && distance <= 60) {
                        money = (299.5 + (distance - 40) * 8.0);
                      } else if (distance >= 61 && distance <= 80) {
                        money = (459.5 + (distance - 60) * 9.0);
                      } else {
                        money = (639.5 + (distance - 80) * 10.5);
                      }
                      if (time_ctrl.text.isEmpty) {
                        money_cal = money;
                      } else
                        money_cal = money + (int.parse(time_ctrl.text) * 2);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowtaxicarUI(
                          money_cal: money_cal,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'คำนวณ',
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 80.0,
                      50.0,
                    ),
                    primary: Colors.green,
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40.0,
                  right: 40.0,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      distance_ctrl.text = '';
                      time_ctrl.text = '';
                    });
                  },
                  child: Text(
                    'ยกเลิก',
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      MediaQuery.of(context).size.width - 80.0,
                      50.0,
                    ),
                    primary: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

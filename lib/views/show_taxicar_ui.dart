import 'package:flutter/material.dart';

class ShowtaxicarUI extends StatefulWidget {
   double? money_cal;

   ShowtaxicarUI({ 
     Key? key, 
     this.money_cal,

    }) : super(key: key);

  @override
  State<ShowtaxicarUI> createState() => _ShowtaxicarUIState();
}

class _ShowtaxicarUIState extends State<ShowtaxicarUI> {
  String money = '0.00';
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
                height: 170.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'จ่ายค่าแท็กซี่เป็นจำนวนเงิน',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
               Text(
                  widget.money_cal.toString(),
                  style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
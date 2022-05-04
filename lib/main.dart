import 'package:flutter/material.dart';
import 'package:flutter_app_6219410026/views/taxicar_ui.dart';

main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TaxicarUI(),
      theme: ThemeData(
        fontFamily: 'Kanit',
      ),
    ),
  );
}

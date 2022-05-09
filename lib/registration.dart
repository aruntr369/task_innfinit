import 'dart:io';

import 'package:flutter/material.dart';
import 'package:task_innfinit/login.dart';
import 'package:http/http.dart' as http;
import 'package:task_innfinit/model/registerRespModel.dart';

class ScreenRegistration extends StatefulWidget {
  ScreenRegistration({Key? key}) : super(key: key);

  @override
  State<ScreenRegistration> createState() => _ScreenRegistrationState();
}

Future<Welcome?> submitResp(
    String phno, String name, String email, String otp) async {
  var respones = await http.post(
      Uri.http('foodmallapifortesting.pulseerp.co.in', 'api/Registration'),
      body: {
        "cRegPhone": phno,
        "cRegName": name,
        "cRegEmail": email,
        "cOTP": otp
      });
  var data = respones.body;
  print(data);

  if (respones.statusCode == 201) {
    String responseString = respones.body;
    welcomeFromJson(responseString);
  } else
    return null;
}

class _ScreenRegistrationState extends State<ScreenRegistration> {
  late Welcome _welcome;

  final _phnoControler = TextEditingController();

  final _firstNAmeControler = TextEditingController();

  final _lastNameControler = TextEditingController();

  final _emailControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextFormField(
                controller: _phnoControler,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'phone number'),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextFormField(
                    controller: _firstNAmeControler,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'first name')),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _lastNameControler,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'last name'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _emailControler,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'emailId'),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton.icon(
                onPressed: () async {

                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => ScreenLogin()));

                      
                  String name = _firstNAmeControler.text;
                  String email = _emailControler.text;
                  String phno = _phnoControler.text;
      
                  Welcome? welcome = await submitResp(phno, name, email, '1111');
                  setState(() {
                    _welcome = welcome!;
                  });
      
                
                },
                icon: const Icon(Icons.check),
                label: const Text('Login'),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

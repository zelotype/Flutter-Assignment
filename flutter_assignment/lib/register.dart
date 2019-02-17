library flutter_assignment.register;

import 'package:flutter/material.dart';
import 'homepage.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.black, accentColor: Colors.yellow[300]),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Register'),
            backgroundColor: Color.fromRGBO(255, 140, 146, 1.0),
          ),
          body: Container(
            color: Colors.white30,
            child: (RegisterForm()),
          ),
        ));
  }
}

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    // TODO: implement createState
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _regisKey = GlobalKey<FormState>();

  String email;
  String password_1;
  String password_2;

  @override
  Widget build(BuildContext context) {
    Widget emailFieldForm = Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 5, top: 10),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
            email = value;
          },
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.email), hintText: 'Kawi@gmail.com')),
    );
    Widget passwordRegisForm = Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 5),
      child: TextFormField(
        obscureText: true,
        validator: (value) {
          password_1 = value;
        },
        decoration:
            InputDecoration(prefixIcon: Icon(Icons.lock), hintText: 'password'),
      ),
    );
    Widget rePasswordRegisForm = Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 5),
      child: TextFormField(
        obscureText: true,
        validator: (value) {
          password_2 = value;
        },
        decoration:
        InputDecoration(prefixIcon: Icon(Icons.lock), hintText: 'password'),
      ),
    );
    Widget registerButton = Container(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: 350,
        height: 50,
        child: RaisedButton(
          child: const Text('Continue'),
          color: Theme.of(context).accentColor,
          elevation: 4.0,
          splashColor: Colors.blueGrey,
          onPressed: () {
            if (_regisKey.currentState.validate()) {
              if(email.isEmpty || password_1.isEmpty || password_2.isEmpty){
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('กรุณาาระบุข้อมูลให้ครบถ้วน')));
              }
              else if(email == 'admin'){
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('user นี้มีอยู่ในระบบแล้ว')));
              }
              else if(password_1 != password_2){
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('password ไม่เหมือนกัน')));
              }
              else{
                print('Register Succeed');
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Main()));
              }
            }
          },
        ),
      ),
    );
    return Form(
      key: _regisKey,
      child: Column(
        children: <Widget>[
          emailFieldForm,
          passwordRegisForm,
          rePasswordRegisForm,
          registerButton,
        ],
      ),
    );
  }
}

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
  final _RegisKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Widget emailFieldForm = Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 5, top: 10),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.email), hintText: 'Kawi@gmail.com')),
    );
    Widget passwordRegisForm = Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 5),
      child: TextFormField(
        obscureText: true,
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
            if (_RegisKey.currentState.validate()) {
              print('Register Succeed');
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Main()));
            }
          },
        ),
      ),
    );
    return Form(
      key: _RegisKey,
      child: Column(
        children: <Widget>[
          emailFieldForm,
          passwordRegisForm,
          passwordRegisForm,
          registerButton,
        ],
      ),
    );
  }
}

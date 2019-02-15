import 'package:flutter/material.dart';

void main(){
  runApp(LoginMain());
}
class LoginMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50),
              child:
                Image.asset(
                  'images/login.jpg',
                  width: 400,
                  height: 240,
            ),
            ),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget{
  @override
  LoginFormState createState() {
    // TODO: implement createState
    return LoginFormState();
  }

}

class LoginFormState extends State<LoginForm>{
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Widget usernameField = Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 5, top: 10),
      child: TextFormField(
        validator: (value){
          if(value.isEmpty){
            return 'Please enter user id';
          }
          else{
            if(value == 'admin' || value == 'Admin'){
              return 'Incorrect user id';
            }
          }
        },
        keyboardType: TextInputType.emailAddress,
        onSaved: (value) {

        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.account_circle),
          labelText: 'User id',
          hintText: 'kawii@gmail.com',
        ),
      ),
    );
    Widget passwordField = Container(
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: TextFormField(
        validator: (value){
          if(value.isEmpty){
            return 'Please enter password';
          }
          else{
            if(value == 'admin' || value == 'Admin'){
              return 'Incorrect password';
            }
          }
        },
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            labelText: 'Password'
        ),
      ),
    );
    Widget loginButton = Container(
        child: RaisedButton(
          child: const Text('Login'),
          color: Theme.of(context).accentColor,
          elevation: 4.0,
          splashColor: Colors.blueGrey,
          onPressed: () {
            if (_formKey.currentState.validate()){
              print('Login Succeed');
//              Navigator.push(context,
//              MaterialPageRoute(builder: (context) => MainPage())
//              );
            }
          },
        )
    );
    Widget registerButton = Container(
        child: FlatButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
              },
          child: Text('Register New Account'),
        )
    );
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          usernameField,
          passwordField,
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: loginButton,
          ),
          Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  registerButton
                ],
              )
          ),
        ],
      ),
    );
  }
}

class Register extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
//      body: ,
    );
  }

}
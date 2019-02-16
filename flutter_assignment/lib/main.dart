import 'package:flutter/material.dart';

void main(){
  runApp(LoginMain());
}
class LoginMain extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pink[200],
        accentColor: Colors.yellow[300],
      ),
      home: Scaffold(
        backgroundColor: Colors.pink[200],
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50),
              child:
                Image.asset(
                  'images/login.png',
                  width: 400,
                  height: 300,
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
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 5),
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
          prefixIcon: Icon(Icons.person),
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
        child:SizedBox(
            width: 350,
            height: 50,
            child: RaisedButton(
              child: const Text('Login'),
              color: Theme.of(context).accentColor,
              elevation: 4.0,
              splashColor: Colors.blueGrey,
              onPressed: () {
                if (_formKey.currentState.validate()){
                  print('Login Succeed');
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => Main())
              );
                }
              },
            ),
        ),
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
      body: Column(
        children: <Widget>[
          RegisterForm()
        ],
      ),
    );
  }
}

class RegisterForm extends StatefulWidget{
  @override
  RegisterFormState createState() {
    // TODO: implement createState
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm>{
  final _RegisKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Widget emailFieldForm = Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 5, top: 10),
      child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              hintText: 'Kawi@gmail.com'
          )
      ),
    );
    Widget passwordRegisForm = Container(
      padding: const EdgeInsets.only(left: 32, right: 32, bottom: 5),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            hintText: 'password'
        ),
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
            if (_RegisKey.currentState.validate()){
              print('Register Succeed');
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => Main())
              );
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

class Main extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: DefaultTabController(
      length: 5,
      child: MaterialApp(
      home: Scaffold(
        appBar:
          AppBar(
            title: Center(child: Text('Home')),
            backgroundColor: Colors.pink[200],
          ),
        body: TabBarView(
            children: [
              Container(
                  child:Center(
                    child: Text('Home'),
                  )
              ),
              Container(
                  child:Center(
                    child: Text('Notify'),
                  )
              ),
              Container(
                  child:Center(
                    child: Text('Map'),
                  )
              ),
              Container(
                  child:Center(
                    child: Text('Profile'),
                  )
              ),
              Container(
                  child:Center(
                    child: Text('Setup'),
                  )
              ),
            ]),
        bottomNavigationBar: TabBar(tabs: [
          Tab(
            icon: Icon(Icons.home),
          ),
          Tab(
            icon: Icon(Icons.notifications),
          ),
          Tab(
            icon: Icon(Icons.map),
          ),
          Tab(
            icon: Icon(Icons.person),
          ),
          Tab(
            icon: Icon(Icons.settings),
          ),
        ],
          labelColor: Colors.yellow,
          unselectedLabelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.red),
//        backgroundColor: Colors.pink[200],
      ),
    ),
    ),
    );
  }

}

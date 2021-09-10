import 'package:cook_now/services/authService.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {

  final Function? swapView;
  Register({this.swapView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  // text fields for the username/email and password
  String email = "";
  String password = "";
  // String to store error message
  String error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Register for CookNow'),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 5, 10),
            child: TextButton.icon(
                icon: Icon(
                  Icons.person,
                  color: Colors.blue[900],
                ),
                label: Text(
                  'Sign In',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]
                  ),
                ),
                onPressed: () async {
                  widget.swapView!();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                )
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,

          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                validator: (val) => val!.isEmpty ? 'Please enter your email' : null,
                onChanged: (val) {
                  setState(() => email = val);
                },
              ),
              SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
                validator: (val) => val!.length < 8 ? 'Password must be at least 8 characters' : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() => password = val);
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    dynamic loginResult = await _auth.registerWithEmailPassword(email, password);
                    if(loginResult == null){
                      setState(() => error = 'please supply a valid email');
                    }
                  }
                },
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                ),
              ),
              SizedBox(height: 12),
              Text(
                error,
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

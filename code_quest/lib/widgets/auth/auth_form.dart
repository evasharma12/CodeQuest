import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthForm extends StatefulWidget {
  AuthForm(this.submitFn, this.isLoading);

  final void Function(
    String email,
    String username,
    String password,
    bool isLogin,
  ) submitFn;

  final bool isLoading;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;

  String _userEmail = '';
  String _userName = '';
  String _userPassword = '';

  void _trySubmit() async {
    final isValid = await _formKey.currentState.validate();
    FocusScope.of(context)
        .unfocus(); //will close the keyboard after submission.
    //i.e. it will remove the focus from textformfield to nothing.

    if (isValid) {
      _formKey.currentState.save();
      widget.submitFn(
        _userEmail.trim(),
        _userName.trim(),
        _userPassword.trim(),
        _isLogin,
      );
      // StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //      Navigator.pushNamed(context, '/home');
      //     }
      //   }
      // );

      //Use those values to send the auth request ...
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        shadowColor: Colors.tealAccent,
        elevation: 5,
        margin: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextFormField(
                    key: ValueKey('email'),
                    validator: (value) {
                      if (value.isEmpty ||
                          !value.contains('@') ||
                          !value.contains('.com')) {
                        return 'Please enter a valid email address';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Title',
                      ),
                      labelText: 'Email address',
                    ),
                    onSaved: (value) {
                      _userEmail = value;
                    },
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: ValueKey('username'),
                      validator: (value) {
                        if (value.isEmpty || value.length < 4) {
                          return 'User name should be atleast 4 characters long';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Title',
                        ),
                        labelText: 'User Name',
                      ),
                      onSaved: (value) {
                        _userName = value;
                      },
                    ),
                  TextFormField(
                    key: ValueKey('password'),
                    validator: (value) {
                      if (value.isEmpty || value.length < 7) {
                        return 'Password must be atlest 7 characters long';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Title',
                      ),
                      labelText: 'Password',
                    ),
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value;
                    },
                  ),
                  SizedBox(height: 12),
                  // if (widget.isLoading)CircularProgressIndicator(),
                  // if (!widget.isLoading)
                  RaisedButton(
                      color: Colors.tealAccent,
                      child: Text(
                        _isLogin ? 'Log In' : 'SignUp',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Title',
                          color: Colors.grey[900],
                        ),
                      ),
                      onPressed: _trySubmit),
                  // if (!widget.isLoading)
                  FlatButton(
                    textColor: Colors.black,
                    child: Text(
                      _isLogin
                          ? 'Create new account'
                          : 'I already have an account',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Title',
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

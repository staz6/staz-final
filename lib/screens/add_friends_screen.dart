import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/repository.dart';
import '../bloc/friend_add_edit_bloc.dart';
import '../helper/constraint.dart';

class AddFriendsScreen extends StatefulWidget {
  @override
  _AddFriendsScreenState createState() => _AddFriendsScreenState();
}

class _AddFriendsScreenState extends State<AddFriendsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FriendBloc(repository: Repository()),
        child: Builder(
          builder: (context) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 35),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        suffixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                      validator: (value) {
                        if (value!.isValidName()) {
                          return null;
                        } else {
                          return 'Please enter a valid name';
                        }
                      },
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        suffixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                      validator: (value) {
                        if (value!.isValidEmail()) {
                          return null;
                        } else {
                          return 'Please enter a valid email';
                        }
                      },
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      controller: _mobileNoController,
                      decoration: InputDecoration(
                        hintText: 'Mobile no',
                        suffixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(2.0),
                        ),
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                      validator: (value) {
                        if (value!.isValidPhone()) {
                          return null;
                        } else {
                          return 'Please enter a valid mobile number';
                        }
                      },
                    ),
                    Expanded(child: Container()),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            BlocProvider.of<FriendBloc>(context).add(
                              FriendAdded(
                                name: _nameController.text,
                                email: _emailController.text,
                                mobileNo: _mobileNoController.text,
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16.0),
                        ),
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  Map<String, dynamic>? userDetail = {};

  AddUser({super.key, this.userDetail});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.userDetail != null) {
      _userNameController.text = widget.userDetail!['UserName'];
      _cityController.text = widget.userDetail!['City'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _userNameController,
                decoration: const InputDecoration(
                  // hintText: "Enter Name",
                  labelText: "Enter Name",
                  labelStyle: TextStyle(fontSize: 20),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter UserName';
                  }
                  return null;
                },
                autofocus: true,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _cityController,
                decoration: const InputDecoration(
                  // hintText: "Enter City",
                  labelText: "Enter City",
                  labelStyle: TextStyle(fontSize: 20),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter City';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.green),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Map<String, dynamic> map = Map();
                        map['UserName'] = _userNameController.text.toString();
                        map['City'] = _cityController.text.toString();
                        Navigator.of(context).pop(map);
                      }
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

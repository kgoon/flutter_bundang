import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/business_logic/api_provider.dart';
import 'package:flutter_bundang/src/widgets/custom_button_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_form_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_text_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class MakeProfilePage extends StatefulWidget {
  @override
  _MakeProfilePageState createState() => _MakeProfilePageState();
}

class _MakeProfilePageState extends State<MakeProfilePage>
    with CustomFormFieldWidget {
  final TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  File _image;
  String _name;
  String _path;
  RegExp re = new RegExp(r'^[a-zA-Z0-9_.\-]+$');

  Future getImage() async {
    try {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
      String path = image.path;
      setState(() {
        _image = image;
        _path = path;
      });
    } catch (e) {
      e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final apiBloc = Provider.of<ApiProvider>(context).bloc;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                HeadingOneText(
                  title: 'Complete your profile',
                ),
                Text('Almost done! Just complete your profile'),
                SizedBox(
                  height: 40.0,
                ),
                Stack(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 70.0,
                      backgroundColor: Colors.grey.withOpacity(0.4),
                      backgroundImage:
                          _image == null ? null : FileImage(_image),
                      child: _image == null
                          ? Icon(
                              Icons.person_outline,
                              size: 70.0,
                              color: Colors.black54,
                            )
                          : null,
                    ),
                    Positioned(
                      top: 90,
                      left: 90,
                      child: FloatingActionButton(
                        onPressed: getImage,
                        mini: true,
                        child: Icon(
                          Icons.photo_camera,
                          size: 23.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0,
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        autovalidate: true,
                        controller: nameController,
                        autocorrect: false,
                        decoration: InputDecoration(
                          hintText: 'Username',
                        ),
                        onChanged: (String value) => _name = value,
                        validator: (String value) {
                          if (value.isEmpty) {
                            return '이름을 입력해 주세요';
                          } else if (!re.hasMatch(value)) {
                            return '알파벳, 숫자, (\'_\', \'-\', \'.\')만 가능합니다';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                CustomRaisedButton(
                  title: 'GET STARTED',
                  backgroundColor: Colors.teal,
                  onSubmit: () async {
                    if (_formkey.currentState.validate()) {
                      bool databaseResult =
                          await apiBloc.checkUserName(name: _name);
                      if (databaseResult) {
                        bool databaseImgResult = await apiBloc.setProfileImage(
                            filePath: _path, image: _image);
                        if (databaseImgResult) {
                          bool databaseResult =
                              await apiBloc.setUserName(name: _name);
                          print(databaseResult);
                        } else {}
                      } else {}
                    } else {}
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }
}

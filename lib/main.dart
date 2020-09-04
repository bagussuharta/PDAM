import 'package:coba/Shared/colors.dart';
import 'package:coba/font_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'font_style.dart';
import 'taskModel.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller = TextEditingController(text: "Nama");
  TextEditingController noHp = TextEditingController(text: "Nomor HP");
  TextEditingController alamat = TextEditingController(text: "Alamat");
  final textController = TextEditingController();

  List<TaskModel> tasks = [];

  TaskModel currenTask;

  final TodoHelper _todoHelper = TodoHelper();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PDAM GIRI MENANG',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: Text("PDAM GIRI MENANG"),
              backgroundColor: primaryColor,
              actions: [
                IconButton(icon: Icon(Icons.add_alert), onPressed: () {})
              ],
            ),
            body: Container(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    left: 0.0, top: 30.0, right: 0.0, bottom: 0.0),
                child: Column(
                  verticalDirection: VerticalDirection.down,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Image(
                      image: AssetImage("assets/images/favicon.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20.0,
                      ),
                      child: Text(
                        "Mengalir Bersama",
                        style: header,
                      ),
                    ),
                    Text(
                      "Siap Memberikan Pelayanan  Terbaik",
                      style: sub,
                    ),
                    Padding(
                        padding: EdgeInsets.only(
                      top: 20.0,
                    )),
                    TextField(
                      controller: textController,
                      decoration: InputDecoration(
                          labelText: "Nama Lengkap",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      maxLength: 40,
                    ),
                    TextField(
                      controller: noHp,
                      decoration: InputDecoration(
                          labelText: "Nomor HP",
                          prefixIcon: Icon(Icons.add_call),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      maxLength: 12,
                    ),
                    TextField(
                      controller: alamat,
                      decoration: InputDecoration(
                          labelText: "Alamat Lengkap",
                          prefixIcon: Icon(Icons.location_searching),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      maxLines: 2,
                    ),
                    Padding(padding: EdgeInsets.only(top: 15)),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        prefixIcon: Icon(Icons.check),
                      ),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Masukan Password';
                        }
                        return null;
                      },
                    ),
                    RaisedButton(
                        color: Colors.blue,
                        elevation: 6.0,
                        child: Text(
                          "Simpan",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          currenTask = TaskModel(nama: textController.text);
                          _todoHelper.insertTask(currenTask);
                          Navigator.pushNamed(context, "/MyHomeApp");
                        }),
                    FlatButton(
                        onPressed: () async {
                          List<TaskModel> list = await _todoHelper.getAllTask();
                          setState(() {
                            tasks = list;
                          });
                        },
                        child: Text("Tampilkan")),
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Text("${tasks[index].id}"),
                                title: Text("${tasks[index].nama}"),
                              );
                            },
                            separatorBuilder: (context, index) => Divider(),
                            itemCount: tasks.length))
                  ],
                ),
              ),
            ))
        //  ListView.builder(
        //   itemBuilder: (context, index) {
        //     return Padding(
        //       padding: const EdgeInsets.all(8.0),
        //     );
        //   },
        //   itemCount: 100,
        );
  }
}

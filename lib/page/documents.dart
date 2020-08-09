import 'package:app_flutter/model/files.dart';
import 'package:app_flutter/providers/files_provider.dart';
import 'package:app_flutter/widgets/drawer_lateral.dart';
import 'package:app_flutter/widgets/widget_common.dart';
import 'package:flutter/material.dart';

class Documents extends StatefulWidget {
  @override
  _DocumentsState createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  final drawer = DrawerLateral();

  FilesProvider file = new FilesProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarCommon(),
        body: _cardFiles(),
        drawer: drawer.drawerIzquierda(context),
        endDrawer: drawerDerecha(context));
  }

  Widget _cardFiles() {
    return FutureBuilder(
      future: file.getFile(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return _cardFile(snapshot.data, snapshot.data.length);
        } else {
          return Container(
              height: 400.0,
              child: Center(
                  child: Image(image: AssetImage('assets/searchLoading.gif'))));
        }
      },
    );
  }

  Widget _cardFile(List<File> file, int largo) {
    return ListView.builder(
        itemCount: file.length,
        itemBuilder: (context, i) {
          return Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    spreadRadius: 3,
                    blurRadius: 1,
                    offset: Offset(5, 8), // changes position of shadow
                  ),
                ],
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15.0)),
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                FadeInImage(
                    fit: BoxFit.fill,
                    placeholder: AssetImage('assets/30.gif'),
                    image: NetworkImage(
                        'https://biblioteca-web-ucen.herokuapp.com/assets/IconoPdf.png')),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          file[i].name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          file[i].descripcion,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black, fontSize: 15.0),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  /*Widget textoPassword() {
    return TextField(
      obscureText: candado,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            splashColor: Colors.transparent,
            icon: iconCandado,
            color: Colors.blue[700],
            onPressed: () {
              setState(() {
                if (candado) {
                  candado = false;
                  iconCandado = Icon(Icons.lock_open);
                } else {
                  candado = true;
                  iconCandado = Icon(Icons.lock);
                }
              });
            },
          ),
          fillColor: Colors.black,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.yellow[700],
              ),
              borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Password',
          labelStyle: TextStyle(color: Colors.black)),
    );
  }*/
}

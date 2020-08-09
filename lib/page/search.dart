import 'package:app_flutter/model/files.dart';
import 'package:app_flutter/providers/files_provider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Search extends StatelessWidget {
  String palabraClave;
  final archivos = FilesProvider();
  @override
  Widget build(BuildContext context) {
    palabraClave = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.yellowAccent[700],
        title: Text(
          'Resultados encontrados de "$palabraClave"',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: procesarFuture(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellowAccent[700],
          child: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  Widget procesarFuture() {
    return FutureBuilder(
      future: archivos.getFile(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return cards(snapshot.data);
        }
        return Container(
            height: 400.0,
            child: Center(
                child: Image(image: AssetImage('assets/searchLoading.gif'))));
      },
    );
  }

  Widget cards(List<File> f) {
    f.removeWhere((element) =>
        element.name.toLowerCase().indexOf(palabraClave.toLowerCase()) < 1
            ? true
            : false);
    return ListView.builder(
      itemCount: f.length,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(10.0),
          child: Card(
              child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                child: FadeInImage(
                    width: 90,
                    height: 100,
                    fit: BoxFit.fill,
                    placeholder: AssetImage('assets/infinity.gif'),
                    image: NetworkImage(
                        'https://biblioteca-web-ucen.herokuapp.com/assets/IconoPdf.png')),
              ),
              Expanded(
                child: Text(
                  f[index].name,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )),
        );
      },
    );
  }
}

import 'dart:ui';

import 'package:app_flutter/widgets/app_bars_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool candado = true;
  Icon iconCandado = Icon(Icons.lock);
  final imagesUlr = [
    'https://www.ucentral.cl/ucentral/site/artic/20191216/imag/foto_0000000220191216180600/Sin_titulo-77.jpg',
    'https://www.ucentral.cl/ucentral/site/artic/20130620/imag/foto_0000000320130620110805.jpg',
    'https://www.cooperativa.cl/noticias/site/artic/20190122/imag/foto_0000000120190122114202.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarCommon(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _swiperImage(),
              SizedBox(
                height: 30,
              ),
              _buscadorDocument(),
              RaisedButton(
                  color: Colors.yellowAccent[700],
                  child: Text('Busca!'),
                  onPressed: () {}),
            ],
          ),
        ),
        drawer: _drawerIzquierda(),
        endDrawer: _drawerDerecha());
  }

  Widget _swiperImage() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  imagesUlr[index],
                  fit: BoxFit.fill,
                ));
          },
          itemCount: 3,
          viewportFraction: 0.8,
          scale: 0.9,
        ));
  }

  Widget _buscadorDocument() {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'BUSCADOR',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30.0),
              )),
          SizedBox(
            height: 50,
          ),
          TextField(
            decoration: InputDecoration(
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
                labelText: 'Que Buscas?',
                labelStyle: TextStyle(color: Colors.black)),
          )
        ],
      ),
    );
  }

  Widget _drawerDerecha() {
    return Drawer(
        child: ListView(
      children: <Widget>[
        DrawerHeader(
            child: Image.network(
                'https://biblioteca-web-ucen.herokuapp.com/assets/iconoIcci.png')),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: EdgeInsets.only(top: 20.0),
                child: ListTile(
                  leading: Icon(Icons.assignment),
                  title: Text(
                    'Documentos',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onTap: () {},
                )),
            Container(
                padding: EdgeInsets.only(top: 20.0),
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: Text(
                    'Buscador',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  onTap: () {},
                )),
          ],
        )
      ],
    ));
  }

  Widget _drawerIzquierda() {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.yellowAccent[700]),
            child: DrawerHeader(
              child: Column(
                children: <Widget>[
                  Text(
                    'INICIAR\nSESION',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35.0),
                  ),
                  Icon(
                    Icons.account_circle,
                    size: 50.0,
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(signed: true),
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.supervisor_account,
                    color: Colors.blue[700],
                  ),
                  helperText: 'Ejemplo: 12345678-9',
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
                  labelText: 'RUT',
                  labelStyle: TextStyle(color: Colors.black)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
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
            ),
          ),
        ],
      ),
    );
  }
}

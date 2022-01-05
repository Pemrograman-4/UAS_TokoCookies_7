import 'dart:async';
import 'dart:convert';

import 'package:zahira_cantika_c_19411005/const/collor.dart';
import 'package:zahira_cantika_c_19411005/server/server.dart';
import 'package:zahira_cantika_c_19411005/ui/view_produk.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class detail_produk_view extends StatefulWidget {
  final String id;
  final String nama;
  final String expired;
  final String deskrispi;
  final String harga;

  const detail_produk_view(
      {Key? key,
        required this.id,
        required this.harga,
        required this.deskrispi,
        required this.nama,
        required this.expired})
      : super(key: key);
  // print(size);

  @override
  _detail_produk_viewState createState() => _detail_produk_viewState();
}

class _detail_produk_viewState extends State<detail_produk_view> {
  TextEditingController nama_cookies = new TextEditingController();
  TextEditingController tanggal_kadaluarsa = new TextEditingController();
  TextEditingController deskrispi_produk = new TextEditingController();
  TextEditingController harga_produk = new TextEditingController();
  final _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 15),
              child: Center(
                child: Container(
                    width: 150,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('assets/iconcookies.png')),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: Center(
                child: Text(
                  'Detail Produk',
                  style: (TextStyle(
                      color: Colors.blue, fontSize: 25, fontFamily: 'Raleway')),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: nama_cookies,
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    labelText: 'Nama Cookies',
                    hintText: 'Masukan Nama Produk Cookis'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: tanggal_kadaluarsa,
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    labelText: 'Tanggal Kadaluarsa',
                    hintText: 'Masukan Tanggal Kadaluarsa Cookies'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: deskrispi_produk,
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    labelText: 'Deskripsi Cookies',
                    hintText: 'Deskripsi Produk Cookies'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: harga_produk,
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    labelText: 'Harga Cookies',
                    hintText: 'Masukan Harga Cookies'),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    updatedata(context);
                  },
                  child: const Text(
                    'Update Produk',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                margin: const EdgeInsets.all(10),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    deletedata(context);
                  },
                  child: const Text(
                    'Delete Produk',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ),
            // Text('Belum Punya Akun? Daftar')
          ],
        ),
      ),
    );
  }

  //fungsi set data kedalam value dari data produk yang di simpan di SharedPreferences
  void setdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    harga_produk.text = prefs.getString('harga').toString();
    deskrispi_produk.text = prefs.getString('deskripsi').toString();
    nama_cookies.text = prefs.getString('nama').toString();
    tanggal_kadaluarsa.text = prefs.getString('expired').toString();
  }

  //fungsi delete data
  void deletedata(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('_id').toString();
    var url = UrlServer + "produk/delete/" + id;
    final response = await http.delete(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var result = convert.jsonDecode(response.body);
    print(result);
    String Message = result['message'];
    if (result['status']) {
      // Navigator.of(context, rootNavigator: true).pop();
      showSnakbar(context, Message, SuccesColor);
      var _duration = const Duration(seconds: 1);
      Timer(_duration, () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => ProdukView()));
      });
    } else {
      showSnakbar(context, Message, ErrorColor);
      print(Message);
    }
  }

  // fungsi edit data
  void updatedata(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('_id').toString();
    String harga = harga_produk.text;
    String deskripsi = deskrispi_produk.text;
    String nama = nama_cookies.text;
    String expired = tanggal_kadaluarsa.text;
    var url = UrlServer + "produk/update/" + id;
    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      //disamakan sama field
      body: jsonEncode(<String, String>{
        "harga": harga,
        "deskripsi": deskripsi,
        "nama": nama,
        "expired": expired
      }),
    );
    var result = convert.jsonDecode(response.body);
    print(result);
    String Message = result['message'];
    if (result['status']) {
      // Navigator.of(context, rootNavigator: true).pop();
      showSnakbar(context, Message, SuccesColor);
      var _duration = const Duration(seconds: 1);
      Timer(_duration, () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => ProdukView()));
      });
    } else {
      showSnakbar(context, Message, ErrorColor);
      print(Message);
    }
  }

  //fungsi untuk menampilkan tanda
  void showSnakbar(BuildContext context, Message, color) {
    final snackBar = SnackBar(content: Text(Message), backgroundColor: color);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

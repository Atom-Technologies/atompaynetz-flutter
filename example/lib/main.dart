import 'package:flutter/material.dart';
import 'package:atompaynetz/atompaynetz.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() => runApp(
      MaterialApp(
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text('Atom Paynetz Sample App'),
      ),
      body: Center(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            RaisedButton(
                onPressed: () {
                  openPay(context);
                },
                child: Text('Open'))
          ])),
    ));
  }

  openPay(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MainApp()),
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  OpenPayment createState() => OpenPayment();
}

class OpenPayment extends State<MainApp> {
  final flutterWebViewPlugin = FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onUrlChanged.listen((String url) {
      print(url);

      if (url.contains('/response.php')) {
        var substringfromurl = url.substring(0, url.indexOf('?'));
        var urlarray = substringfromurl
            .split('&')
            .map((String text) => Text(text))
            .toList();
        print(urlarray);
        // var atompay = new AtomPaynetz(
        //     login: '192',
        //     pass: 'Test@123',
        //     prodid: 'NSE',
        //     amt: '100.00',
        //     date: '02/06/2020 16:50:00',
        //     txnid: '123',
        //     custacc: '0',
        //     udf1: 'Test Name',
        //     udf2: 'test@test.com',
        //     udf3: '9999999999',
        //     udf4: 'Mumbai',
        //     requesthashKey: 'KEY123657234',
        //     requestencryptionKey: '8E41C78439831010F81F61C344B7BFC7',
        //     requestsaltKey: '8E41C78439831010F81F61C344B7BFC7',
        //     responsehashKey: 'KEYRESP123657234',
        //     responseencypritonKey: '8E41C78439831010F81F61C344B7BFC7',
        //     responsesaltKey: '8E41C78439831010F81F61C344B7BFC7',
        //     mode: 'uat');
        // var validate =  atompay.validateSignature(
        //                     mmp_txn,
        //                     mer_txn,
        //                     f_code,
        //                     prod,
        //                     discriminator,
        //                     amt,
        //                     bank_txn,
        //                     signature
        //                   );

        flutterWebViewPlugin.close();
      }
    });
  }

  getUrl() {
    var atompay = new AtomPaynetz(
        login: '192',
        pass: 'Test@123',
        prodid: 'NSE',
        amt: '100.00',
        date: '02/06/2020 16:50:00',
        txnid: '123',
        custacc: '0',
        udf1: 'Test Name',
        udf2: 'test@test.com',
        udf3: '9999999999',
        udf4: 'Mumbai',
        requesthashKey: 'KEY123657234',
        requestencryptionKey: '8E41C78439831010F81F61C344B7BFC7',
        requestsaltKey: '8E41C78439831010F81F61C344B7BFC7',
        responsehashKey: 'KEYRESP123657234',
        responseencypritonKey: '8E41C78439831010F81F61C344B7BFC7',
        responsesaltKey: '8E41C78439831010F81F61C344B7BFC7',
        mode: 'uat'); // put mode: 'live' in production

    var urlToSend = atompay.getUrl();
    return urlToSend;
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {
        "/": (_) => new WebviewScaffold(
              url: getUrl(),
              appBar: new AppBar(
                title: new Text("Atom Payment Page"),
              ),
            ),
      },
    );
  }
}


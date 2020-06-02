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
                RaisedButton(onPressed: (){
                  openPay(context);
                }, child: Text('Open'))
              ])),
        )
      );
    }
    
    openPay(context){
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
      
      if (url.contains('/ResponseParam.jsp')) {
        String token = url;
          
        flutterWebViewPlugin.close();
        Navigator.of(context).pop(token);
      }
    });
  }

  getUrl (){
    var atompay = new AtomPaynetz( 
                login:'197',
                pass:'Test@123',
                prodid:'NSE',
                amt:'100.00',
                date:'02/06/2020 16:50:00',
                txnid:'123',
                custacc:'0',
                requesthashKey:'KEY123657234',
                responsehashKey:'KEYRESP123657234',
                mode:'uat'
              );
            
      var urlToSend =  atompay.getUrl();
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

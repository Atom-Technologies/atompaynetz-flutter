# Atom Paynetz for Flutter Integration

This is a helper class for Flutter Application to  generate atom paynetz payment URL.

## Getting Started

Download the package from pub.dev, 

Add this to `dependencies` in your app's `pubspec.yml`

```yaml
atompaynetz: ^0.0.5
```
## Usage

Sample code to integrate can be found in [example/lib/main.dart](example/lib/main.dart).

#### Import package 

```dart
import 'package:atompaynetz/atompaynetz.dart';
```

#### Create AtomPaynetz instance

Create the instance and pass the mandatory parameters.

```dart
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
```

It will return the URL and you can open the URL in WebView using:

```
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

```

Getting Response From Webview

```
 @override
  void initState() {
    super.initState();
    flutterWebViewPlugin.onUrlChanged.listen((String url) {
     
  
             print(url);
      
      if (url.contains('/response.php')) {
        
         var substringfromurl = url.substring(0,url.indexOf('?'));
         var urlarray = substringfromurl.split('&').map((String text) => Text(text)).toList();
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
```

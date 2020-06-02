# Atom Paynetz for Flutter Integration

This is a helper class for Flutter Application to  generate atom paynetz payment URL.

## Getting Started

Download the package from pub.dev, 

Add this to `dependencies` in your app's `pubspec.yml`

```yaml
atompaynetz: ^0.0.1
```
## Usage

Sample code to integrate can be found in [example/lib/main.dart](example/lib/main.dart).

#### Import package 

```dart
import 'package:atompaynetz/atompaynetz.dart';
```

#### Create Razorpay instance

Create the instance and pass the mandatory parameters.

```dart
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
```

It will return the URL and you can open the URL in WebView using:

```
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

```

```
new MaterialApp(
      routes: {
        "/": (_) => new WebviewScaffold(
          url: getUrl(),
          appBar: new AppBar(
            title: new Text("Atom Payment Page"),
          ),
        ),
      },
    );
```
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(){
  group('flutter reverse app test',(){

    FlutterDriver driver;

    setUpAll(()async{
      driver = await FlutterDriver.connect();
      await Future.delayed(Duration(seconds: 10));

    });

    tearDownAll(()async{
        if(driver != null){
          driver?.close();
        }
    });
    var textField = find.byType("TextField");
    var button = find.text("Reverse");
    var reverse = find.text("olleH");

    test("reverse the string",()async{
      await driver.tap(textField);
      await Future.delayed(Duration(seconds: 2));
      await driver.enterText("Hello");
      await Future.delayed(Duration(seconds: 2));

      await driver.tap(button);
      await Future.delayed(Duration(seconds: 2));

      await driver.waitFor(reverse);
      //Esperamos que no queden llamadas en cola.
      await driver.waitUntilNoTransientCallbacks();
      assert(reverse != null);

    });

  });
}
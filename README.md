Widget criado com a intenção de colocar no projeto um login da Click.

## Uso

Basta importar e usar o widget, assim como o exemplo abaixo:

```dart

import 'package:click_login_page/click_login_box.dart';

ClickLoginBox(
        loginType: LoginType.id,
        showForgotPassword: true,
        logo: SvgPicture.asset(
          'assets/white-logo.svg',
        ),
        applicationName: 'CLICK ORDER',
        applicationVersionText: 'Versão - 1.0.0',
        onPressedLogin: (loginModel) async {
          await Future.delayed(const Duration(seconds: 5));
          debugPrint(loginModel.toJson());
        },
      ),
```

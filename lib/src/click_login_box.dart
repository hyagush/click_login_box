import 'package:click_login_box/src/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum LoginType {
  id,
  email,
}

class ClickLoginBox extends StatefulWidget {
  final LoginType loginType;
  final Future<void> Function(LoginModel loginModel)? onPressedLogin;
  final String applicationName;
  final String applicationVersionText;
  final Widget logo;
  final bool showForgotPassword;

  const ClickLoginBox({
    super.key,
    required this.loginType,
    required this.applicationName,
    required this.applicationVersionText,
    required this.logo,
    this.onPressedLogin,
    this.showForgotPassword = false,
  });

  @override
  State<ClickLoginBox> createState() => _ClickLoginBoxState();
}

class _ClickLoginBoxState extends State<ClickLoginBox> {
  final _emailEC = TextEditingController();
  final _personIdEC = TextEditingController();
  final _passwordEC = TextEditingController();
  var _inputDecorationTextFormField = const InputDecoration();
  var _textStyleTextFormField = const TextStyle();

  final ValueNotifier<bool> _isPasswordVisible = ValueNotifier<bool>(false);
  final ValueNotifier<bool> _isButtonLocked = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _emailEC.dispose();
    _personIdEC.dispose();
    _passwordEC.dispose();
    _isPasswordVisible.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _inputDecorationTextFormField = InputDecoration(
      labelStyle: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(fontSize: 14, fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.9)),
      floatingLabelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.9),
          ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey[400]!,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
          width: 1.5,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.error,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.primary,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
    );

    _textStyleTextFormField =
        Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.9), fontSize: 14);

    return Center(
      child: Card(
        color: Theme.of(context).cardTheme.color,
        child: SizedBox(
          width: 320,
          height: widget.showForgotPassword ? 427 : 399,
          child: Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 80, maxWidth: 300),
                    child: widget.logo,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                widget.applicationName,
                style: TextStyle(
                  height: 1,
                  color: Theme.of(context).colorScheme.primary,
                  overflow: TextOverflow.ellipsis,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -0.3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20, bottom: 10),
                child: widget.loginType == LoginType.email
                    ? TextFormField(
                        controller: _emailEC,
                        keyboardType: TextInputType.emailAddress,
                        style: _textStyleTextFormField,
                        decoration: _inputDecorationTextFormField.copyWith(
                          label: const Text('E-mail'),
                          prefixIcon: const Icon(
                            Icons.email,
                            size: 20,
                          ),
                        ),
                      )
                    : TextFormField(
                        controller: _personIdEC,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        keyboardType: TextInputType.number,
                        style: _textStyleTextFormField,
                        decoration: _inputDecorationTextFormField.copyWith(
                          label: const Text('ID'),
                          prefixIcon: const Icon(
                            Icons.person,
                            size: 20,
                          ),
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                child: ValueListenableBuilder<bool>(
                  valueListenable: _isPasswordVisible,
                  builder: (context, isVisible, child) => TextFormField(
                    controller: _passwordEC,
                    obscureText: !isVisible,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).textTheme.bodyMedium!.color!.withOpacity(0.9)),
                    decoration: _inputDecorationTextFormField.copyWith(
                      label: const Text('Senha'),
                      prefixIcon: const Icon(
                        Icons.lock,
                        size: 20,
                      ),
                      counter: widget.showForgotPassword
                          ? InkWell(
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              onTap: () {},
                              child: Text(
                                'Esqueceu sua senha?',
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            )
                          : null,
                      suffixIcon: InkWell(
                        onTap: () {
                          _isPasswordVisible.value = !isVisible;
                        },
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        child: Icon(
                          isVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: ValueListenableBuilder(
                        valueListenable: _isButtonLocked,
                        builder: (context, buttonLocked, child) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.primary,
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                              elevation: 3,
                              disabledBackgroundColor: Colors.grey,
                            ),
                            onPressed: _isButtonLocked.value
                                ? null
                                : () async {
                                    _isButtonLocked.value = !buttonLocked;
                                    if (widget.onPressedLogin != null) {
                                      try {
                                        final input = LoginModel(
                                          idPessoa: int.tryParse(_personIdEC.text),
                                          email: _emailEC.text,
                                          password: _passwordEC.text,
                                        );
                                        await widget.onPressedLogin!(input);
                                      } catch (e) {
                                        debugPrint('Error: ');
                                      } finally {
                                        _isButtonLocked.value = buttonLocked;
                                      }
                                    }
                                  },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Text(
                                    'LOGAR',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                          color: Theme.of(context).colorScheme.onPrimary,
                                        ),
                                  ),
                                  Visibility(
                                    visible: buttonLocked,
                                    child: const SizedBox(
                                      height: 15,
                                      width: 15,
                                      child: CircularProgressIndicator(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.applicationVersionText,
                      style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 11),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

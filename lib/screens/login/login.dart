import 'package:flutter/material.dart';
import 'package:photo_app/generated/l10n.dart';
import 'package:photo_app/widgets/app_space_bar.dart';
import 'package:photo_app/widgets/back_button.dart';
import 'package:photo_app/widgets/button.dart';
import 'package:reactive_forms/reactive_forms.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FormGroup _formGroup;

  @override
  void initState() {
    _formGroup = FormGroup({
      'email': FormControl(
        validators: [
          Validators.email,
          Validators.required,
        ],
      ),
      'password': FormControl(
        validators: [
          Validators.required,
        ],
      ),
    });
    super.initState();
  }

  void _onSubmit() {
    _formGroup.markAllAsTouched();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: const AppBackButton(),
            pinned: true,
            expandedHeight: 128,
            flexibleSpace: AppSpaceBar(title: S.current.loginTitle),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              vertical: 16.0,
              horizontal: 16.0,
            ),
            sliver: SliverToBoxAdapter(
              child: ReactiveForm(
                formGroup: _formGroup,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 16.0),
                    ReactiveTextField(
                      formControlName: 'email',
                      autocorrect: false,
                      validationMessages: (control) => {
                        ValidationMessage.required:
                            S.current.emailIsRequiredError,
                        ValidationMessage.email: S.current.emailIsInvalidError,
                      },
                      decoration: InputDecoration(
                        hintText: S.current.emailLabel,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ReactiveTextField(
                      formControlName: 'password',
                      obscureText: true,
                      autocorrect: false,
                      validationMessages: (control) => {
                        ValidationMessage.required:
                            S.current.passwordIsRequiredError
                      },
                      decoration: InputDecoration(
                        hintText: S.current.passwordLabel,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    FilledAppButton(
                      onPressed: _onSubmit,
                      child: Text(S.current.loginButtonText),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

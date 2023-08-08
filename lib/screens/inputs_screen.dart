import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
  const InputsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> myFormKey = GlobalKey<FormState>();

    final Map<String, String> formValues = {
      'first_name': 'Agustín',
      'last_name': 'Palavecino',
      'email': 'agupalavecino97@gmail.com',
      'password': 'admin1234',
      'role': 'Admin'
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Inputs y forms'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: myFormKey,
          // onChanged: ,
          child: Column(
            children: [
              CustomInputField(
                labelText: 'Nombre',
                hintText: 'Nombre del usuario',
                formPropierty: 'first_name',
                formValues: formValues,
              ),
              const SizedBox(height: 30),
              CustomInputField(
                labelText: 'Apellido',
                hintText: 'Apellido del usuario',
                formPropierty: 'last_name',
                formValues: formValues,
              ),
              const SizedBox(height: 30),
              CustomInputField(
                  labelText: 'Email',
                  hintText: 'Email del usuario',
                  keyboardType: TextInputType.emailAddress,
                  formPropierty: 'email',
                  formValues: formValues),
              const SizedBox(height: 30),
              CustomInputField(
                  labelText: 'Cotraseña',
                  hintText: 'Cotraseña del usuario',
                  isPassword: true,
                  formPropierty: 'password',
                  formValues: formValues),
              const SizedBox(height: 30),
              DropdownButtonFormField(
                  value: 'Admin',
                  items: const [
                    DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                    DropdownMenuItem(
                        value: 'Super User', child: Text('Super User')),
                    DropdownMenuItem(
                        value: 'Senior Developer',
                        child: Text('Senior Developer')),
                    DropdownMenuItem(
                        value: 'Junior Developer',
                        child: Text('Junior Developer')),
                  ],
                  onChanged: (value) {
                    formValues['role'] = value ?? 'Admin';
                  }),
              ElevatedButton(
                  child: const SizedBox(
                      width: double.infinity,
                      child: Center(child: Text('Guardar'))),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    if (!myFormKey.currentState!.validate()) {
                      print('Formulario no válido');
                      return;
                    }
                    print(formValues);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

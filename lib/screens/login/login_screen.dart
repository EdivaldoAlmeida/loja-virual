import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loja_virtual/helpers/validators.dart';

class LoginScreen extends StatelessWidget {

  //Criando os controllers dos campos para envio para o Firebase
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  // 2 - Chave global para validação dos campos validados (e-amil e senha)
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form( // 1 - Esse Widget é necessário para permmitir o acesso aos campos do formulário
            key: formKey, // 3 - Chave para acessar os formulários
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true, //Lista irá ocupar a menor altura possível
              children: <Widget>[
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  validator: (email){
                    if(!emailValid(email)) {
                      return "E-mail Inválido";
                    }
                    print(emailController.text);
                    return null;
                  },
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: passController,
                  decoration: const InputDecoration(hintText: 'Senha'),
                  autocorrect: false,
                  obscureText: true,
                  validator: (pass){
                    if(pass.isEmpty || pass.length <6) {
                      return 'Senha inválida';
                    }
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: (){

                    },
                    padding: EdgeInsets.zero,
                    child: const Text(
                      'Esqueci minha senha'
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  height: 44,
                  child: RaisedButton(
                    onPressed: (){
                      formKey.currentState.validate(); // 4 - validando os campos
                    },
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: const Text(
                      'Entrar',
                      style: TextStyle(
                        fontSize: 18
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

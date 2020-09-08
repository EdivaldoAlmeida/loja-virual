import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loja_virtual/helpers/validators.dart';
import 'package:loja_virtual/models/user.dart';
import 'package:loja_virtual/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {

  //Criando os controllers dos campos para envio para o Firebase
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  // 2 - Chave global do formulário para validação dos campos validados (e-amil e senha)
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Chave global do Scaffold: exibi SnackBar ao detectar falha ao autenticar.
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: (){
              //navegando para tela sigup e fechando a atual
              Navigator.of(context).pushReplacementNamed('/signup');
            },
            textColor: Colors.white,
            child: const Text('CRIAR CONTA', style: TextStyle(fontSize: 14),)
          )
        ],
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form( // 1 - Esse Widget é necessário para permmitir o acesso aos campos do formulário
            key: formKey, // 3 - Chave para acessar os formulários
            child: Consumer<UserMaganager>( //widget consumidor é aquele que fica observando as mudanças no UserManager e rebuilda todos os filhos em caso de mudança daquele
              builder: (_, userManager, __){ //parâmetros com _ quer dizer que não iremos utilizá-los.
                return ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true, //Lista irá ocupar a menor altura possível
                  children: <Widget>[
                    TextFormField(
                      controller: emailController,
                      enabled: !userManager.loading, //desabilita caso o esteja carregando
                      decoration: const InputDecoration(hintText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email){
                        if(!emailValid(email)) {
                          return "E-mail Inválido";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      controller: passController,
                      enabled: !userManager.loading, //desabilida caso esteja carregando
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
                        //caso esteja carregando o botão será desabilitado (null), caso cotrário mostra normal.
                        onPressed: userManager.loading ? null : (){
                          if(formKey.currentState.validate()){ // 4 - validando os campos
                            userManager.signIn( //Agora podemos acessar o userManager diretamente.
                                user: User(email: emailController.text, password: passController.text),
                                onFail: (e){
                                  scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                        content:  Text('Falha ao entra:  $e'),
                                        backgroundColor: Colors.red,
                                      )
                                  );
                                },
                                onSuccess: (){
                                  //TODO: FECHAR TELA DE LOGIN
                                }
                            );
                          }
                        },
                        color: Theme.of(context).primaryColor,
                        disabledColor: Theme.of(context).primaryColor.withAlpha(100),
                        textColor: Colors.white,
                        child: userManager.loading ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        ) :
                        const Text(
                          'Entrar',
                          style: TextStyle(
                              fontSize: 18
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

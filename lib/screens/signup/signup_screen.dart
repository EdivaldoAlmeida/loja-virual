import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar conta'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true, //ocupar o menor espapo possível
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(hintText: 'Nome completo'),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(hintText: 'E-mail'),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Senha'),
                obscureText: true,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Repita a senha'),
                obscureText: true,
              ),
              const SizedBox(height: 16,),
              SizedBox(
                height: 44,
                child: RaisedButton(
                  color: Theme.of(context).primaryColor,
                  disabledColor: Theme.of(context).primaryColor
                      .withAlpha(100),
                  textColor: Colors.white,
                  onPressed: (){

                  },
                  child: const Text('Criar conta',
                  style: TextStyle(
                    fontSize: 18
                  ),),

              ),
              )
            ]
          )
        ),
      ),
    );
  }
}

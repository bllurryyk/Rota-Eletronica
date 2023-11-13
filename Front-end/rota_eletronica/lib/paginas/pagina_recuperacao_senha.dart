import 'package:flutter/material.dart';
import 'package:rota_eletronica/paginas/pagina_cadastro.dart';
import 'package:rota_eletronica/paginas/pagina_principal.dart';
import 'package:rota_eletronica/services/flutter_fire_auth.dart';
import 'package:rota_eletronica/components/show_snackbar.dart';

class PaginaRecuperacaoSenha extends StatefulWidget {
  const PaginaRecuperacaoSenha({super.key});

  @override
  State<PaginaRecuperacaoSenha> createState() => _PaginaRecuperacaoSenhaState();
}

class _PaginaRecuperacaoSenhaState extends State<PaginaRecuperacaoSenha> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focoNoEmail = FocusNode();
  final TextEditingController _controleEmail = TextEditingController();

  final FlutterFireAuth authService = FlutterFireAuth();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xffCED2FF), Color(0xffffffff)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.0, 1.0],
          tileMode: TileMode.clamp,
        )),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  "assets/images/logo.png",
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 10),
                Text(
                  "Recuperação da senha",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 35),
                TextFormField(
                  controller: _controleEmail,
                  focusNode: _focoNoEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, digite seu e-mail.";
                    } else if (!(value.contains('@') && value.contains('.'))) {
                      return "E-mail inválido!";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                const SizedBox(height: 25),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: const Color(0xff8497FE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      onPressed: () {
                        /*
                        if (_formKey.currentState?.validate() ?? false) {
                          // validar e salvar dados
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              width: 200,
                              backgroundColor: const Color(0xff2D3E9A),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              behavior: SnackBarBehavior.floating,
                              content: const Text("Registrado com sucesso"),
                            ),
                          );
                          _formKey.currentState?.reset();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PaginaPrincipal()));
                        }
                        */
                        botaoResetarSenhaClicado();
                      },
                      child: const Text(
                        "Confirmar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const FazerCadastro(),
                    const SizedBox(height: 50),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  botaoResetarSenhaClicado() {
    String email = _controleEmail.text;

    authService.redefinirSenha(email: email).then((String? erro) {
      if (erro == null) {
        showSnackBar(
            context: context,
            mensagem: "Você receberá um email para alterar a senha.",
            isErro: false);
      } else {
        showSnackBar(context: context, mensagem: erro);
      }
    });
  }

  @override
  void dispose() {
    _focoNoEmail.dispose();
    _controleEmail.dispose();
    super.dispose();
  }
}

class FazerCadastro extends StatelessWidget {
  const FazerCadastro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Ainda não tem conta?"),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const PaginaCadastro()),
                (route) => route.isFirst);
          },
          child: const Text(
            "Faça seu cadastro",
            style: TextStyle(color: Color(0xff004088)),
          ),
        ),
      ],
    );
  }
}

class CheckBoxTermosECondicoes extends StatefulWidget {
  final String text;
  final String link;
  const CheckBoxTermosECondicoes(
      {super.key, required this.text, required this.link});

  @override
  State<CheckBoxTermosECondicoes> createState() => _CheckBoxTermosECondicoes();
}

class _CheckBoxTermosECondicoes extends State<CheckBoxTermosECondicoes> {
  bool _selecionado = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _selecionado = !_selecionado;
            });
          },
          child: Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: const Color(0xFFA8A8A8))),
            child: _selecionado
                ? const Icon(
                    Icons.check,
                    size: 17,
                    color: Color(0xff8497FE),
                  )
                : null,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Row(
          children: [
            Text(
              widget.text,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                widget.link,
                style: const TextStyle(
                  color: Color(0xff004088),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

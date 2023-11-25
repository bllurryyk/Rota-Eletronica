import 'package:flutter/material.dart';
import 'package:rota_eletronica/services/flutter_fire_auth.dart';
import 'package:rota_eletronica/components/show_snackbar.dart';
import 'package:rota_eletronica/paginas/pagina_cadastro_ponto_de_coleta.dart';
import 'package:rota_eletronica/teste/pagina_inicial_ponto_de_coleta.dart';

class PaginaLoginPontoDeColeta extends StatefulWidget {
  const PaginaLoginPontoDeColeta({super.key});

  @override
  State<PaginaLoginPontoDeColeta> createState() =>
      _PaginaLoginPontoDeColetaState();
}

class _PaginaLoginPontoDeColetaState extends State<PaginaLoginPontoDeColeta> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focoNoEmail = FocusNode();
  final FocusNode _focoNoSenha = FocusNode();
  final TextEditingController _controleEmail = TextEditingController();
  final TextEditingController _controleSenha = TextEditingController();

  bool _esconderSenha = true;

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
                  "Que bom te ver\nnovamente!",
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
                  onEditingComplete: () => _focoNoSenha.requestFocus(),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controleSenha,
                  obscureText: _esconderSenha,
                  focusNode: _focoNoSenha,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Senha",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _esconderSenha = !_esconderSenha;
                          });
                        },
                        icon: _esconderSenha
                            ? const Icon(Icons.visibility_outlined)
                            : const Icon(Icons.visibility_off_outlined)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, digite sua senha.";
                    } else if (value.length < 8) {
                      return "A senha deve ter pelo menos 8 caracteres.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                const RecuperarSenha(),
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
                        botaoEntrarClicado();
                      },
                      child: const Text(
                        "Entrar",
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

  botaoEntrarClicado() {
    String email = _controleEmail.text;
    String senha = _controleSenha.text;

    authService.loginUsuario(email: email, senha: senha).then((String? erro) {
      if (erro == null) {
        showSnackBar(
            context: context,
            mensagem: "Login efetuado com sucesso.",
            isErro: false);
      } else {
        showSnackBar(context: context, mensagem: erro);
      }
    });

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => const PaginaInicialPontoDeColeta()),
        (route) => false);
  }

  @override
  void dispose() {
    _focoNoEmail.dispose();
    _focoNoSenha.dispose();
    _controleEmail.dispose();
    _controleSenha.dispose();
    super.dispose();
  }
}

class RecuperarSenha extends StatelessWidget {
  const RecuperarSenha({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Esqueceu a senha?"),
        TextButton(
          onPressed: () {}, //=> Navigator.pop(context),
          child: const Text(
            "Clique aqui",
            style: TextStyle(color: Color(0xff004088)),
          ),
        ),
      ],
    );
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
                MaterialPageRoute(
                    builder: (context) => const PaginaCadastroPontoDeColeta()),
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

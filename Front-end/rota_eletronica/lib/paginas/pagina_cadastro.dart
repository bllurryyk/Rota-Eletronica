import 'package:flutter/material.dart';
import 'package:rota_eletronica/paginas/pagina_principal.dart';

class PaginaCadastro extends StatefulWidget {
  const PaginaCadastro({super.key});

  @override
  State<PaginaCadastro> createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaCadastro> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focoNoEmail = FocusNode();
  final FocusNode _focoNoSenha = FocusNode();
  final FocusNode _focoNoConfirmarSenha = FocusNode();
  final TextEditingController _controleNome = TextEditingController();
  final TextEditingController _controleSobreNome = TextEditingController();
  final TextEditingController _controleEmail = TextEditingController();
  final TextEditingController _controleSenha = TextEditingController();
  final TextEditingController _controleConfirmarSenha = TextEditingController();
  final TextEditingController _controleCidade = TextEditingController();

  bool _esconderSenha = true;

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
                Image.network(
                  "lib/image/logo.png",
                  width: 200,
                  height: 200,
                ),
                const SizedBox(height: 10),
                Text(
                  "Crie sua conta",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 35),
                TextFormField(
                  controller: _controleNome,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Nome",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, digite seu nome.";
                    } //else if (_boxAccounts.containsKey(value)) {return "Username is already registered.";}

                    return null;
                  },
                  onEditingComplete: () => _focoNoEmail.requestFocus(),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controleSobreNome,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Sobrenome",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, digite seu sobrenome.";
                    } //else if (_boxAccounts.containsKey(value)) {return "Username is already registered.";}

                    return null;
                  },
                  onEditingComplete: () => _focoNoEmail.requestFocus(),
                ),
                const SizedBox(height: 10),
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
                  controller: _controleCidade,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Cidade",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Por favor, digite o nome da dua cidade.";
                    } // usuário já registrado

                    return null;
                  },
                  onEditingComplete: () => _focoNoEmail.requestFocus(),
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
                  onEditingComplete: () => _focoNoConfirmarSenha.requestFocus(),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controleConfirmarSenha,
                  obscureText: _esconderSenha,
                  focusNode: _focoNoConfirmarSenha,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: "Confirmar senha",
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
                    } else if (value != _controleSenha.text) {
                      return "A senha não corresponde.";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 25),
                const CheckBoxTermosECondicoes(
                  text: 'Eu li e aceito os',
                  link: 'Termos e Condições',
                ),
                const SizedBox(height: 25),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: const Color(0xff8497FE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const PaginaPrincipal()));
                      },
                      child: const Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const FazerLogin(),
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

  @override
  void dispose() {
    _focoNoEmail.dispose();
    _focoNoSenha.dispose();
    _focoNoConfirmarSenha.dispose();
    _controleNome.dispose();
    _controleSobreNome.dispose();
    _controleEmail.dispose();
    _controleCidade.dispose();
    _controleSenha.dispose();
    _controleConfirmarSenha.dispose();
    super.dispose();
  }
}

class FazerLogin extends StatelessWidget {
  const FazerLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Já possui conta?"),
        TextButton(
          onPressed: () {}, //=> Navigator.pop(context),
          child: const Text(
            "Faça o login",
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

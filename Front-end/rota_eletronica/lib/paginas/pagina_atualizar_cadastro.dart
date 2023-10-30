import 'package:flutter/material.dart';
import 'package:rota_eletronica/paginas/pagina_principal.dart';

class PaginaAtualizarCadastro extends StatefulWidget {
  const PaginaAtualizarCadastro({super.key});

  @override
  State<PaginaAtualizarCadastro> createState() => _PaginaCadastroState();
}

class _PaginaCadastroState extends State<PaginaAtualizarCadastro> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final FocusNode _focoNoEmail = FocusNode();
  final FocusNode _focoNoSenha = FocusNode();
  final TextEditingController _controleNome = TextEditingController();
  final TextEditingController _controleSobreNome = TextEditingController();
  final TextEditingController _controleEmail = TextEditingController();
  final TextEditingController _controleCidade = TextEditingController();

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
                  "Atualização cadastral",
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const PaginaPrincipal()));
                      },
                      child: const Text(
                        "Atualizar",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
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
    _controleNome.dispose();
    _controleSobreNome.dispose();
    _controleEmail.dispose();
    _controleCidade.dispose();
    super.dispose();
  }
}

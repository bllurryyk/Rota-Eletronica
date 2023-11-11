import "package:flutter/material.dart";

showSnackBar(
    {required BuildContext context,
    required String mensagem,
    bool isErro = true}) {
  SnackBar snackBar = SnackBar(
    content: Text(mensagem),
    backgroundColor: (isErro) ? Colors.red : const Color(0xff8497FE),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

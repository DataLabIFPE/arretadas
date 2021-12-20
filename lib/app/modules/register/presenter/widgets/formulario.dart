import 'package:arretadas/app/core/components/input.dart';
import 'package:flutter/material.dart';

class Formulario extends StatefulWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  int currentStep = 0;

  List<Step> getSteps() {
    return [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text('Credênciais'),
        content: Column(
          children: [
            const Input(
              label: 'Usuário',
              hint: 'Digite seu usuário',
              icon: Icons.person,
            ),
            const SizedBox(
              height: 10,
            ),
            Input(
              label: 'Senha',
              hint: 'Digite sua senha',
              icon: Icons.vpn_key,
              suffix: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Input(
              label: 'Confirme sua senha',
              hint: 'Confirme sua senha',
              icon: Icons.vpn_key,
              suffix: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Input(
              textInputType: TextInputType.text,
              label: 'Medida Protetiva (OPCIONAL)',
              hint: 'Digite sua medida protetiva',
              maxLength: 6,
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text('Segurança'),
        content: Column(
          children: [
            Text(
              'Escolha a pergunta de segurança'.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: 'Qual foi seu herói de infância?',
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.red,
              ),
              onChanged: (newValue) {
                setState(() {
                  //dropdownValue = newValue!;
                  //register = register.copyWith(city: dropdownValue);
                });
              },
              items: <String>[
                'Qual foi seu herói de infância?',
                'Qual o nome do seu primo favorito?',
                'Onde o seu pai e sua mãe se conheceram?',
                'Qual era o nome do seu primeiro animal de estimação?',
                'Qual era o nome do seu melhor amigo na adolescência?',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Escolha a resposta'.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Input(label: 'Resposta'),
          ],
        ),
      ),
      Step(
        state: currentStep > 2 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 2,
        title: const Text('Cidade'),
        content: Column(
          children: [
            Text(
              'Escolha sua cidade '.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: 'Garanhuns',
              style: const TextStyle(color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.red,
              ),
              onChanged: (newValue) {
                setState(() {
                  //dropdownValue = newValue!;
                  //register = register.copyWith(city: dropdownValue);
                });
              },
              items: <String>[
                'Garanhuns',
                'Monteiro',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(); /*Stepper(
      type: StepperType.horizontal,
      steps: getSteps(),
      currentStep: currentStep,
      onStepContinue: () {},
      onStepTapped: (value) {
        setState(() {
          currentStep = value;
        });
      },
      onStepCancel: currentStep == 0
          ? null
          : () {
              setState(
                () {
                  currentStep -= 1;
                },
              );
            },
      controlsBuilder: (context, {onStepCancel, onStepContinue}) {
        final isLastStep = currentStep == getSteps().length - 1;
        return Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: Text(isLastStep ? 'ENVIAR' : 'CONTINUAR'),
                  onPressed: onStepContinue,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              if (currentStep != 0)
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      primary: Colors.grey,
                    ),
                    child: Text('VOLTAR'),
                    onPressed: onStepCancel,
                  ),
                ),
            ],
          ),
        );
      },
    );*/
  }
}

import 'package:flutter/material.dart';
import 'package:handshake/widgets/background_decoration.dart';

class RegistreCompanion extends StatefulWidget {
  RegistreCompanion({ Key? key }) : super(key: key);
  @override

  @override
  State<RegistreCompanion> createState() => _RegistreCompanion();
}

class _RegistreCompanion extends State<RegistreCompanion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 30,
          title: const Text(
            "Enregistrement",
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          decoration: fondDecoration(),
          
        ),
      );
  }

  /* Future<Task> getSampleTask() {
    var task = NavigableTask(
      id: TaskIdentifier(),
      steps: [
        InstructionStep(
          title: 'Bienvenue à HandShake',
          text: 'Inscris toi en quelques clics !',
          buttonText: 'Suivant',
        ),
        QuestionStep(
          title: 'Quel est ton nom ?',
          answerFormat: IntegerAnswerFormat(
            hint: 'Entre ton nom',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Quel est ton prenom ?',
          answerFormat: IntegerAnswerFormat(
            hint: 'Entre ton prenom',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Quelle est votre date de naissance?',
          answerFormat: DateAnswerFormat(
            minDate: DateTime.utc(1970),
            defaultDate: DateTime.now(),
            maxDate: DateTime.now(),
          ),
        ),
        QuestionStep(
          title: 'Quelle est ton adresse postale ?',
          answerFormat: IntegerAnswerFormat(
            hint: 'Entre ton adresse postale',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Quel est ton code postale ?',
          answerFormat: IntegerAnswerFormat(
            hint: 'Entre ton code postale',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Dans quelle ville vis-tu?',
          answerFormat: IntegerAnswerFormat(
            hint: 'Entre le nom de ta ville',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Quel est ton numéro de téléphone ?',
          answerFormat: IntegerAnswerFormat(
            hint: 'Entre ton numéro de téléphone',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'De quelle organisation viens-tu ?',
          answerFormat: IntegerAnswerFormat(
            hint: 'Entre le nom de ton organisation',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Quelle est ton adresse e-mail ?',
          answerFormat: IntegerAnswerFormat(
            hint: 'Entre ton adresse e-mail',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Choisis un mot de passe',
          answerFormat: IntegerAnswerFormat(
            hint: 'Entre un mot de passe',
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Confirme ton mot de passe',
          answerFormat: IntegerAnswerFormat(
            hint: 'Confirmation de ton mot de passe', //Il faut checker le mot de passe
          ),
          isOptional: true,
        ),
        QuestionStep(
          title: 'Quels sont tes loisirs ?',
          text: 'Les loisirs pourront créer un lien fort avec la ou les personnes que tu accompagnera',
          isOptional: false,
          answerFormat: MultipleChoiceAnswerFormat(
            textChoices: [
              TextChoice(text: 'Musique', value: 'Musique'),
              TextChoice(text: 'Lecture', value: 'Lecture'),
              TextChoice(text: 'Jeu vidéos', value: 'Jeu vidéos'),
              TextChoice(text: 'Sport', value: 'Sport'),
              TextChoice(text: 'Séries / Films', value: 'Séries / Films'),
              TextChoice(text: 'Documentaire', value: 'Documentaire'),
            ],
          ),
        ),
        QuestionStep(
          title: 'Davantage de loisir ?', //Si non, on n'affiche pas la suivante
          text: 'As-tu davantage de loisir ?',
          answerFormat: BooleanAnswerFormat(
            positiveAnswer: 'Oui',
            negativeAnswer: 'Non',
            result: BooleanResult.POSITIVE,
          ),
        ),
        QuestionStep(
          title: 'Quel est ton autre loisir ?',
          answerFormat: IntegerAnswerFormat(
            hint: 'Entres un autre loisir',
          ),
          isOptional: true,
        ),
        CompletionStep(
          stepIdentifier: StepIdentifier(id: '321'),
          text: 'Merci davoir compléter ton profil ',
          title: 'Terminé !',
          buttonText: 'SUIVANT',
        ),
      ],
    );
    task.addNavigationRule(
      forTriggerStepIdentifier: task.steps[12].stepIdentifier,
      navigationRule: ConditionalNavigationRule(
        resultToStepIdentifierMapper: (input) {
          switch (input) {
            case "Yes":
              return task.steps[0].stepIdentifier;
            case "No":
              return task.steps[7].stepIdentifier;
            default:
              return null;
          }
        },
      ),
    );
    return Future.value(task);
  }


  Future<Task> getJsonTask() async {
    final taskJson = await rootBundle.loadString('/Users/amel/flutter_application_1/lib/example_json.json');
    final taskMap = json.decode(taskJson);

    return Task.fromJson(taskMap);
  }*/
}
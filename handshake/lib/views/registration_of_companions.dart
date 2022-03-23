import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handshake/widgets/background_decoration.dart';
import 'package:survey_kit/survey_kit.dart';

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
          //color: Colors.white,
          child: Align(
            alignment: Alignment.center,
            child: FutureBuilder<Task>(
              future: getSampleTask(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData &&
                    snapshot.data != null) {
                  final task = snapshot.data!;
                  return SurveyKit(
                    onResult: (SurveyResult result) {
                      print(result.finishReason);
                    },
                    task: task,
                    showProgress: true,
                    localizations: {
                      'annuler': 'Annuler',
                      'suivant': 'Suivant',
                    },
                    themeData: Theme.of(context).copyWith(
                      /* colorScheme: ColorScheme.fromSwatch(
                        primarySwatch: Colors.cyan,
                      ).copyWith(
                        onPrimary: Colors.white,
                      ),
                      primaryColor: Colors.cyan, */
                      //backgroundColor: Colors.white,
                      /* appBarTheme: const AppBarTheme(
                        color: Colors.white,
                        iconTheme: IconThemeData(
                          color: Colors.cyan,
                        ),
                        titleTextStyle: TextStyle(
                          color: Colors.cyan,
                        ),
                      ), */
                      /* iconTheme: const IconThemeData(
                        color: Colors.cyan,
                      ), */
                      /* textSelectionTheme: TextSelectionThemeData(
                        cursorColor: Colors.cyan,
                        selectionColor: Colors.cyan,
                        selectionHandleColor: Colors.cyan,
                      ), */
                      /* cupertinoOverrideTheme: CupertinoThemeData(
                        primaryColor: Colors.cyan,
                      ), */
                      outlinedButtonTheme: OutlinedButtonThemeData(
                        style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(150.0, 60.0),
                          ),
                          side: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> state) {
                              if (state.contains(MaterialState.disabled)) {
                                return BorderSide(
                                  color: Colors.grey,
                                );
                              }
                              return BorderSide(
                                color: Colors.cyan,
                              );
                            },
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          textStyle: MaterialStateProperty.resolveWith(
                            (Set<MaterialState> state) {
                              if (state.contains(MaterialState.disabled)) {
                                return Theme.of(context)
                                    .textTheme
                                    .button
                                    ?.copyWith(
                                      color: Colors.grey,
                                    );
                              }
                              return Theme.of(context)
                                  .textTheme
                                  .button
                                  ?.copyWith(
                                    color: Colors.cyan,
                                  );
                            },
                          ),
                        ),
                      ),
                      textButtonTheme: TextButtonThemeData(
                        style: ButtonStyle(
                          textStyle: MaterialStateProperty.all(
                            Theme.of(context).textTheme.button?.copyWith(
                                  color: Colors.cyan,
                                ),
                          ),
                        ),
                      ),
                      textTheme: TextTheme(
                        headline2: TextStyle(
                          fontSize: 28.0,
                          color: Colors.black,
                        ),
                        headline5: TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                        bodyText2: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        subtitle1: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                      inputDecorationTheme: InputDecorationTheme(
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    surveyProgressbarConfiguration: SurveyProgressConfiguration(
                      backgroundColor: Colors.white,
                    ),
                  );
                }
                return CircularProgressIndicator.adaptive();
              },
            ),
          ),
        ),
      );
  }

  Future<Task> getSampleTask() {
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
          //buttonText: 'SUIVANT',
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
  }
}
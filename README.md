<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Ce package a été créé pour faciliter le développement de mes applications,
ainsi que pour montrer une petite démo de ma façon de programmer.

Malgré que toutes les classes/extensions ont été codé par moi seul, 
pour `lib/src/helper/helper_review.dart` j'utilise le package `in_app_review` (présent sur pub.dev).

## Contenu

Ce package comporte deux grands dossiers :

• `lib/src/helper` : dans ce dossier on retrouve des classes/instances 
assez simples qui m'ont servis dans pas mal d'applications. 

• `lib/src/helper_extension` : dans ce dossier on retrouve pas mal des extensions les plus utiles.
Comme le fait de supprimer tout les espaces inutiles d'une chaîne de caractères :

```dart
String email = " voiciMonEmail@gmail.com ".removeEmptySpaces(); // Ce qui donnera "voiciMonEmail@gmail.com".
```

## Tests unitaires

Au début réticent aux tests unitaires, je me suis rendu à l'évidence que ceux-ci pouvait
certes, nous faire perdre du temps pendant le développement, mais nous faire gagner
un temps inestimable de débogage par la suite.

C'est pourquoi la plupart de mes applications excédent largement les 100 tests unitaires. 

Dans ce package vous retrouverez les tests dans le dossier `/test`
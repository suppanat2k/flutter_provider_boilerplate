# Flutter provider boilerplate

Add localizations

```sh
#add localizations to file /lib/base/l10n/app_en.arb, /lib/base/l10n/app_th.arb
#after add wording to localizations file run this command for reload localizations
flutter gen-l10n
```

Remote server pos

```sh
#need to remote ipv4 from local to link with adb port
#on real device can use same tcp and port
#EXAMPLE: if we want to remote with port 8000 and config port on device is 5000
$ adb forward tcp:8000 tcp:5000
```

Run app

```sh
#run dev environments debug mode
flutter run --flavor dev

#run dev environments release mode
flutter run --release --flavor dev

#run prod environments debug mode
flutter run --flavor prod

#run prod environments release mode
flutter run --release --flavor prod
```

Build app

```sh
#build apk dev environments (Android APK)
flutter build apk --flavor dev

#build apk prod environments (Android APK)
flutter build apk --flavor prod

#build aab dev environments (Android AAB for Upload to Play Store)
flutter build appbundle --flavor dev

#build ios dev environments (iOS)
flutter build ios --flavor dev

#build ios prod environments (iOS)
flutter build ios --flavor prod

#build ios dev environments (iOS IPA)
flutter build ipa --flavor dev

#build ios prod environments (iOS IPA)
flutter build ipa --flavor prod
```

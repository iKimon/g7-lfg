
In der AndroidManifest.xml muss für die LocationMap folgendes hinzugefügt werden:
```
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
```

Vor dem ersten Start für die Icons:
```
flutter pub pub run flutter_launcher_icons:main
```


Bekannte Probleme:

  Auf der Register Page bei Eingabe des Passworts oder der Email werden die Felder verdeckt
  

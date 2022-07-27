# Run on Local
```
flutter run
```

```
Multiple devices found:
macOS (desktop) • macos  • darwin-x64     • macOS 12.0.1 21A559 darwin-x64
Chrome (web)    • chrome • web-javascript • Google Chrome 96.0.4664.55
[1]: macOS (macos)
[2]: Chrome (chrome)
Please choose one (To quit, press "q/Q"):
```


# Build WEB

Update url backend

```
const backendUrl = 'http://localhost:4000';
```

on

```
lib
-- constants.dart
```

Generate Web Build

```
flutter run web --release
```

It generate WEB folder on

```
build
-- web
```

Upload web project to a web server
 

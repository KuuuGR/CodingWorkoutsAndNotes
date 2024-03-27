1. **Check if everything is fine**: This command provides a detailed report of the development environment (where `-v` stands for verbose).
```Terminal
   flutter doctor -v
```
2.  flutter build windows
3. flutter run -d windows
4. flutter run

jak robisz build to pewnie mozesz dodac --release
[jak zrobić instalator do Fluttera](https://medium.com/@fluttergems/packaging-and-distributing-flutter-desktop-apps-the-missing-guide-part-2-windows-0b468d5e9e70)
[Zbudować apkę instaler filmik YouTube](https://www.youtube.com/watch?v=XvwX-hmYv0E)


----
#### Installation on windows:
1. flutter pub get
2. flutter pub run build_runner build
3. flutter build windows
The file will be build in:
```Terminal
My.Project/build/windows/x64/runner/Release/my_project_name.exe
```
---



### Step 2: Enable Desktop Support

Even though desktop support is available on the stable channel, ensure that Windows desktop support is enabled for your Flutter installation:

TerminalCopy code

`flutter config --enable-windows-desktop`

Out: Setting "enable-winodws-desktop" value to "true".
You may need to restart and open editors for them to read new string.

Now i go to build folder and type
flutter create .

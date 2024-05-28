

# Set of commands useful in development

## Build for Windows platform

### Debug
1. Run debug version corresponding the one set in IDE. 
```bash
flutter run --debug
```


### Release
1. Run release version corresponding the one set in IDE. 
```bash
flutter run --release 
```

 
### General

1. **Use Profile Mode for Diagnosis**:  profile mode for testing It's a compromise between debug and release modes:
```bash
flutter run --profile
```
   **Conditional Code Paths**: In your Flutter code, use: [[Profile mode for diagnostics]]

2. To list all the files in your Flutter project directory and save that list to a text file
```bash
Get-ChildItem -Recurse | Select-Object -ExpandProperty FullName > files_list.txt
```

3.  

```bash
flutter clean  
flutter pub get  
flutter build windows --release
``` 
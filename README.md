
# react-native-message-compose-module

## Getting started

`$ npm install react-native-message-compose-module --save`

### Mostly automatic installation

`$ react-native link react-native-message-compose-module`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-message-compose-module` and add `RNMessageComposeModule.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNMessageComposeModule.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNMessageComposeModulePackage;` to the imports at the top of the file
  - Add `new RNMessageComposeModulePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-message-compose-module'
  	project(':react-native-message-compose-module').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-message-compose-module/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-message-compose-module')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNMessageComposeModule.sln` in `node_modules/react-native-message-compose-module/windows/RNMessageComposeModule.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using Message.Compose.Module.RNMessageComposeModule;` to the usings at the top of the file
  - Add `new RNMessageComposeModulePackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNMessageComposeModule from 'react-native-message-compose-module';

// TODO: What to do with the module?
RNMessageComposeModule;
```
  # react-native-message-compose-module

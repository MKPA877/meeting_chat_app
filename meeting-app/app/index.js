import { AppRegistry } from 'react-native';
import App from './App';
import { name as appName } from './app.json';
import { App as WebApp } from './App.web';

AppRegistry.registerComponent(appName, () => App);
AppRegistry.registerComponent(`${appName}.web`, () => WebApp);
AppRegistry.runApplication(appName, {
  initialProps: {},
  rootTag: document.getElementById('app-root'),
});

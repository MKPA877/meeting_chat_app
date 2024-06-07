
import React, { useState } from 'react'
import {
  SafeAreaView, StatusBar, Text,
} from 'react-native'
import { NavigationContainer } from '@react-navigation/native'
import { createNativeStackNavigator } from '@react-navigation/native-stack'

import SplashScreen from './src/screens/Splash'
import SignInScreen from './src/screens/SignIn'
import HomeScreen from './src/screens/Home'
import SearchScreen from './src/screens/Search'
import MessagesScreen from './src/screens/Messages'
import SignUpScreen from './src/screens/SignUp'




const Stack = createNativeStackNavigator()

function App() {

  const [initialized] = useState(false)
  const [authenticated] = useState(false )
  return (
    <NavigationContainer>
      <StatusBar barStyle='dark-context' />
      <Stack.Navigator>
        {!initialized ?(
          <>
            <Stack.Screen name="Splash" component={SplashScreen} />
          </>
        ) : !authenticated ? (
          <>
            <Stack.Screen name="SignIn" component={SignInScreen} />
            <Stack.Screen name="SignUp" component={SignUpScreen} />
          </>
        ) : (
          <>
            <Stack.Screen name="Home" component={HomeScreen} />
            <Stack.Screen name="Search" component={SearchScreen} />
            <Stack.Screen name="Messages" component={MessagesScreen} />
          </>
        )}
        
        
        
      </Stack.Navigator>
    </NavigationContainer>
  )
    
}
  

export default App;

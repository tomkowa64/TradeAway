import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

export const firebaseConfig = {
    apiKey: "AIzaSyDwn-mTTfkdLFev-X4toowylZMXSTMbfgY",
    authDomain: "tradeaway-90fa0.firebaseapp.com",
    databaseURL: "https://tradeaway-90fa0-default-rtdb.europe-west1.firebasedatabase.app",
    projectId: "tradeaway-90fa0",
    storageBucket: "tradeaway-90fa0.appspot.com",
    messagingSenderId: "438841586075",
    appId: "1:438841586075:web:c9207473ae5c0b7a1db13e",
    measurementId: "G-YSB8QHKC6J"
};

createApp(App)
.use(store)
.use(router)
.mount('#app')

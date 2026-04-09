// Import the functions you need from the SDKs you need
import { initializeApp } from "firebase/app";
import { getAnalytics } from "firebase/analytics";
importScripts("https://www.gstatic.com/firebasejs/10.12.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.12.0/firebase-messaging-compat.js");
// TODO: Add SDKs for Firebase products that you want to use
// https://firebase.google.com/docs/web/setup#available-libraries

// Your web app's Firebase configuration
// For Firebase JS SDK v7.20.0 and later, measurementId is optional
const firebaseConfig = {
  apiKey: "AIzaSyCx-WJZxA08S04Cx1EzIyHtuoCagOP-tw4",
  authDomain: "uts-marketplace.firebaseapp.com",
  projectId: "uts-marketplace",
  storageBucket: "uts-marketplace.firebasestorage.app",
  messagingSenderId: "814252788949",
  appId: "1:814252788949:web:e53d0a7eb41cf5e0c2265c",
  measurementId: "G-2CCJS1E408"
};

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const analytics = getAnalytics(app);
importScripts("https://www.gstatic.com/firebasejs/10.12.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/10.12.0/firebase-messaging-compat.js");

firebase.initializeApp({
  apiKey: "AIzaSyCx-WJZxA08S04Cx1EzIyHtuoCagOP-tw4",
  authDomain: "uts-marketplace.firebaseapp.com",
  projectId: "uts-marketplace",
  storageBucket: "uts-marketplace.firebasestorage.app",
  messagingSenderId: "814252788949",
  appId: "1:814252788949:web:e53d0a7eb41cf5e0c2265c",
});

const messaging = firebase.messaging();
name: MindQuest APK bauen

on:
  push:
    branches: [ main, master ]
  workflow_dispatch:

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-node@v4
        with:
          node-version: '20'

      - uses: actions/setup-java@v4
        with:
          distribution: 'temurin'
          java-version: '21'

      - name: Capacitor installieren
        run: npm i @capacitor/core@latest @capacitor/cli@latest @capacitor/android@latest

      - name: Android-Projekt erzeugen
        run: npx cap add android

      - name: Web-Dateien übernehmen
        run: npx cap sync android

      - name: APK bauen
        run: |
          chmod +x android/gradlew
          cd android && ./gradlew assembleDebug --no-daemon

      - name: APK hochladen
        uses: actions/upload-artifact@v4
        with:
          name: MindQuest-APK
          path: android/app/build/outputs/apk/debug/app-debug.apk
          if-no-files-found: error

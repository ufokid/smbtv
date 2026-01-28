#!/bin/bash
cd "$(dirname "$0")"
docker run --rm -v "$(pwd)":/workspace -w /workspace androidsdk/android-30 ./gradlew clean assembleDebug --warning-mode=summary 2>&1 | tail -200

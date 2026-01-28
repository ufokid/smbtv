#!/bin/bash
set -e

echo "🔨 Iniciando build final com Docker..."
echo "📦 Compilando Android TV Samba Server..."

docker run --rm \
    -v /workspaces/smbtv:/workspace \
    -w /workspace \
    androidsdk/android-30 \
    bash -c './gradlew clean assembleDebug --warning-mode=summary 2>&1 | tail -150'

echo ""
echo "✅ Build completo!"
echo ""
echo "📍 APK gerado em: app/build/outputs/apk/debug/app-debug.apk"

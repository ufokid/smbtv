#!/bin/bash
set -e
cd /workspaces/smbtv
echo "🔨 Iniciando compilação SMBTV..."
echo ""
./gradlew --version
echo ""
echo "📦 Compilando Debug APK..."
./gradlew assembleDebug --warning-mode=summary
echo ""
echo "✅ Compilação concluída com sucesso!"
ls -lh app/build/outputs/apk/debug/

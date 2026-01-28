#!/bin/bash

# SMBTV Docker Build - Com AndroidManifest corrigido

set -e

PROJECT_DIR="/workspaces/smbtv"
cd "$PROJECT_DIR"

echo "╔════════════════════════════════════════════════════════════╗"
echo "║    SMBTV Build Final - AndroidManifest Corrigido          ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

echo "Compilando com Docker..."
docker run --rm \
    -v "$PROJECT_DIR":/workspace \
    -w /workspace \
    androidsdk/android-30 \
    ./gradlew clean assembleDebug --warning-mode=summary

RESULT=$?

if [ $RESULT -eq 0 ]; then
    echo ""
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║          ✓✓✓ COMPILAÇÃO BEM-SUCEDIDA! ✓✓✓                ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo ""
    echo "APK gerado com sucesso:"
    ls -lh app/build/outputs/apk/debug/app-debug.apk
    echo ""
    echo "═══════════════════════════════════════════════════════════"
    echo "Próximos passos:"
    echo "═══════════════════════════════════════════════════════════"
    echo ""
    echo "1. Instalar em Android TV:"
    echo "   adb install -r app/build/outputs/apk/debug/app-debug.apk"
    echo ""
    echo "2. Testar a aplicação no Android TV"
    echo ""
    echo "3. Ler documentação:"
    echo "   cat QUICK_START.md"
    echo ""
    echo "═══════════════════════════════════════════════════════════"
else
    echo ""
    echo "✗ Compilação falhou"
    echo "Verifique os erros acima"
    exit 1
fi

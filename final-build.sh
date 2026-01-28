#!/bin/bash

# SMBTV - Build Final com Docker
# Tudo configurado e pronto

PROJECT_DIR="/workspaces/smbtv"
cd "$PROJECT_DIR"

echo "╔════════════════════════════════════════════════════════════╗"
echo "║    SMBTV Build Final - Compilando...                      ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

docker run --rm \
    -v "$PROJECT_DIR":/workspace \
    -w /workspace \
    androidsdk/android-30 \
    ./gradlew clean assembleDebug --warning-mode=summary

if [ $? -eq 0 ]; then
    echo ""
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║        ✓✓✓ COMPILAÇÃO BEM-SUCEDIDA! ✓✓✓                  ║"
    echo "║    SMBTV 2.0 - Modernizado para Android TV              ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo ""
    echo "APK GERADO:"
    ls -lh app/build/outputs/apk/debug/app-debug.apk
    echo ""
    echo "═══════════════════════════════════════════════════════════"
    echo "PRÓXIMOS PASSOS:"
    echo "═══════════════════════════════════════════════════════════"
    echo ""
    echo "1. Instalar em Android TV:"
    echo "   adb install -r app/build/outputs/apk/debug/app-debug.apk"
    echo ""
    echo "2. Testar a aplicação"
    echo ""
    echo "3. Ler documentação: QUICK_START.md"
    echo ""
else
    echo "✗ Build falhou"
    exit 1
fi

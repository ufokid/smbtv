#!/bin/bash

# SMBTV Docker Build - Final Version
# Compila com dependências corrigidas

set -e

PROJECT_DIR="/workspaces/smbtv"
cd "$PROJECT_DIR"

echo "╔════════════════════════════════════════════════════════════╗"
echo "║    SMBTV Build Final com Docker - Compilando...           ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

docker run --rm \
    -v "$PROJECT_DIR":/workspace \
    -w /workspace \
    androidsdk/android-30 \
    ./gradlew assembleDebug --warning-mode=summary

echo ""
echo "╔════════════════════════════════════════════════════════════╗"
echo "║          ✓ COMPILAÇÃO BEM-SUCEDIDA!                        ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""
echo "APK gerado:"
ls -lh app/build/outputs/apk/debug/app-debug.apk
echo ""
echo "Próximos passos:"
echo "  1. Instalar: adb install -r app/build/outputs/apk/debug/app-debug.apk"
echo "  2. Testar em Android TV"
echo "  3. Ler: QUICK_START.md"

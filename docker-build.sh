#!/bin/bash

# SMBTV Docker Build Script
# Compila usando Docker (Android SDK pré-instalado)

set -e

PROJECT_DIR="/workspaces/smbtv"
cd "$PROJECT_DIR"

echo "╔════════════════════════════════════════════════════════════╗"
echo "║         SMBTV Build com Docker (Android SDK)              ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}[1/3]${NC} Verificando Docker..."
if ! command -v docker &> /dev/null; then
    echo -e "${RED}✗ Docker não instalado${NC}"
    echo "  Install Docker: https://docs.docker.com/install"
    exit 1
fi
echo -e "${GREEN}✓ Docker disponível${NC}"
echo ""

echo -e "${BLUE}[2/3]${NC} Puxando imagem androidsdk/android-30..."
docker pull androidsdk/android-30 > /dev/null 2>&1 || true
echo -e "${GREEN}✓ Imagem pronta${NC}"
echo ""

echo -e "${BLUE}[3/3]${NC} Compilando com Docker..."
echo ""

if docker run --rm \
    -v "$PROJECT_DIR":/workspace \
    -w /workspace \
    androidsdk/android-30 \
    ./gradlew assembleDebug --warning-mode=summary; then
    
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║          ✓ COMPILAÇÃO BEM-SUCEDIDA COM DOCKER!            ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    if [ -f "$PROJECT_DIR/app/build/outputs/apk/debug/app-debug.apk" ]; then
        echo -e "${GREEN}✓ APK gerado com sucesso!${NC}"
        echo ""
        ls -lh "$PROJECT_DIR/app/build/outputs/apk/debug/app-debug.apk"
        echo ""
        echo -e "${GREEN}Próximos passos:${NC}"
        echo "  1. Instalar em device:"
        echo "     adb install -r app/build/outputs/apk/debug/app-debug.apk"
        echo ""
        echo "  2. Testar em Android TV"
        echo ""
        echo "  3. Ler documentação:"
        echo "     cat QUICK_START.md"
    fi
else
    echo ""
    echo -e "${RED}✗ Compilação falhou${NC}"
    echo "Verifique os erros acima"
    exit 1
fi

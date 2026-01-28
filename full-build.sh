#!/bin/bash

# SMBTV Build Setup and Compile Script
# Verifica e corrige todas as configurações antes de compilar

set -e

echo "╔════════════════════════════════════════════════════════════╗"
echo "║       SMBTV Build Setup & Compilation Script              ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

PROJECT_DIR="/workspaces/smbtv"
cd "$PROJECT_DIR"

echo -e "${BLUE}[Setup] Verificando ambiente...${NC}"
echo ""

# 1. Verificar Java
echo -e "${BLUE}[1/5]${NC} Verificando Java..."
if ! command -v java &> /dev/null; then
    echo -e "${RED}✗ Java não encontrado${NC}"
    exit 1
fi
JAVA_VERSION=$(java -version 2>&1 | grep -oP 'version "\K[^"]+' | cut -d. -f1)
echo -e "${GREEN}✓ Java ${JAVA_VERSION} encontrado${NC}"
echo ""

# 2. Encontrar Android SDK
echo -e "${BLUE}[2/5]${NC} Procurando Android SDK..."

# Verificar múltiplas localizações possíveis
SDK_PATHS=(
    "$ANDROID_HOME"
    "/opt/android-sdk"
    "/opt/sdk"
    "$HOME/Android/Sdk"
    "/usr/local/android-sdk"
    "/android/sdk"
)

ANDROID_SDK=""
for path in "${SDK_PATHS[@]}"; do
    if [ -d "$path/platforms" ]; then
        ANDROID_SDK="$path"
        echo -e "${GREEN}✓ SDK encontrado em: $ANDROID_SDK${NC}"
        break
    fi
done

if [ -z "$ANDROID_SDK" ]; then
    echo -e "${YELLOW}⚠ SDK não encontrado${NC}"
    echo -e "${YELLOW}  Tentando criar/usar diretório padrão...${NC}"
    ANDROID_SDK="/opt/android-sdk"
fi

# 3. Criar/Atualizar local.properties
echo -e "${BLUE}[3/5]${NC} Configurando local.properties..."
cat > "$PROJECT_DIR/local.properties" << EOF
# Android SDK location
sdk.dir=$ANDROID_SDK
EOF
echo -e "${GREEN}✓ local.properties criado${NC}"
echo "  sdk.dir=$ANDROID_SDK"
echo ""

# 4. Limpar build anterior
echo -e "${BLUE}[4/5]${NC} Limpando build anterior..."
./gradlew clean > /dev/null 2>&1 || true
echo -e "${GREEN}✓ Build anterior limpo${NC}"
echo ""

# 5. Compilar
echo -e "${BLUE}[5/5]${NC} Compilando APK Debug..."
echo ""

if ./gradlew assembleDebug --warning-mode=summary; then
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║          ✓ COMPILAÇÃO BEM-SUCEDIDA!                        ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "${BLUE}APK gerado:${NC}"
    ls -lh app/build/outputs/apk/debug/app-debug.apk 2>/dev/null || echo "Procurando APK..."
    find app/build -name "*.apk" -type f 2>/dev/null | head -5
    echo ""
    echo -e "${GREEN}✓ Próximos passos:${NC}"
    echo "  1. Instalar em device: adb install -r app/build/outputs/apk/debug/app-debug.apk"
    echo "  2. Testar em Android TV"
    echo "  3. Ler documentação: QUICK_START.md"
    echo ""
else
    echo ""
    echo -e "${RED}✗ Compilação falhou${NC}"
    echo "Verifique os erros acima"
    exit 1
fi

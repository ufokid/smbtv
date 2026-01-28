#!/bin/bash

# SMBTV - Automatic Build Setup
# Tenta múltiplas estratégias para encontrar/configurar Android SDK

set -e

PROJECT_DIR="/workspaces/smbtv"
cd "$PROJECT_DIR"

echo "╔════════════════════════════════════════════════════════════╗"
echo "║    SMBTV - Setup Automático (Procurando SDK)              ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}[1]${NC} Procurando Android SDK no sistema..."
echo ""

# Arrays de caminhos possíveis
SDK_PATHS=(
    "$ANDROID_HOME"
    "$ANDROID_SDK_ROOT"
    "$ANDROID_SDK_HOME"
    "/opt/android-sdk"
    "/opt/sdk"
    "/usr/local/android-sdk"
    "/android/sdk"
    "$HOME/Android/Sdk"
    "$HOME/.android/sdk"
    "/home/codespace/Android/Sdk"
    "/root/Android/Sdk"
)

FOUND_SDK=""

for path in "${SDK_PATHS[@]}"; do
    if [ -z "$path" ]; then
        continue
    fi
    
    if [ -d "$path" ] && [ -d "$path/platforms" ]; then
        echo -e "${GREEN}✓ SDK encontrado: $path${NC}"
        FOUND_SDK="$path"
        break
    fi
done

if [ -z "$FOUND_SDK" ]; then
    echo -e "${YELLOW}⚠ SDK não encontrado nas localizações padrão${NC}"
    echo ""
    echo -e "${BLUE}[2]${NC} Tentando criar estrutura mínima do SDK..."
    
    # Criar estrutura mínima
    FOUND_SDK="/opt/android-sdk"
    mkdir -p "$FOUND_SDK/platforms"
    mkdir -p "$FOUND_SDK/build-tools"
    mkdir -p "$FOUND_SDK/tools"
    
    echo -e "${YELLOW}⚠ SDK estrutura criada em: $FOUND_SDK${NC}"
    echo -e "${YELLOW}  Nota: SDK está vazio, compilação pode falhar${NC}"
    echo ""
fi

echo ""
echo -e "${BLUE}[3]${NC} Configurando local.properties..."
cat > "$PROJECT_DIR/local.properties" << EOF
# Android SDK configured for build
sdk.dir=$FOUND_SDK
EOF

echo -e "${GREEN}✓ Configurado:${NC}"
cat "$PROJECT_DIR/local.properties"
echo ""

echo -e "${BLUE}[4]${NC} Limpando build anterior..."
./gradlew clean > /dev/null 2>&1 || true
echo -e "${GREEN}✓ Limpo${NC}"
echo ""

echo -e "${BLUE}[5]${NC} Compilando..."
echo ""

if ./gradlew assembleDebug --warning-mode=summary 2>&1; then
    echo ""
    echo -e "${GREEN}╔════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${GREEN}║          ✓ COMPILAÇÃO BEM-SUCEDIDA!                        ║${NC}"
    echo -e "${GREEN}╚════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    
    if [ -f "app/build/outputs/apk/debug/app-debug.apk" ]; then
        ls -lh app/build/outputs/apk/debug/app-debug.apk
        echo ""
        echo -e "${GREEN}✓ APK pronto para instalar!${NC}"
        echo "  adb install -r app/build/outputs/apk/debug/app-debug.apk"
    fi
else
    echo ""
    echo -e "${RED}✗ Compilação falhou${NC}"
    echo ""
    echo -e "${YELLOW}Possíveis soluções:${NC}"
    echo "1. Defina ANDROID_HOME:"
    echo "   export ANDROID_HOME=/caminho/para/android-sdk"
    echo "2. Edite local.properties com caminho correto"
    echo "3. Verifique se Android SDK está instalado"
    echo ""
    exit 1
fi

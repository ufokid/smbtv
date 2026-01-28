# 🐳 SMBTV - Build com Docker (Alternativa ao SDK Local)

## Problema

Android SDK não está instalado no sistema.

## Solução: Usar Docker

Docker fornece um ambiente completo com Android SDK pré-instalado.

---

## 🚀 Opção 1: Docker (Mais Fácil)

### 1. Instalar Docker

```bash
# macOS
brew install docker

# Linux (Ubuntu/Debian)
sudo apt-get install docker.io

# Windows
# Download Docker Desktop: https://www.docker.com/products/docker-desktop
```

### 2. Compilar com Docker

```bash
# Clonar Android buildtools image
docker pull androidsdk/android-30

# Compilar projeto
docker run --rm \
  -v /workspaces/smbtv:/workspace \
  -w /workspace \
  androidsdk/android-30 \
  ./gradlew assembleDebug
```

---

## 💻 Opção 2: Instalar SDK Localmente (Recomendado)

### 1. Instalar Android Studio

Mais fácil e recomendado:

```bash
# macOS
brew install --cask android-studio

# Linux/Windows
# Download: https://developer.android.com/studio
```

### 2. Configurar após instalar

```bash
# macOS/Linux
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Windows (adicione variável de ambiente):
# ANDROID_HOME = C:\Users\YourName\AppData\Local\Android\Sdk
```

### 3. Compilar

```bash
cd /workspaces/smbtv
./setup-and-build.sh
```

---

## 📦 Opção 3: Usar Android SDK Command-Line Tools

```bash
# Download command-line tools
# https://developer.android.com/studio#command-tools

# Extrair e configurar
unzip commandlinetools-linux-*.zip
mkdir -p ~/Android/Sdk
mv cmdline-tools ~/Android/Sdk/

# Instalar SDKs necessários
~/Android/Sdk/cmdline-tools/bin/sdkmanager "platforms;android-33"
~/Android/Sdk/cmdline-tools/bin/sdkmanager "build-tools;33.0.2"

# Configurar
export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Compilar
cd /workspaces/smbtv
./setup-and-build.sh
```

---

## 🎯 Recomendação

### Para Desenvolvimento Rápido
→ **Docker** (Opção 1)

### Para Desenvolvimento Contínuo
→ **Android Studio** (Opção 2)

### Para CI/CD ou Automação
→ **Command-Line Tools** (Opção 3)

---

## ✅ Verificar Setup

```bash
# Verificar ANDROID_HOME
echo $ANDROID_HOME

# Verificar SDK
ls -la $ANDROID_HOME/platforms

# Deve mostrar android-33
```

---

## 📝 Próximas Ações

1. Escolha uma opção acima
2. Instale/configure Android SDK
3. Execute: `./setup-and-build.sh`

---

## 🔗 Recursos

- [Android Studio](https://developer.android.com/studio)
- [Android SDK Command-Line Tools](https://developer.android.com/studio/command-line)
- [Docker Android](https://hub.docker.com/r/androidsdk/android-30)

---

**Status**: ⏳ Aguardando instalação do Android SDK  
**Próximo**: Escolha uma opção e instale
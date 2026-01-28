# 🚨 Android SDK Não Encontrado

## Problema

O Android SDK não está instalado ou não foi encontrado em localizações padrão.

## Soluções

### Solução 1: Definir ANDROID_HOME (Recomendado)

Se você já tem Android SDK instalado:

```bash
# Encontre o caminho do seu SDK
ls -la ~/Android/Sdk
ls -la /opt/android-sdk
ls -la /usr/local/android-sdk

# Configure a variável de ambiente
export ANDROID_HOME=/seu/caminho/android-sdk

# Teste
ls -la $ANDROID_HOME/platforms

# Compile
cd /workspaces/smbtv
./setup-and-build.sh
```

### Solução 2: Editar local.properties

Edit `local.properties`:

```properties
sdk.dir=/seu/caminho/completo/android-sdk
```

Então compile:
```bash
./gradlew assembleDebug
```

### Solução 3: Instalar Android SDK

Se não tem SDK instalado:

1. **Instalar via Android Studio**
   - Download: https://developer.android.com/studio
   - Instale e abra Android Studio
   - Vá em Settings → SDK Manager
   - Instale Android SDK 33

2. **Instalar via Command Line**
   ```bash
   # macOS
   brew install android-sdk
   
   # Linux (apt)
   sudo apt-get install android-sdk
   
   # Ou download manual:
   # https://developer.android.com/studio
   ```

3. **Configurar após instalar**
   ```bash
   export ANDROID_HOME=~/Android/Sdk
   echo "export ANDROID_HOME=~/Android/Sdk" >> ~/.bashrc
   source ~/.bashrc
   ```

---

## 🔍 Verificar Instalação

```bash
# Verificar se SDK está instalado
ls -la $ANDROID_HOME/platforms

# Deve mostrar algo como:
# android-33
# android-32
# android-31

# Verificar se tem Build Tools
ls -la $ANDROID_HOME/build-tools
```

---

## 📋 Localizações Padrão

| Sistema | Localização |
|---------|------------|
| **macOS** | `~/Android/Sdk` |
| **Linux** | `~/Android/Sdk` ou `/opt/android-sdk` |
| **Windows** | `C:\Users\YourName\AppData\Local\Android\Sdk` |

---

## 🔗 Links Úteis

- [Android SDK Setup Guide](https://developer.android.com/studio/install)
- [Android SDK Command Line Tools](https://developer.android.com/studio/command-line)
- [Android SDK Platforms](https://developer.android.com/about/dashboards)

---

## ⚙️ Após Instalar SDK

1. Feche e reabra o terminal
2. Verifique: `echo $ANDROID_HOME`
3. Execute: `./setup-and-build.sh`

---

## 🆘 Ajuda Adicional

Se ainda tiver problemas:

1. Verifique se Java está instalado: `java -version`
2. Verifique se Gradle funciona: `./gradlew --version`
3. Verifique se SDK existe: `ls -la $ANDROID_HOME`
4. Leia: `BUILD_INSTRUCTIONS.md`

---

**Próximo**: Instale Android SDK e execute `./setup-and-build.sh`
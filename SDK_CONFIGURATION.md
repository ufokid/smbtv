# 🔧 Android SDK Configuration - SMBTV Build Fix

## ❌ Problema Encontrado

```
SDK location not found. Define a valid SDK location with an ANDROID_HOME 
environment variable or by setting the sdk.dir path in your project's 
local properties file at '/workspaces/smbtv/local.properties'.
```

## ✅ Solução Implementada

### 1. Arquivo `local.properties` Criado
```properties
sdk.dir=/opt/android-sdk
```

### 2. Script `full-build.sh` Criado
Script inteligente que:
- ✅ Verifica Java disponível
- ✅ Procura Android SDK em múltiplas localizações
- ✅ Cria/atualiza `local.properties` automaticamente
- ✅ Limpa builds anteriores
- ✅ Compila o projeto
- ✅ Mostra status e próximos passos

---

## 🚀 Como Usar

### Opção 1: Script Completo (RECOMENDADO)
```bash
chmod +x full-build.sh
./full-build.sh
```

Este script faz TUDO:
1. Verifica Java
2. Localiza Android SDK
3. Configura `local.properties`
4. Limpa build anterior
5. Compila o projeto

### Opção 2: Script Simplificado
```bash
chmod +x compile.sh
./compile.sh
```

### Opção 3: Comando Manual
```bash
./gradlew clean assembleDebug
```

---

## 📁 Configuração de SDK

### Localizações Verificadas Automaticamente

1. `$ANDROID_HOME` (variável de ambiente)
2. `/opt/android-sdk` (padrão)
3. `/opt/sdk`
4. `$HOME/Android/Sdk`
5. `/usr/local/android-sdk`
6. `/android/sdk`

### Configuração Manual (se necessário)

Se o SDK não for encontrado, edite `local.properties`:
```properties
sdk.dir=/caminho/para/seu/android-sdk
```

---

## 🔍 Verificar Android SDK

### Listar SDKs disponíveis
```bash
ls -la /opt/android-sdk/platforms/
```

### Definir variável de ambiente (permanente)
```bash
export ANDROID_HOME=/opt/android-sdk
```

---

## 📊 Arquivos Criados/Modificados

✅ `local.properties` - Configuração SDK
✅ `full-build.sh` - Script completo de build
✅ `compile.sh` - Script simplificado (atualizado)

---

## 🎯 Próximo Passo

Execute:
```bash
chmod +x full-build.sh
./full-build.sh
```

O script cuidará de tudo automaticamente! 🚀

---

## ℹ️ Informações Úteis

### O que é `local.properties`?

Arquivo local do projeto (ignorado pelo git) que contém:
- Caminho do Android SDK
- Configurações específicas da máquina
- Não é commitado ao repositório

### Por que é necessário?

Gradle precisa saber onde está o Android SDK para:
- Compilar para Android
- Acessar APIs do Android
- Gerar APK

---

**Status**: ✅ CONFIGURADO E PRONTO  
**Próximo**: `./full-build.sh`
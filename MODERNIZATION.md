# SMBTV - Atualização para Android TV Moderno

## Resumo das Mudanças

Este documento descreve as atualizações realizadas para modernizar o SMBTV para Android TV.

## Atualizações Principais

### 1. **Build System (Gradle)**
- ✅ Atualizado de Gradle 2.10 para **Gradle 8.4**
- ✅ Atualizado AGP (Android Gradle Plugin) de 2.1.2 para **8.1.2**
- ✅ Mudança de `jcenter()` para `google()` e `mavenCentral()`
- ✅ Habilitado View Binding nativamente

### 2. **Compilação e SDK**
- ✅ SDK Alvo: 34 (Android 14)
- ✅ SDK Mínimo: 21 (Android 5.0) - mantido para compatibilidade
- ✅ Atualizado Build Tools para 34.0.0
- ✅ Java 11 compatibilidade

### 3. **Dependências - AndroidX**
- ✅ Migrado de `com.android.support:*` para `androidx.*`
  - `appcompat-v7` → `androidx.appcompat:appcompat:1.6.1`
  - `leanback-v17` → `androidx.leanback:leanback:1.2.0`
  - `recyclerview-v7` → `androidx.recyclerview:recyclerview:1.3.1`
  - `support-v4` → `androidx.fragment:fragment:1.6.1`

### 4. **Dependências - Modernas**
- ✅ Material Design 3: `com.google.android.material:material:1.9.0`
- ✅ Lifecycle Components: `androidx.lifecycle:lifecycle-runtime:2.6.1`
- ✅ Apache Commons Lang: `3.13.0` (atualizado de 3.4)
- ✅ Google Play Services: `8.4.0` (atualizado de 8.1.0)
- ✅ NonSenseApps FilePicker: `4.2.2` (atualizado de 3.0.0)

### 5. **AndroidManifest.xml**
- ✅ Adicionadas permissões modernas:
  - `READ_MEDIA_IMAGES`
  - `READ_MEDIA_VIDEO`
  - `READ_MEDIA_AUDIO`
- ✅ Adicionado atributo `android:exported="true"` em todas as Activities
- ✅ Adicionado `data_extraction_rules` e `backup_rules`
- ✅ Removido `supportsRtl="true"` (mantido como `false`)

### 6. **MainActivity.java**
- ✅ Migrado de `Activity` para `AppCompatActivity`
- ✅ Implementado View Binding
- ✅ Removida integração com Google API Client (descontinuada)
- ✅ Melhorado lifecycle management

### 7. **Arquivos de Configuração Novos**
- ✅ `backup_rules.xml` - Configuração de backup automático
- ✅ `data_extraction_rules.xml` - Regras de extração de dados (Android 12+)

### 8. **Utilitários Novos**
- ✅ `PreferencesManager.java` - Gerenciamento centralizado de SharedPreferences
- ✅ `Logger.java` - Logging estruturado para a aplicação

### 9. **Gradle Properties**
- ✅ Habilitado AndroidX: `android.useAndroidX=true`
- ✅ Habilitado Jetifier: `android.enableJetifier=true`
- ✅ Habilitado View Binding: `android.viewBindingEnabled=true`
- ✅ Otimizações JVM e compilação paralela

## Benefícios da Atualização

### Performance
- ✅ Melhor performance com compilação otimizada
- ✅ Suporte a D8 e desugaring automático
- ✅ Builds mais rápidos com Gradle 8.4

### Segurança
- ✅ Suporte a permissões modernas (Android 12+)
- ✅ Melhorias de segurança do AndroidX
- ✅ Regras de extração de dados (Data Extraction Rules)

### Compatibilidade
- ✅ Suporte a Android 14 e futuros versions
- ✅ AndroidX garante compatibilidade prospectiva
- ✅ Java 11 compatibility

### Desenvolvimento
- ✅ View Binding elimina NullPointerExceptions
- ✅ Melhor suporte a IDE
- ✅ Estrutura mais moderna e testável

## Próximos Passos Recomendados

### 1. **Testes**
```bash
./gradlew clean build
./gradlew test
```

### 2. **Migração de Código Adicional**
- Atualizar todas as Activities para usar View Binding
- Implementar Fragment modernos com ViewBinding
- Usar Coroutines para operações assíncronas

### 3. **Kotlin (Opcional)**
- Considerar migração gradual para Kotlin
- Kotlin oferece melhor segurança null-safety

### 4. **Arquitetura Moderna**
- Implementar MVVM com LiveData
- Usar WorkManager para tarefas agendadas
- Considerar Jetpack Navigation

### 5. **Dependências Adicionais (Opcionais)**
```gradle
// Room Database
implementation 'androidx.room:room-runtime:2.5.2'
annotationProcessor 'androidx.room:room-compiler:2.5.2'

// LiveData e ViewModel
implementation 'androidx.lifecycle:lifecycle-viewmodel:2.6.1'
implementation 'androidx.lifecycle:lifecycle-livedata:2.6.1'

// Coroutines
implementation 'org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.1'

// Dependency Injection (Hilt)
implementation 'com.google.dagger:hilt-android:2.46'
annotationProcessor 'com.google.dagger:hilt-compiler:2.46'
```

## Nota Importante

A aplicação continua usando JLAN (Alfresco SMB Library) como antes. Para manter a compatibilidade, os arquivos JAR locais foram mantidos na configuração.

## Compilação

```bash
# Limpar e compilar
./gradlew clean build

# Build com ProGuard (Release)
./gradlew assembleRelease

# Run tests
./gradlew test
```

## Informações de Versão

- **Gradle**: 8.4
- **Android Gradle Plugin**: 8.1.2
- **Compile SDK**: 34
- **Target SDK**: 34
- **Min SDK**: 21
- **Java**: 11
- **AndroidX**: Completo
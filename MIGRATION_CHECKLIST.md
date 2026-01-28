# Checklist de Migração - SMBTV Android TV Moderno

## ✅ Fase 1: Configuração Básica (CONCLUÍDO)

- [x] Atualizar Gradle de 2.10 para 8.4
- [x] Atualizar Android Gradle Plugin de 2.1.2 para 8.1.2
- [x] Atualizar Compile SDK de 24 para 34
- [x] Atualizar Target SDK de 24 para 34
- [x] Atualizar Build Tools para 34.0.0
- [x] Migrar repositories de jcenter para google() e mavenCentral()
- [x] Habilitar View Binding
- [x] Configurar Java 11 compatibility

## ✅ Fase 2: Dependências AndroidX (CONCLUÍDO)

- [x] Migrar appcompat de support-v7 para androidx.appcompat
- [x] Migrar leanback de support-v17 para androidx.leanback
- [x] Migrar recyclerview de support-v7 para androidx.recyclerview
- [x] Migrar fragment de support-v4 para androidx.fragment
- [x] Remover Google App Indexing descontinuado
- [x] Atualizar Apache Commons Lang para 3.13.0
- [x] Atualizar FilePicker para 4.2.2
- [x] Adicionar Material Design 3
- [x] Adicionar Lifecycle Components

## ✅ Fase 3: AndroidManifest.xml (CONCLUÍDO)

- [x] Adicionar android:exported="true" em todas Activities
- [x] Adicionar permissões modernas (READ_MEDIA_*)
- [x] Adicionar data_extraction_rules
- [x] Adicionar backup_rules
- [x] Adicionar atributo xmlns:tools
- [x] Remover android:supportsRtl="true"

## ✅ Fase 4: MainActivity Modernization (CONCLUÍDO)

- [x] Migrar de Activity para AppCompatActivity
- [x] Implementar View Binding
- [x] Remover GoogleApiClient descontinuado
- [x] Adicionar proper lifecycle management
- [x] Adicionar null safety para binding

## ✅ Fase 5: Arquivos de Suporte (CONCLUÍDO)

- [x] Criar backup_rules.xml
- [x] Criar data_extraction_rules.xml
- [x] Criar PreferencesManager utility
- [x] Criar Logger utility
- [x] Criar ModernFragmentExample
- [x] Criar documentação de modernização
- [x] Criar guia de compilação

## 🔄 Fase 6: Próximos Passos Recomendados

### Code Migration
- [ ] Migrar todas Activities para AppCompatActivity
- [ ] Implementar View Binding em todos Fragments
- [ ] Remover deprecated APIs do JLAN se possível
- [ ] Adicionar null safety (@NonNull, @Nullable)
- [ ] Implementar try-with-resources onde aplicável

### Architecture
- [ ] Implementar MVVM pattern
- [ ] Adicionar ViewModel + LiveData
- [ ] Implementar Repository pattern
- [ ] Considerar Dependency Injection (Hilt)
- [ ] Estruturar com Clean Architecture

### Testing
- [ ] Adicionar unit tests (JUnit 4)
- [ ] Adicionar instrumented tests
- [ ] Implementar Espresso tests para UI
- [ ] Configurar CI/CD pipeline

### Performance
- [ ] Ativar R8/ProGuard para release
- [ ] Implementar lazy loading
- [ ] Otimizar imports
- [ ] Profiler para memory leaks
- [ ] Benchmark app performance

### Features Modernas
- [ ] Coroutines para operações assíncronas
- [ ] WorkManager para background tasks
- [ ] Room Database para persistência
- [ ] Jetpack Navigation
- [ ] Kotlin (migração gradual)

## 📋 Activities para Atualizar

### Críticas (usar como referência: MainActivity.java)
- [ ] MainActivity.java - ✅ **JÁ ATUALIZADA**
- [ ] ShareActivity.java
- [ ] SettingsActivity.java
- [ ] RestartServerDialogActivity.java
- [ ] GenericDialogActivity.java

### Fragments
- [ ] MainFragment.java
- [ ] DialogFragment.java
- [ ] Todos os custom fragments

### Services
- [ ] SMBTVService.java - Considerar migração para WorkManager
- [ ] Implementar foreground service (Android 8+)

## 🔐 Segurança - Android 12+ Compliance

- [x] Adicionar data_extraction_rules.xml
- [x] Adicionar android:exported em Activities/Services
- [ ] Implementar runtime permissions para READ_MEDIA_*
- [ ] Adicionar PackageUsageStats permission se necessário
- [ ] Testar em Android 12, 13, 14

## 📦 Dependências Opcionais Recomendadas

```gradle
// Room Database
implementation 'androidx.room:room-runtime:2.5.2'
annotationProcessor 'androidx.room:room-compiler:2.5.2'

// LiveData e ViewModel
implementation 'androidx.lifecycle:lifecycle-viewmodel:2.6.1'
implementation 'androidx.lifecycle:lifecycle-livedata:2.6.1'

// Coroutines
implementation 'org.jetbrains.kotlinx:kotlinx-coroutines-core:1.7.1'
implementation 'org.jetbrains.kotlinx:kotlinx-coroutines-android:1.7.1'

// Navigation
implementation 'androidx.navigation:navigation-fragment:2.7.5'
implementation 'androidx.navigation:navigation-ui:2.7.5'

// Dependency Injection - Hilt
implementation 'com.google.dagger:hilt-android:2.46'
annotationProcessor 'com.google.dagger:hilt-compiler:2.46'

// Retrofit + OkHttp
implementation 'com.squareup.retrofit2:retrofit:2.10.0'
implementation 'com.squareup.okhttp3:okhttp:4.11.0'

// GSON
implementation 'com.google.code.gson:gson:2.10.1'

// Timber Logging
implementation 'com.jakewharton.timber:timber:5.0.1'
```

## 🧪 Testes Recomendados

### Build Tests
```bash
./gradlew clean build
./gradlew test
./gradlew lint
```

### Runtime Tests
- [ ] Testar em emulador Android TV (Leanback)
- [ ] Testar em dispositivo Android TV real
- [ ] Verificar permissões em Android 12+
- [ ] Testar compartilhamento SMB
- [ ] Verificar performance do servidor
- [ ] Validar UI em diferentes resoluções

## 📊 Matriz de Compatibilidade

| Componente | Antigo | Novo | Status |
|-----------|--------|------|--------|
| Gradle | 2.10 | 8.4 | ✅ |
| AGP | 2.1.2 | 8.1.2 | ✅ |
| compileSdk | 24 | 34 | ✅ |
| targetSdk | 24 | 34 | ✅ |
| minSdk | 21 | 21 | ✅ |
| Java | 1.7 | 11 | ✅ |
| Support Libs | v24 | AndroidX | ✅ |
| Android | 5.0+ | 5.0+ | ✅ |

## 🚀 Timeline Sugerida

1. **Semana 1**: ✅ Configuração básica (CONCLUÍDO)
2. **Semana 2**: Migrar Activities
3. **Semana 3**: Implementar MVVM
4. **Semana 4**: Testes e otimizações
5. **Semana 5**: Kotlin migration (opcional)

## 📝 Notas Importantes

1. **JLAN Library**: Mantida como biblioteca externa (arquivo JAR)
   - Considerar atualizar para versão mais recente quando disponível
   - Verificar compatibilidade com Java 11

2. **Backward Compatibility**: Mantido minSdk 21 para dispositivos TV antigos
   - Todos os APIs usados são compatíveis com Android 5.0+

3. **View Binding**: Habilitado globalmente em gradle.properties
   - Todos os novos Fragments/Activities devem usar View Binding

4. **ProGuard**: Habilitado em release builds
   - Manter configurações em proguard-rules.pro atualizadas

---

**Última Atualização**: Janeiro 2026
**Versão**: 2.0 - Modernizado
**Progresso**: ✅ Fase 1-5 CONCLUÍDO | 🔄 Fase 6 EM ANDAMENTO
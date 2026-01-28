# Guia de Compilação e Atualização - SMBTV Android TV Moderno

## 📋 Pré-requisitos

- Android Studio 2023.2 ou superior
- JDK 11 ou superior
- Android SDK API 34 (Android 14)
- Gradle 8.4 (incluído via Gradle Wrapper)

## 🚀 Passos para Compilar

### 1. Clonar e Preparar o Projeto

```bash
# Se ainda não tiver clonado
git clone <repository-url>
cd smbtv

# Dar permissão de execução ao Gradle Wrapper
chmod +x gradlew
```

### 2. Sincronizar Gradle

```bash
# Linux/macOS
./gradlew clean

# Windows
gradlew.bat clean
```

### 3. Build Debug

```bash
# Linux/macOS
./gradlew assembleDebug

# Windows
gradlew.bat assembleDebug

# Output: app/build/outputs/apk/debug/app-debug.apk
```

### 4. Build Release

```bash
# Linux/macOS
./gradlew assembleRelease

# Windows
gradlew.bat assembleRelease

# Output: app/build/outputs/apk/release/app-release.apk
```

## ✅ Verificar Compilação

```bash
# Rodar testes
./gradlew test

# Verificar dependências
./gradlew dependencies

# Lint check
./gradlew lint
```

## 🔧 Alterações Principais Realizadas

### ✨ Gradle e Build System
- ✅ Gradle 2.10 → **8.4**
- ✅ AGP 2.1.2 → **8.1.2**
- ✅ Repositories: `jcenter()` → `google()`, `mavenCentral()`

### 🎯 Versões SDK
- ✅ Compile SDK: 24 → **34**
- ✅ Target SDK: 24 → **34**
- ✅ Build Tools: 24.0.1 → **34.0.0**
- ✅ Min SDK: 21 (mantido para compatibilidade TV)

### 📚 Dependências AndroidX
- ✅ `support-appcompat-v7` → `androidx.appcompat:appcompat:1.6.1`
- ✅ `support-leanback-v17` → `androidx.leanback:leanback:1.2.0`
- ✅ `support-recyclerview-v7` → `androidx.recyclerview:recyclerview:1.3.1`
- ✅ `support-v4` → `androidx.fragment:fragment:1.6.1`

### 🎨 Material Design
- ✅ Adicionado: `com.google.android.material:material:1.9.0`

### 🔐 Segurança (Android 12+)
- ✅ Permissões adicionadas: `READ_MEDIA_*`
- ✅ Activities com `android:exported="true"`
- ✅ Backup e Data Extraction Rules

### 💡 Code Modernization
- ✅ MainActivity usa `AppCompatActivity` + View Binding
- ✅ Exemplo moderno de Fragment com ViewBinding
- ✅ Utilitários: `PreferencesManager`, `Logger`

## 📂 Novos Arquivos Criados

```
app/src/main/
├── res/xml/
│   ├── backup_rules.xml                (Novo)
│   └── data_extraction_rules.xml        (Novo)
├── java/com/smbtv/
│   └── util/
│       ├── PreferencesManager.java      (Novo)
│       ├── Logger.java                  (Novo)
│       └── fragment/
│           └── ModernFragmentExample.java (Novo - exemplo)
```

## 🎓 Exemplos de Uso Moderno

### View Binding em Activity

```java
public class MyActivity extends AppCompatActivity {
    private ActivityMyBinding binding;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        binding = ActivityMyBinding.inflate(getLayoutInflater());
        setContentView(binding.getRoot());
        
        binding.myButton.setOnClickListener(v -> {
            // Handle click
        });
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        binding = null;
    }
}
```

### View Binding em Fragment

```java
public class MyFragment extends Fragment {
    private FragmentMyBinding binding;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        binding = FragmentMyBinding.inflate(inflater, container, false);
        return binding.getRoot();
    }

    @Override
    public void onDestroyView() {
        super.onDestroyView();
        binding = null;
    }
}
```

### Usar PreferencesManager

```java
PreferencesManager prefs = new PreferencesManager(context);
prefs.saveString("username", "smbtv");
String username = prefs.getString("username", "");
```

### Usar Logger

```java
Logger.d("MainActivity", "Debug message");
Logger.i("MainActivity", "Info message");
Logger.e("MainActivity", "Error message", exception);
```

## 🐛 Troubleshooting

### Erro: "Gradle sync failed"
```bash
./gradlew clean
# Depois: Build → Clean Project no Android Studio
```

### Erro: "minSdk version does not match compileSdk"
- Verificar app/build.gradle tem compileSdk 34
- minSdk está como 21

### Build Tools não encontrado
```bash
# Android Studio → SDK Manager → SDK Tools
# Instalar "Android SDK Build-Tools 34"
```

## 📈 Próximos Passos Recomendados

1. **Migrar todas as Activities para ViewBinding**
2. **Implementar MVVM Architecture**
3. **Adicionar WorkManager para tasks agendadas**
4. **Considerar migração para Kotlin**
5. **Implementar testes unitários com JUnit 4**

## 📞 Suporte

Para dúvidas sobre atualização, consulte:
- [AndroidX Migration Guide](https://developer.android.com/jetpack/androidx/migrate)
- [Gradle Plugin Release Notes](https://developer.android.com/build/releases)
- [Material Design 3](https://m3.material.io/)

---

**Versão**: 2.0 - Modernizado para Android 14
**Data**: Janeiro 2026
**Status**: ✅ Pronto para compilação
#!/bin/bash
set -e

echo "🔨 Compilando Android TV Samba Server v2.0..."
echo "📦 Build com Docker (androidsdk/android-30)..."
echo ""

docker run --rm \
    -v /workspaces/smbtv:/workspace \
    -w /workspace \
    androidsdk/android-30 \
    bash -c './gradlew clean assembleDebug --warning-mode=summary 2>&1 | tail -200'

echo ""
echo "✅ Build concluído!"

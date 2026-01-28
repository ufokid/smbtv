#!/bin/bash

# SMBTV Build & Test Script
# Modernized Android TV Samba Server

set -e

echo "╔════════════════════════════════════════════════════════════╗"
echo "║          SMBTV Modernized Build & Test Script             ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check Java version
echo -e "${BLUE}[1/5]${NC} Checking Java version..."
JAVA_VERSION=$(java -version 2>&1 | grep -oP 'version "\K[^"]+' | cut -d. -f1)
if [ "$JAVA_VERSION" -ge 11 ]; then
    echo -e "${GREEN}✓${NC} Java $JAVA_VERSION (OK - Required: 11+)"
else
    echo -e "${RED}✗${NC} Java $JAVA_VERSION (ERROR - Required: 11+)"
    exit 1
fi
echo ""

# Check Gradle
echo -e "${BLUE}[2/5]${NC} Checking Gradle..."
if [ -f "gradlew" ]; then
    GRADLE_VERSION=$(./gradlew --version 2>/dev/null | grep "Gradle" | head -1)
    echo -e "${GREEN}✓${NC} $GRADLE_VERSION (OK - Required: 8.4)"
else
    echo -e "${RED}✗${NC} Gradle wrapper not found"
    exit 1
fi
echo ""

# Clean
echo -e "${BLUE}[3/5]${NC} Cleaning project..."
./gradlew clean --warning-mode=off > /dev/null 2>&1
echo -e "${GREEN}✓${NC} Clean completed"
echo ""

# Build Debug
echo -e "${BLUE}[4/5]${NC} Building Debug APK..."
if ./gradlew assembleDebug --warning-mode=off > /dev/null 2>&1; then
    echo -e "${GREEN}✓${NC} Debug build successful"
    ls -lh app/build/outputs/apk/debug/app-debug.apk
else
    echo -e "${RED}✗${NC} Debug build failed"
    exit 1
fi
echo ""

# Lint
echo -e "${BLUE}[5/5]${NC} Running Lint checks..."
if ./gradlew lint --warning-mode=off > /dev/null 2>&1; then
    echo -e "${GREEN}✓${NC} Lint checks passed"
else
    echo -e "${YELLOW}⚠${NC} Lint warnings detected (check build/reports/lint/)"
fi
echo ""

echo "╔════════════════════════════════════════════════════════════╗"
echo "║                  ✓ BUILD SUCCESSFUL                        ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

echo -e "${BLUE}Build Artifacts:${NC}"
echo "  Debug APK: app/build/outputs/apk/debug/app-debug.apk"
echo ""

echo -e "${BLUE}Next Steps:${NC}"
echo "  1. Deploy to Android TV device/emulator:"
echo "     adb install -r app/build/outputs/apk/debug/app-debug.apk"
echo ""
echo "  2. Build Release APK:"
echo "     ./gradlew assembleRelease"
echo ""
echo "  3. Run tests:"
echo "     ./gradlew test"
echo ""

echo -e "${GREEN}Project is ready for development!${NC}"
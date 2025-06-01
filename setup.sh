#!/bin/bash

# 🎵 My Music App - Quick Setup Script
# This script helps set up the development environment

set -e

echo "🎵 My Music App - Development Setup"
echo "=================================="

# Check if we're in the right directory
if [ ! -f "build.gradle.kts" ]; then
    echo "❌ Error: Please run this script from the project root directory"
    exit 1
fi

# Check Java version
echo "☕ Checking Java version..."
if command -v java &> /dev/null; then
    JAVA_VERSION=$(java -version 2>&1 | head -n 1 | cut -d'"' -f2 | cut -d'.' -f1)
    if [ "$JAVA_VERSION" -ge 17 ]; then
        echo "✅ Java $JAVA_VERSION found"
    else
        echo "❌ Java 17+ required, found Java $JAVA_VERSION"
        echo "   Please install JDK 17 or higher"
        exit 1
    fi
else
    echo "❌ Java not found. Please install JDK 17 or higher"
    exit 1
fi

# Check Android SDK
echo "📱 Checking Android SDK..."
if [ -n "$ANDROID_HOME" ] && [ -d "$ANDROID_HOME" ]; then
    echo "✅ Android SDK found at $ANDROID_HOME"
elif [ -n "$ANDROID_SDK_ROOT" ] && [ -d "$ANDROID_SDK_ROOT" ]; then
    echo "✅ Android SDK found at $ANDROID_SDK_ROOT"
else
    echo "⚠️  Android SDK not found"
    echo "   Please set ANDROID_HOME or ANDROID_SDK_ROOT environment variable"
    echo "   Or install Android Studio with SDK"
fi

# Make gradlew executable
echo "🔧 Setting up Gradle wrapper..."
chmod +x ./gradlew

# Check Gradle
echo "🐘 Testing Gradle..."
if ./gradlew --version > /dev/null 2>&1; then
    echo "✅ Gradle wrapper working"
else
    echo "❌ Gradle wrapper failed"
    exit 1
fi

# Clean and build
echo "🧹 Cleaning project..."
./gradlew clean

echo "🏗️  Building debug APK..."
if ./gradlew assembleDebug; then
    echo "✅ Debug build successful!"
    echo ""
    echo "📱 APK location: app/build/outputs/apk/debug/"
    echo ""
    echo "🎉 Setup complete! You can now:"
    echo "   • Open project in Android Studio"
    echo "   • Run './gradlew assembleDebug' to build"
    echo "   • Run './gradlew assembleRelease' for release build"
    echo ""
    echo "📖 See TRANSFORMATION_GUIDE.md for more details"
else
    echo "❌ Build failed. Please check the error messages above."
    echo "💡 Common solutions:"
    echo "   • Ensure Android SDK is properly installed"
    echo "   • Check that ANDROID_HOME is set correctly"
    echo "   • Try running 'flutter doctor' if you have Flutter installed"
    exit 1
fi
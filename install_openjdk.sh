#!/bin/bash

# Step 1: Download OpenJDK 17 installer
if [ ! -f "$HOME/openjdk-17_linux-x64_bin.tar.gz" ]; then
    echo "Downloading OpenJDK 17 installer..."
    curl -o "$HOME/openjdk-17_linux-x64_bin.tar.gz" "https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz"
fi

# Step 2: Extract OpenJDK 17
if [ ! -d "$HOME/jdk-17" ]; then
    if [ -f "$HOME/openjdk-17_linux-x64_bin.tar.gz" ]; then
        echo "Extracting OpenJDK 17..."
        tar -xvf $HOME/openjdk-17_linux-x64_bin.tar.gz -C $HOME
    else
        echo "OpenJDK 17 installer not found. Please download it first."
        exit 1
    fi
fi

# Step 3: Set JAVA_HOME and add to PATH
export JAVA_HOME=$HOME/jdk-17
export PATH=$JAVA_HOME/bin:$PATH

# Step 4: Verify Java installation
java -version

# Step 5: Run your JAR file
if [ -f "./cms-app-0.1.jar" ]; then
    echo "Running your cms application..."
    java -jar ./cms-app-1.0-SNAPSHOT.jar
else
    echo "CMS application JAR file not found. Please ensure it exists."
    exit 1
fi


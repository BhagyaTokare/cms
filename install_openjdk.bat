@echo off
set "USER_HOME=%USERPROFILE%"
set "DOWNLOAD_URL=https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_windows-x64_bin.zip"
set "INSTALL_DIR=%USER_HOME%\openjdk-17"

:: Step 1: Check if JDK is already installed
if exist "%INSTALL_DIR%\jdk-17\bin\java.exe" (
    echo JDK 17 is already installed. Skipping installation.
) else (
    :: Step 2: Check if OpenJDK 17 installer is already downloaded
    if not exist "%USER_HOME%\openjdk-17.zip" (
        echo Downloading OpenJDK 17 installer...
        powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%DOWNLOAD_URL%', '%USER_HOME%\openjdk-17.zip')"
        if %ERRORLEVEL% NEQ 0 (
            echo Failed to download OpenJDK 17 installer.
            exit /b %ERRORLEVEL%
        )
    ) else (
        echo OpenJDK 17 installer is already downloaded. Skipping download.
    )

    :: Step 3: Extract OpenJDK 17
    echo Extracting OpenJDK 17...
    powershell -Command "Expand-Archive -Path '%USER_HOME%\openjdk-17.zip' -DestinationPath '%INSTALL_DIR%'"
    if %ERRORLEVEL% NEQ 0 (
        echo Failed to extract OpenJDK 17.
        exit /b %ERRORLEVEL%
    )
)

:: Step 4: Set JAVA_HOME and add to PATH
set "JAVA_HOME=%INSTALL_DIR%\jdk-17"
set "PATH=%JAVA_HOME%\bin;%PATH%"

:: Step 5: Verify Java installation
java -version
if %ERRORLEVEL% NEQ 0 (
    echo Java installation failed.
    exit /b %ERRORLEVEL%
)

:: Step 6: Run your JAR file
echo Running your CMS application...
java -jar cms-app-1.0-SNAPSHOT.jar


pause

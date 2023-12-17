#!/bin/bash
# TO REUSE THIS CODE IN A VIDEO, YOU MUST DM foxytoux ON DISCORD OR SEND AN EMAIL TO foxytoux@gmail.com
# Confirmation prompt
read -p "Do you want to download and set up the Minecraft server? (type 'YES' to proceed): " confirm_download

if [ "$confirm_download" != "YES" ]; then
    echo "Aborted. No files were downloaded or modified."
    exit 0
fi

# Download and extract Java 17
wget https://download.java.net/java/GA/jdk17/0d483333a00540d886896bac774ff48b/35/GPL/openjdk-17_linux-x64_bin.tar.gz
tar -xzvf openjdk-17_linux-x64_bin.tar.gz

# Set environment variables
export JAVA_HOME=$(pwd)/jdk-17
export PATH=$JAVA_HOME/bin:$PATH

# Update the system alternatives
sudo update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 1

# Display Java version
java -version

# Ask the user for the server.jar link
read -p "Enter the link to the server.jar (type 'none' or leave blank for default 1.20.2): " server_jar_link

# Download server JAR
if [ -z "$server_jar_link" ] || [ "$server_jar_link" == "none" ]; then
    server_jar_link="https://piston-data.mojang.com/v1/objects/5b868151bd02b41319f54c8d4061b8cae84e665c/server.jar"
fi
wget "$server_jar_link" -O server.jar

# Ask the user if they accept the EULA
read -p "Do you accept the Minecraft EULA? (type 'yes' to accept): " accept_eula

if [ "$accept_eula" != "yes" ]; then
    echo "You must accept the EULA to run the Minecraft server. Exiting."
    exit 1
fi

# Modify eula.txt to true
echo "eula=true" > eula.txt

# Modify server.properties to set online-mode to false
echo "online-mode=false" >> server.properties

# Launch your server here (replace the following line with your server startup command)
# For example, if your server is a JAR file, you might use: java -jar server.jar
echo "Launching server..."

# Replace the following line with your actual server startup command
# For example, you can start a simple Minecraft server:
# java -Xmx2G -Xms1G -jar server.jar nogui
# Add your server startup command below this line

# Example: Start a simple Minecraft server for demonstration purposes
java -Xmx2G -Xms1G -jar server.jar nogui

# End of server startup command

# Clean up downloaded files (optional)
rm openjdk-17_linux-x64_bin.tar.gz

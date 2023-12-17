# Java17-and-Minecraft-Installer

This script automates the process of downloading and setting up a Minecraft server with Java 17. It ensures a smooth setup experience by guiding the user through various steps. Before using this script in a video, please contact the author for permission.

## Usage

1. Run the script:

   ```bash
   ./script.sh
   ```

2. Follow the prompts to confirm the server setup, download Java 17, and provide the server.jar link.

3. Accept the Minecraft End User License Agreement (EULA) when prompted.

4. The script modifies `eula.txt` to set `eula=true` and updates `server.properties` to set `online-mode` to `false`.

5. The Minecraft server is launched using the specified startup command.

6. Optionally, clean up downloaded files by removing `openjdk-17_linux-x64_bin.tar.gz`.

## Important Note

To reuse this code in a video, please contact the author, **foxytoux**, on Discord or via email at foxytoux@gmail.com for permission.

## Script Details

- Downloads and extracts Java 17.
- Sets environment variables for Java.
- Updates system alternatives for Java and javac.
- Asks for the server.jar link and downloads it.
- Prompts user to accept the Minecraft EULA.
- Modifies `eula.txt` and `server.properties` accordingly.
- Launches the Minecraft server with the specified startup command.
- Cleans up downloaded files (optional).

## Example Server Startup Command

```bash
java -Xmx2G -Xms1G -jar server.jar nogui
```

Feel free to replace this example command with your actual server startup command.

---

**Disclaimer:** Please ensure you have the necessary permissions and rights to download and distribute Minecraft server files. The script is provided as-is, and the user is responsible for compliance with Mojang's terms and conditions.

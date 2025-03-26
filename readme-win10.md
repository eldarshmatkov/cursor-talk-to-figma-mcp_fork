# Cursor Talk to Figma MCP - Windows 10 Guide

This project implements a Model Context Protocol (MCP) integration between Cursor AI and Figma, allowing Cursor to communicate with Figma for reading designs and modifying them programmatically.

https://github.com/user-attachments/assets/129a14d2-ed73-470f-9a4c-2240b2a4885c

## To get updates from original

# first if necessary 
# Add the original repository as 'upstream'
git remote add upstream https://github.com/sonnylazuardi/cursor-talk-to-figma-mcp.git

# Fetch updates from upstream
git fetch upstream

# Merge them into your branch
git merge upstream/main 

## Project Structure

- `src/talk_to_figma_mcp/` - TypeScript MCP server for Figma integration
- `src/cursor_mcp_plugin/` - Figma plugin for communicating with Cursor
- `src/socket.ts` - WebSocket server that facilitates communication between the MCP server and Figma plugin

## Get Started (Windows 10)

1. Install Bun on Windows:

```powershell
# Using PowerShell (Run as Administrator)
powershell -Command "irm bun.sh/install.ps1 | iex"
```

After installation:
- **Close and reopen PowerShell/Command Prompt**
- Verify installation by running `bun --version`
- If the command is still not recognized, you may need to manually add Bun to your PATH:
  - Search for "Environment Variables" in the Start menu
  - Edit the "Path" variable under User variables
  - Add `%USERPROFILE%\.bun\bin` to the list
  - Click OK and restart your terminal

2. Run setup (after Bun is properly installed and recognized):

```cmd
bun setup
```

3. Start the Websocket server:

```cmd
bun socket
```

4. Run the MCP server:

```cmd
bunx cursor-talk-to-figma-mcp
```

5. Install [Figma Plugin](#figma-plugin)

# Quick Video Tutorial

[![image](images/tutorial.jpg)](https://www.linkedin.com/posts/sonnylazuardi_just-wanted-to-share-my-latest-experiment-activity-7307821553654657024-yrh8)

## Manual Setup and Installation (Windows 10)

### MCP Server: Integration with Cursor

Add the server to your Cursor MCP configuration in `%USERPROFILE%\.cursor\mcp.json`:

```json
{
  "mcpServers": {
    "TalkToFigma": {
      "command": "bunx",
      "args": [
        "cursor-talk-to-figma-mcp"
      ]
    }
  }
}
```

If the file doesn't exist, create it with the content above.

### WebSocket Server

Start the WebSocket server:

```cmd
bun socket
```

### Figma Plugin

1. In Figma, go to Plugins > Development > New Plugin
2. Choose "Link existing plugin"
3. Select the `src\cursor_mcp_plugin\manifest.json` file (note the backslashes for Windows paths)
4. The plugin should now be available in your Figma development plugins

## Usage

1. Start the WebSocket server
2. Install the MCP server in Cursor
3. Open Figma and run the Cursor MCP Plugin
4. Connect the plugin to the WebSocket server by joining a channel using `join_channel`
5. Use Cursor to communicate with Figma using the MCP tools

## Troubleshooting for Windows

- **"bun is not recognized" error**: 
  1. Make sure you've restarted your terminal after installation
  2. Check if Bun is in your PATH by adding `%USERPROFILE%\.bun\bin` to your environment variables
  3. Try running the bun installer again

- **Access denied errors**: Try running terminal/command prompt as Administrator

- **Path issues**: Remember to use backslashes (`\`) for file paths in Windows

- **WebSocket connection issues**: Ensure your firewall isn't blocking the connection

- **Alternative installation method**: If the PowerShell script doesn't work, you can:
  1. Download the latest Bun zip from [Bun releases](https://github.com/oven-sh/bun/releases)
  2. Extract it to a directory like `C:\bun`
  3. Add this directory to your PATH environment variable
  4. Restart your terminal and try again

## MCP Tools

The MCP server provides the following tools for interacting with Figma:

### Document & Selection

- `get_document_info` - Get information about the current Figma document
- `get_selection` - Get information about the current selection
- `get_node_info` - Get detailed information about a specific node

### Creating Elements

- `create_rectangle` - Create a new rectangle with position, size, and optional name
- `create_frame` - Create a new frame with position, size, and optional name
- `create_text` - Create a new text node with customizable font properties

### Modifying text content

- `set_text_content` - Set the text content of an existing text node

### Styling

- `set_fill_color` - Set the fill color of a node (RGBA)
- `set_stroke_color` - Set the stroke color and weight of a node
- `set_corner_radius` - Set the corner radius of a node with optional per-corner control

### Layout & Organization

- `move_node` - Move a node to a new position
- `resize_node` - Resize a node with new dimensions
- `delete_node` - Delete a node

### Components & Styles

- `get_styles` - Get information about local styles
- `get_local_components` - Get information about local components
- `get_team_components` - Get information about team components
- `create_component_instance` - Create an instance of a component

### Export & Advanced

- `export_node_as_image` - Export a node as an image (PNG, JPG, SVG, or PDF)
- `execute_figma_code` - Execute arbitrary JavaScript code in Figma (use with caution)

### Connection Management

- `join_channel` - Join a specific channel to communicate with Figma

## Development

### Building the Figma Plugin

1. Navigate to the Figma plugin directory:

   ```cmd
   cd src\cursor_mcp_plugin
   ```

2. Edit code.js and ui.html

## Best Practices

When working with the Figma MCP:

1. Always join a channel before sending commands
2. Get document overview using `get_document_info` first
3. Check current selection with `get_selection` before modifications
4. Use appropriate creation tools based on needs:
   - `create_frame` for containers
   - `create_rectangle` for basic shapes
   - `create_text` for text elements
5. Verify changes using `get_node_info`
6. Use component instances when possible for consistency
7. Handle errors appropriately as all commands can throw exceptions

## License

MIT

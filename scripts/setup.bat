@echo off
REM Windows setup script for Cursor Talk to Figma MCP

REM Create .cursor directory if it doesn't exist
if not exist .cursor mkdir .cursor

REM Install dependencies
call bun install

REM Create mcp.json with configuration
echo {^
  "mcpServers": {^
    "TalkToFigma": {^
      "command": "bunx",^
      "args": [^
        "cursor-talk-to-figma-mcp"^
      ]^
    }^
  }^
} > .cursor\mcp.json

echo Setup completed successfully! 
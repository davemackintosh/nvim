# nvim

A very opinionated, zero-config neovim setup for writing GoLang, C/C++, Lua, ReactJS/Frontend web and Swift/SwiftUI.

## Goals

A familiar editor that enables:

- Coding with
  - Autocomplete
  - Smart suggestions
  - Github CoPilot
- Good support for
  - Golang
  - Swift
  - Lua
  - C/C++
  - React
  - CSS
  - HTML
- Autoformatting
  - Go
  - Swift
  - Lua
  - C/C++
  - React
  - CSS
  - HTML
  
![image](https://user-images.githubusercontent.com/1430657/231530973-c179e506-c6e0-4fe7-ab03-1f65d79c45a9.png)


## Mappings

There aren't many, I like to keep it simple but these are basically burned in muscle memory for me after years of developing with different editors.

`<leader>` is `,`

```
N) Ctrl + hjkl -- move between panes.
N) Ctrl + o    -- Toggle nerd tree (file browser.)
N) Ctrl + p    -- Open file finder.
N) Ctrl + s    -- Toggle the code overview panel.
N) K           -- Show floating documentation.
N) [d          -- Go to the previous; any level, diagnostic.
N) ]d          -- Go to the next; any level, diagnostic.
N) [c          -- Go to the previous error diagnostic.
N) ]c          -- Go to the next error diagnostic.
N) gd          -- Go to the definition of what's under the cursor.
N) gr          -- rename this thing and refactor it's usages.
N) se          -- Show the diagnostic in a floating window.
N) bp          -- Toggle a Break Point at this line.
N) bpc         -- Set a breakpoint with a condition.
N) F5          -- Start a DAP debugger session.
N) F8          -- In a DAP debugging session step over this breakpoint.
N) F11         -- In a DAP debugging session step into the current expression.
N) F12         -- In a DAP debugging session step out of the current expression.
IN) Ctrl + t   -- Run nearest test function.
IN) Ctrl + c   -- Run go test coverage.
I) Ctrl + k    -- Signature help in insert mode.
```


# Setup context menu item for selected file
[Microsoft.Win32.Registry]::SetValue("HKEY_CLASSES_ROOT\*\shell\nvim", "", "Edit with Neovim", [Microsoft.Win32.RegistryValueKind]::String)
[Microsoft.Win32.Registry]::SetValue("HKEY_CLASSES_ROOT\*\shell\nvim", "Icon", "C:\Program Files\Neovim\bin\nvim.exe", [Microsoft.Win32.RegistryValueKind]::String)
[Microsoft.Win32.Registry]::SetValue("HKEY_CLASSES_ROOT\*\shell\nvim\command", "", "`"C:\Program Files\Neovim\bin\nvim.exe`" `"%1`"", [Microsoft.Win32.RegistryValueKind]::String)

# Setup context menu item for selected directory
[Microsoft.Win32.Registry]::SetValue("HKEY_CLASSES_ROOT\directory\shell\nvim", "", "Open with Neovim", [Microsoft.Win32.RegistryValueKind]::String)
[Microsoft.Win32.Registry]::SetValue("HKEY_CLASSES_ROOT\directory\shell\nvim", "Icon", "C:\Program Files\Neovim\bin\nvim.exe", [Microsoft.Win32.RegistryValueKind]::String)
[Microsoft.Win32.Registry]::SetValue("HKEY_CLASSES_ROOT\directory\shell\nvim\command", "", "`"C:\Program Files\Neovim\bin\nvim.exe`" `"%v`"", [Microsoft.Win32.RegistryValueKind]::String)

# Setup context menu item for current directory
[Microsoft.Win32.Registry]::SetValue("HKEY_CLASSES_ROOT\directory\background\shell\nvim", "", "Open with Neovim", [Microsoft.Win32.RegistryValueKind]::String)
[Microsoft.Win32.Registry]::SetValue("HKEY_CLASSES_ROOT\directory\background\shell\nvim", "Icon", "C:\Program Files\Neovim\bin\nvim.exe", [Microsoft.Win32.RegistryValueKind]::String)
[Microsoft.Win32.Registry]::SetValue("HKEY_CLASSES_ROOT\directory\background\shell\nvim\command", "", "`"C:\Program Files\Neovim\bin\nvim.exe`" `"%v`"", [Microsoft.Win32.RegistryValueKind]::String)


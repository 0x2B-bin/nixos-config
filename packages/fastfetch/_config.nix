{
  config = {
    "$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
    modules = [
      "title"
      {
        type = "custom";
        format = "┏━━━━━━━━━━━━━━━━━━━━ 🖥️  System ━━━━━━━━━━━━━━━━━━━━┓";
      }
      {
        type = "os";
        key = "   OS";
      }
      {
        type = "kernal";
        key = "   Kernel";
      }
      {
        type = "uptime";
        key = "   Uptime";
      }
      {
        type = "localip";
        key =  "  󰩟 IP";
      }
      {
        type = "custom";
        fomrta = "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛";
      }
      "break"
      {
        type = "custom";
        format = "┏━━━━━━━━━━━━━━━━━━━━   SoftWare ━━━━━━━━━━━━━━━━━━━━┓";
      }
      {
        type = "packages";
        key = "   Packages";
      }
      {
        type = "shell";
        key = "   Shell";
      }
      {
        type = "wm";
        key = "   WM";
      }
      {
        type = "terminal";
        key = "   Terminal";
      }
      {
        type = "terminalfont";
        key = "   Terminal Font";
      }
      {
        type = "custom";
        format = "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛";
      }
      "break"
      {
        type = "custom";
        format = "┏━━━━━━━━━━━━━━━━━━━━   Hardware ━━━━━━━━━━━━━━━━━━━━┓";
      }
      {
        type = "cpu";
        key = "   CPU";
      }
      {
        type = "gpu";
        key = "   GPU";
      }
      {
        type = "memory";
        key = "   Memory";
      }
      {
        type = "swap";
        key = "   Swap";
      }
      {
        type = "disk";
        key = "   Disk";
      }
      {
        type = "custom";
        format = "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛";
      }
      "break"
      {
        type = "colors";
        symbol = "block";
        paddingLeft = 10;
      }
    ];
  };
}

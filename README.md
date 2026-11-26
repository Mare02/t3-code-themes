# T3 Code Themes

Custom themes for [T3 Code](https://t3.codes).

## Themes

| Theme | Folder | Description |
| --- | --- | --- |
| Tidal Glass (Dark + Light) | [`tidal-glass`](tidal-glass) | Navy, sea and aqua glass over a water background image |

## Install

Install one theme:

```bash
curl -fsSL https://raw.githubusercontent.com/Mare02/t3-code-themes/main/install.sh | bash -s -- tidal-glass
```

Install every theme:

```bash
curl -fsSL https://raw.githubusercontent.com/Mare02/t3-code-themes/main/install.sh | bash -s -- --all
```

List available themes:

```bash
curl -fsSL https://raw.githubusercontent.com/Mare02/t3-code-themes/main/install.sh | bash -s -- --list
```

The script copies the theme files (`.json` and background `.jpg`) into `~/.t3/userdata/themes/`. Set `T3_THEMES_DIR` to use another location.

Then open **Settings → Appearance** in T3 Code and select the theme. The dark variant applies in dark mode and the light variant in light mode, so set the app color scheme to match.

## Manual install

Copy the files from a theme folder into `~/.t3/userdata/themes/`. The `.jpg` must sit next to the `.json` with the same name.

## Adding a theme

Create a folder with the theme's `<id>.json` and `<id>.jpg` files. The install script picks up any folder containing a `.json` file.

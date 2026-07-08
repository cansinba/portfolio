# Capture Kit — how to produce case-study artifacts

Every project needs the same artifacts (portfolio roadmap, Global Definition of Done):
desktop + mobile screenshots, and — for pipeline projects — a short screen recording.
This file is the repeatable process. Follow it identically for every project.

## Folder & naming convention

All published artifacts live in the repo under:

```
public/assets/<project>/
```

`<project>` is the short project slug: `basalt`, `ledgerline`, `handoff`, `acorn`, `sample`.

Naming:

| Artifact | Filename |
|----------|----------|
| Desktop screenshot (1440px) | `<name>-desktop.png` |
| Mobile screenshot (375px) | `<name>-mobile.png` |
| Pipeline recording | `<name>-pipeline.mp4` |
| Figma export (from MCP) | `<name>-figma.png` |

`<name>` describes the shot: `overview`, `pricing-card`, `token-parity`, etc.
On the site, reference them as `/assets/<project>/<name>-desktop.png`.

## 1. Screenshots (automated)

Use the script — it captures desktop (1440px) and mobile (375px) in one go:

```bash
./scripts/capture.sh <url> <project> <name>
# example:
./scripts/capture.sh https://cansinbayir.com/work/sample sample template
```

Output lands in `public/assets/<project>/`. Works against the live site or a local
`npm run dev` / `serve dist` URL. Chrome must be installed; override its path with
`CHROME=/path/to/chrome` if needed.

For a Figma frame instead of a web page, use the Figma MCP `get_screenshot` tool and
save the PNG into the same folder as `<name>-figma.png`.

## 2. Screen recording (manual — macOS built-in)

The pipeline artifact (≤90s, no audio needed) shows the Figma↔code round trip.

1. **Record:** `Cmd + Shift + 5` → choose "Record Selected Portion" → drag over the
   area (keep it tight, one window) → Record. Keep it under 90 seconds. Stop from the
   menu bar. The `.mov` saves to the Desktop by default.
2. **Trim** if needed: open in QuickTime → `Cmd + T` → drag the yellow handles → Trim.
3. **Compress to web-friendly mp4** (target < 8 MB, muted):

   With ffmpeg (`brew install ffmpeg` once):
   ```bash
   ffmpeg -i input.mov -an -vcodec libx264 -crf 28 -preset slow \
     -movflags +faststart -vf "scale=1280:-2" public/assets/<project>/<name>-pipeline.mp4
   ```
   `-an` strips audio; `-crf 28` keeps size down; raise to 30–32 if still too big.

   No ffmpeg? QuickTime `File → Export As → 720p` gives a larger but usable mp4.
4. Reference on the site with a muted, click-to-play (or `playsinline muted`) `<video>`.

## 3. Checklist before using an artifact

- [ ] Desktop (1440) + mobile (375) screenshot both captured
- [ ] No scrollbars / OS chrome in frame (script uses `--hide-scrollbars`)
- [ ] Pipeline recording < 90s, < 8 MB, muted (pipeline projects only)
- [ ] Files in `public/assets/<project>/` with the naming convention above

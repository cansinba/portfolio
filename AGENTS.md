## Portfolio roadmap

This repo is the portfolio site (project P7). All work here is driven by the roadmap:
**Entry point:** `~/.claude/instructions/projects/roadmap-master.md` → portfolio tasks live in
`~/.claude/instructions/projects/portfolio-roadmap.md`. Read those before working; follow the
operator rules there (one task at a time, verify acceptance criteria, update the progress log).
Locked site copy (positioning, bio, one-liners) is in section 1 of the portfolio roadmap.

- Live: https://cansinbayir.com (custom domain) · fallback https://cansinba.github.io/portfolio/
- Deploy: push to `main` → GitHub Actions (`.github/workflows/deploy.yml`) builds & publishes.

## Development

When starting the dev server, use background mode:

```
astro dev --background
```

Manage the background server with `astro dev stop`, `astro dev status`, and `astro dev logs`.

## Documentation

Full documentation: https://docs.astro.build

Consult these guides before working on related tasks:

- [Adding pages, dynamic routes, or middleware](https://docs.astro.build/en/guides/routing/)
- [Working with Astro components](https://docs.astro.build/en/basics/astro-components/)
- [Using React, Vue, Svelte, or other framework components](https://docs.astro.build/en/guides/framework-components/)
- [Adding or managing content](https://docs.astro.build/en/guides/content-collections/)
- [Adding styles or using Tailwind](https://docs.astro.build/en/guides/styling/)
- [Supporting multiple languages](https://docs.astro.build/en/guides/internationalization/)

# Design-Eye Log

Thin index of the daily design-eye drill (90-day training track, studio roadmap §3).
Full measured notes live in the paper notebook / weekly Figma files — this is just the
searchable trail so the weekly review can confirm the habit is unbroken.

Format: `YYYY-MM-DD | Teardown / Copy-work / Weekly | source (+ [Figma] link for copy-work) | one-line takeaway`
Figma work lives in **Design Eye — Month N** files, pages named `W<week>D<day>_<type>_<source>` (e.g. `W1D2_copy-work_linear.app/pricing Basic`, `W1D3_teardown_stripe.com`).

## Week 1 — Seeing & deconstruction (Jul 7–13)

- 2026-07-07 | Teardown | oriorai.com | Fluid `clamp()` headings + fixed 16px body is an intentional pattern (readable body, expressive headings); section padding steps 144→112px on an 8pt scale. Stole: left-side scroll indicator.
- 2026-07-08 | Copy-work | linear.app/pricing (Basic card) · [Figma](https://www.figma.com/design/ylwSBXC2hKTnyBPI2NkgoP/) | Rebuilt the pricing card from memory. Corrections found on inspect/overlay: (1) The separators I read as `<hr>`/line elements are actually the billing_frequency element's own **border-top / border-bottom** — the divide is a neighbor's border, not a separate line element; stop hunting for line elements, check borders. (2) Hierarchy is measured, not assumed: plan name 24px, price 16px (Basic is a low tier, so price is deliberately de-emphasized) — trust the console over the "price should be biggest" heuristic. Got right: feature rows 39px tall on 55px pitch = 16px gap, matching Linear's `ul { gap:16px }`.
  - Figma craft note: inside an auto-layout, children should be **frames, not groups** — a raw Group behaves unpredictably (no own sizing, resizes wrong). Multiple elements that belong together → wrap in a frame with its own auto-layout.

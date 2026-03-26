# UI Design Guidelines

Follow these rules when building any user interface in this project. They are non-negotiable defaults — deviate only when explicitly told to.

---

## 1. Affordances & Signifiers

Every interactive element must visually communicate what it does without explanation.

- **Containers signal grouping.** Related items share a container (card, pill, bordered section). Unrelated items do not.
- **Selection states are visible.** The active/selected item has a distinct background, border, or color change — never rely on position alone.
- **Disabled = visually muted.** Gray out text and reduce opacity on disabled elements so users know clicking won't do anything.
- **Required states for interactive elements:**
  - Buttons: default, hover, active/pressed, disabled, and loading (spinner).
  - Inputs: default, focus (colored border), error (red border + message), warning (optional), disabled.
  - Nav items: default, hover, active/current.
- **Tooltips for icon-only actions.** If a button has no label, it must have a tooltip.

---

## 2. Visual Hierarchy

Not all information is equal. Size, position, color, and weight must reflect importance.

- **Most important content goes to the top**, large, and bold.
- **Secondary info is smaller, lighter weight, and positioned below** the primary content.
- **Use contrast to create hierarchy.** The difference between small/big and colorful/muted is what creates the hierarchy — not the absolute values alone.
- **Price, status, or key metrics** should be visually distinct (different color, alignment, or weight) from surrounding text.
- **Use icons + visual connectors** instead of verbose labels where possible (e.g., a line between two locations instead of "From: X, To: Y").
- **Images always add hierarchy.** Use them whenever available — they make scanning fast and add a pop of color.
- **Cards and repeating content** should follow a consistent, scannable layout pattern.

---

## 3. Spacing & Layout

Whitespace is more important than grids. Let things breathe.

- **Use a 4-point grid system.** All spacing, padding, and sizing values must be multiples of 4 (4, 8, 12, 16, 20, 24, 32, 40, 48, 64, etc.). This creates consistency and allows values to split in half cleanly.
- **Default gap between sibling elements: 32px.** Reduce to 16px or 8px to group tightly-related elements (e.g., a heading and its subtext).
- **Group related elements** with tighter spacing than unrelated ones — this is visual hierarchy through proximity.
- **12-column grids are guidelines, not rules.** Custom layouts (especially landing pages) don't need to snap to grid columns. Grids are most useful for structured, repeating content (galleries, blog listings, dashboards) and responsive breakpoints (12 → 8 on tablet → 4 on mobile).
- **Generous padding inside containers.** Cards, sections, and modals need breathing room — don't cram content against edges.

---

## 4. Typography

Design is mostly text. Get this right and 80% of the UI will look good.

- **Use one font.** Pick a clean sans-serif (Inter, SF Pro, Geist, Satoshi, General Sans, or system font stack) and use it for everything. Never use more than one font family.
- **Limit to 6 or fewer font sizes** in a given context:
  - Landing pages/marketing: sizes can range widely (e.g., 14px to 72px).
  - Dashboards/apps: keep the range tight (e.g., 12px to 24px) due to information density.
- **Tighten letter-spacing on large headings.** Apply `-2% to -3%` letter-spacing on any heading text. This is the single highest-impact typographic improvement.
- **Reduce line-height on headings.** Use `110%–120%` line-height for headings (not the default `150%`). Body text stays at `140%–160%`.
- **Font weight creates hierarchy** alongside size. Use semibold/bold for headings, regular/medium for body, and regular + muted color for secondary text.

---

## 5. Color

Use color with purpose, not for decoration.

- **Start with one primary/brand color.** Derive a full ramp from it:
  - Lighten it for subtle backgrounds and tinted surfaces.
  - Darken it for text on those backgrounds.
- **Semantic colors are mandatory:**
  - Blue → trust, links, interactive elements.
  - Red → error, danger, destructive actions.
  - Yellow/Amber → warning, caution.
  - Green → success, confirmation, positive status.
- **Let color find its purpose.** Don't paint things just to look colorful. Every color should signal something: an announcement bar grabs attention, a focus ring shows keyboard position, a green chip means "new."
- **Build a color ramp** (50–900 shades) for your primary color. Use it for chips, states, charts, and status indicators.

---

## 6. Dark Mode

Dark mode is not just "invert the colors." Follow these rules:

- **Reduce border contrast.** Light borders on dark backgrounds are too harsh — use subtle, low-opacity borders.
- **Create depth with surface lightness, not shadows.** Cards should be slightly lighter than the page background. Elevated content (modals, popovers) should be lighter still.
- **Dim bright accent colors.** Reduce saturation and brightness on chips, badges, and colored elements. Flip to light text on those dimmed backgrounds.
- **Explore beyond gray/navy.** Deep purples, dark teals, and muted greens can all serve as excellent dark mode base colors.
- **Shadows are nearly invisible in dark mode.** Don't rely on them for elevation — use surface color differences instead.

---

## 7. Shadows

Shadows create depth in light mode. Use them subtly.

- **If the shadow is the first thing you notice, it's too strong.** Reduce opacity and increase blur. Shadows should be felt, not seen.
- **Cards and resting content: light shadows.** Low opacity, moderate blur.
- **Elevated content (popovers, dropdowns, modals): stronger shadows.** These float above other content and need more visual separation.
- **Combine inner and outer shadows** for tactile effects like raised buttons.
- **Shadow guideline:** start with something like `0 1px 3px rgba(0,0,0,0.08), 0 4px 12px rgba(0,0,0,0.06)` and adjust from there.

---

## 8. Icons & Buttons

- **Match icon size to text line-height.** If your body text has a 24px line-height, icons should be 24×24. Oversized icons are the most common mistake.
- **Tighten the gap** between an icon and its label (8px is usually right).
- **Ghost buttons** are buttons without a visible background until hovered. Use them for secondary actions and sidebar navigation links.
- **Primary + secondary button pairing:** use a filled button for the primary CTA and a ghost/outlined button for the secondary action.
- **Button padding rule:** horizontal padding should be roughly double the vertical padding (e.g., `padding: 10px 20px`).
- **Buttons can include icons.** Leading icon + label is the most common pattern.

---

## 9. Feedback & States

When a user does anything, the UI must respond. No silent interactions.

- **Every button needs 4 states minimum:** default, hover, active/pressed, disabled. Add a loading state with a spinner when the action is async.
- **Every input needs:** default, focus (ring/border color change), error (red border + error message below), and optionally a warning state.
- **Show loading indicators** when fetching data — skeleton screens, spinners, or progress bars.
- **Show success feedback** when an action completes — toast notification, inline confirmation, or a check icon.
- **Animate transitions** on scroll, swipe, and page navigation. Abrupt changes feel broken.

---

## 10. Micro Interactions

Micro interactions are small animations that confirm user actions and add polish.

- **Confirm clipboard actions.** When a user clicks "Copy," show a brief tooltip or chip (e.g., "Copied!") that slides in and fades out.
- **Toggle animations.** Switches, checkboxes, and accordions should animate between states, not snap.
- **Button feedback.** A slight scale-down on press, or a ripple effect, confirms the tap registered.
- **Range from practical to playful.** Practical: a progress bar filling. Playful: a heart icon bursting with particles on "like." Match the tone of the product.
- **Keep them fast.** 150–300ms is the sweet spot. Anything longer feels sluggish.

---

## 11. Overlays & Image Treatment

When placing text on images, you must ensure readability.

- **Never place text directly on an unprocessed image.** It will be unreadable.
- **Use a gradient overlay:** apply a `linear-gradient` from transparent to a solid background color over the image. This preserves the image at the top while creating a readable text area at the bottom.
- **For extra polish:** add a `backdrop-filter: blur()` (progressive blur) on top of the gradient for a modern glass-like effect.
- **Full-screen overlays** (semi-transparent dark layer) work but obscure the image. Prefer gradients when the image matters.

---

## Quick Reference: Common Mistakes

| Mistake | Fix |
|---|---|
| All text the same size/weight | Use 3–6 sizes with clear weight hierarchy |
| No hover/focus states | Add states to every interactive element |
| Giant icons next to small text | Match icon size to text line-height |
| Harsh shadows | Reduce opacity, increase blur |
| Bright chips/badges in dark mode | Dim saturation and brightness |
| Text directly on images | Add gradient or blur overlay |
| Excessive grid rigidity | Prioritize whitespace over column alignment |
| Color used for decoration | Every color must have semantic purpose |
| No loading/success feedback | Every async action needs a visible response |
| Tight letter-spacing on body text | Only tighten letter-spacing on headings |

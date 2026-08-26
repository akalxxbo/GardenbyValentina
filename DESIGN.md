---
name: Vibrant Nightlife System
colors:
  surface: '#131313'
  surface-dim: '#131313'
  surface-bright: '#3a3939'
  surface-container-lowest: '#0e0e0e'
  surface-container-low: '#1c1b1b'
  surface-container: '#201f1f'
  surface-container-high: '#2a2a2a'
  surface-container-highest: '#353534'
  on-surface: '#e5e2e1'
  on-surface-variant: '#d2c5ac'
  inverse-surface: '#e5e2e1'
  inverse-on-surface: '#313030'
  outline: '#9b9079'
  outline-variant: '#4e4633'
  surface-tint: '#f3c01a'
  primary: '#ffebc2'
  on-primary: '#3e2e00'
  primary-container: '#ffca28'
  on-primary-container: '#705600'
  inverse-primary: '#765b00'
  secondary: '#ffb59b'
  on-secondary: '#5b1a00'
  secondary-container: '#fb5b10'
  on-secondary-container: '#501600'
  tertiary: '#ffe8e5'
  on-tertiary: '#680009'
  tertiary-container: '#ffc2bc'
  on-tertiary-container: '#b1161e'
  error: '#ffb4ab'
  on-error: '#690005'
  error-container: '#93000a'
  on-error-container: '#ffdad6'
  primary-fixed: '#ffdf93'
  primary-fixed-dim: '#f3c01a'
  on-primary-fixed: '#241a00'
  on-primary-fixed-variant: '#594400'
  secondary-fixed: '#ffdbcf'
  secondary-fixed-dim: '#ffb59b'
  on-secondary-fixed: '#380d00'
  on-secondary-fixed-variant: '#812900'
  tertiary-fixed: '#ffdad6'
  tertiary-fixed-dim: '#ffb3ad'
  on-tertiary-fixed: '#410003'
  on-tertiary-fixed-variant: '#930011'
  background: '#131313'
  on-background: '#e5e2e1'
  surface-variant: '#353534'
  canvas-off-white: '#E5E2E1'
  electric-yellow: '#FFCA28'
  sunset-orange: '#FF5E14'
  blood-red: '#BC2025'
  deep-void: '#0E0E0E'
typography:
  headline-xl:
    fontFamily: Montserrat
    fontSize: 64px
    fontWeight: '900'
    lineHeight: '1.1'
    letterSpacing: -0.02em
  headline-lg:
    fontFamily: Montserrat
    fontSize: 40px
    fontWeight: '800'
    lineHeight: '1.2'
    letterSpacing: -0.01em
  headline-lg-mobile:
    fontFamily: Montserrat
    fontSize: 32px
    fontWeight: '800'
    lineHeight: '1.2'
  headline-md:
    fontFamily: Montserrat
    fontSize: 24px
    fontWeight: '700'
    lineHeight: '1.3'
  body-lg:
    fontFamily: Montserrat
    fontSize: 18px
    fontWeight: '500'
    lineHeight: '1.6'
  body-md:
    fontFamily: Montserrat
    fontSize: 16px
    fontWeight: '400'
    lineHeight: '1.6'
  label-md:
    fontFamily: JetBrains Mono
    fontSize: 14px
    fontWeight: '500'
    lineHeight: '1.4'
    letterSpacing: 0.05em
  label-sm:
    fontFamily: JetBrains Mono
    fontSize: 12px
    fontWeight: '400'
    lineHeight: '1.4'
rounded:
  sm: 0.25rem
  DEFAULT: 0.5rem
  md: 0.75rem
  lg: 1rem
  xl: 1.5rem
  full: 9999px
spacing:
  base: 8px
  gutter: 24px
  margin-mobile: 16px
  margin-desktop: 64px
  section-gap: 80px
---

## Brand & Style

The design system is engineered to capture the high-energy, eclectic spirit of a modern bar and entertainment venue. It prioritizes a **vibrant, high-contrast** aesthetic that feels alive, social, and slightly irreverent. By mixing bold geometric shapes with a high-saturation palette, the interface mimics the visual density of a bustling urban lounge or a neon-lit pop-up.

The style leans into **Modern Maximalism** with a touch of **Digital Brutalism**. It avoids the sterility of standard SaaS interfaces in favor of raw energy—using oversized typography, saturated color blocks, and tight spacing to create a sense of urgency and fun. It is designed to be experienced on the move, with high legibility and large touch targets suitable for low-light environments.

## Colors

The palette is anchored in a **Dark Mode** default to reflect the late-night venue atmosphere. **Deep Void (#0E0E0E)** serves as the primary canvas, providing a high-contrast backdrop that allows the chromatic colors to "pop" like neon signage.

**Electric Yellow** is the primary action color, used for high-priority CTAs and critical navigation. **Sunset Orange** and **Blood Red** act as secondary accents, providing warmth and a sense of "heat" to the UI. The **Canvas Off-White** is reserved strictly for primary text and high-contrast iconography to ensure maximum readability against the dark background. Use saturated gradients sparingly to transition between the warm hues (Orange to Yellow) to create a glowing effect.

## Typography

Typography is a central pillar of this design system, utilizing a duo-font approach that balances impact with technical precision. 

**Montserrat** is used for all headlines and body copy. It should be used at its heaviest weights (800-900) for headers to create a "wall of type" effect. Tight letter spacing on headlines enhances the bold, graphic feel.

**JetBrains Mono** provides a functional contrast. It is used for all "utility" text—labels, pricing, timestamps, and metadata. This monospaced aesthetic adds a modern, slightly "ticket-stub" or "industrial" feel to the entertainment context, making information-dense areas like menus or schedules feel organized and distinct.

## Layout & Spacing

This design system uses a **Fluid Grid** model with generous margins to allow content to breathe amidst the high-intensity colors. The spacing rhythm is based on an **8px baseline grid**, ensuring mathematical harmony across all components.

- **Desktop:** A 12-column grid with 24px gutters. Content is typically centered with a max-width of 1440px.
- **Mobile:** A 4-column grid with 16px margins. Layouts should stack vertically, favoring large full-bleed imagery and oversized buttons that are easy to tap in a chaotic environment.
- **Sectioning:** Use large vertical gaps (80px+) between major sections to prevent the bold typography from feeling cluttered.

## Elevation & Depth

To maintain the energetic and modern feel, the design system avoids traditional soft shadows. Instead, it uses **Tonal Layering** and **High-Contrast Outlines**.

Depth is created by shifting the background color from `Deep Void` (#0E0E0E) to a slightly lighter "Surface" gray (approx. 10% lightness) for cards and containers. For interactive elements, use **Hard Shadows** (0% blur, 4px-8px offset) in `Electric Yellow` or `Sunset Orange` to create a 2.5D pop-out effect. 

In specific "hero" moments, use **Glow Effects** (outer blurs) in primary brand colors to simulate neon lights, but keep these limited to high-impact decorative elements to maintain performance and clarity.

## Shapes

The shape language is consistently **Rounded**, providing a friendly and approachable counterpoint to the aggressive typography and dark colors. 

Standard components (Cards, Inputs) use a **0.5rem (8px)** radius. Larger structural containers or image carousels should use **1rem (16px)** to emphasize the "bubbly" and playful personality of the brand. Buttons can occasionally be rendered as full-pill shapes to denote primary "start" actions, such as "Book Now" or "View Menu." Avoid sharp 90-degree corners to keep the vibe casual and social.

## Components

- **Buttons:** Primary buttons use `Electric Yellow` backgrounds with black `Montserrat` Bold text. They should have a subtle hover state that shifts to `Sunset Orange`.
- **Cards:** Use a slightly lighter background than the canvas. Cards should have no borders but can utilize a hard-offset shadow in brand colors for an elevated state.
- **Inputs:** Dark backgrounds with a 1px `Canvas Off-White` border. Upon focus, the border should glow `Electric Yellow`.
- **Chips/Badges:** Use `JetBrains Mono` for the text. Use `Blood Red` for high-intensity tags (e.g., "LIVE NOW") and `Electric Yellow` for promotional tags.
- **Lists:** Use monospaced numbers or `Material Symbols` for bullets to maintain the technical, organized feel of a menu or event schedule.
- **Interactive States:** Every hover or tap should trigger a color shift or a position offset (moving 2px up/left) to reinforce the tactile, "squishy" feel mentioned in the narrative.
# keycloak-themes

Keycloak themes for the homelab Keycloak (`keycloak.internal.taron.org`), styled after https://taron.tech.

## Themes

- `m-tier`: centered login card on a grid background.
- `m-tier-geo`: two-panel login, branded panel on the left with triangles shaped like the taron.tech logo (apex down).
- Each theme ships `login`, `account`, `admin` and `email`. Parents: `login` → `keycloak`, `account` → `keycloak.v3`, `admin` → `keycloak.v2`.
- No FreeMarker templates are overridden. The left panel of `m-tier-geo` is built from existing markup: the realm display name is the headline, logo and subline are CSS pseudo-elements in `m-tier-geo/login/resources/css/styles.css`. The triangles are the logo's frame silhouette as inline SVG data URIs.
- Palette and fonts match taron.tech: accent `#3b82f6`, surface `#0d1117`, Inter and JetBrains Mono.
- Keycloak loads `resources/img/favicon.ico` from the login theme; a `favicon.png` is never used. The logo is `img/logo.svg`.

## Release

- Every push to `main` makes the workflow tag the next patch version (`vX.Y.Z`), build the image and push it to `ghcr.io/m-tier/keycloak-themes`. A push is a release.
- The image is copied into Keycloak by an init container defined in X-Infra-Argo `charts/keycloak/values.yaml`. It sits inside an `extraInitContainers: |` string block, which Renovate cannot parse, so the tag there must be bumped by hand after the workflow has finished.
- Themes are selected per realm under Realm settings → Themes.

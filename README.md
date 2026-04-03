# Keycloak Themes

These are the themes I am using in my Homelab Keycloak. The design is intended to match my portfolio homepage ([taron.tech](https://taron.tech)).

Feel free to re-use or fork this repository to style up your own Keycloak!

## Preview

- Dark background with subtle grid pattern
- Blue accent (`#3b82f6`) for interactive elements
- Inter + JetBrains Mono typography
- Terminal-inspired labels and section headers

## Theme Coverage

| Type | Description |
|---|---|
| **login** | Sign-in, registration, and password reset pages |
| **account** | User self-service portal (profile, sessions, security) |
| **admin** | Keycloak admin console |
| **email** | Email templates (inherits default Keycloak templates) |

## Usage

The image is designed to run as a Kubernetes init container that copies the theme files into Keycloak's theme directory.

### Build

```bash
docker build -t keycloak-themes .
```

### Kubernetes Init Container

Add the theme image as an init container to your Keycloak deployment. It copies the theme files into a shared volume before Keycloak starts.

```yaml
spec:
  initContainers:
    - name: keycloak-themes
      image: ghcr.io/m-tier/keycloak-themes:latest
      command: ["sh", "-c", "cp -r /m-tier /opt/keycloak/themes/m-tier"]
      volumeMounts:
        - name: themes
          mountPath: /opt/keycloak/themes
  containers:
    - name: keycloak
      image: quay.io/keycloak/keycloak:26.5.5
      volumeMounts:
        - name: themes
          mountPath: /opt/keycloak/themes
  volumes:
    - name: themes
      emptyDir: {}
```

### Docker Compose

```yaml
services:
  keycloak-themes:
    image: ghcr.io/m-tier/keycloak-themes:latest
    volumes:
      - themes:/opt/keycloak/themes
    command: ["sh", "-c", "cp -r /m-tier /opt/keycloak/themes/m-tier"]

  keycloak:
    image: quay.io/keycloak/keycloak:26.5.5
    depends_on:
      keycloak-themes:
        condition: service_completed_successfully
    volumes:
      - themes:/opt/keycloak/themes

volumes:
  themes:
```

Then in Keycloak: **Realm Settings** > **Themes** > select **m-tier** for each theme type.


## License

Do whatever you want with it.
FROM busybox:1.38
COPY m-tier/ /m-tier/
CMD ["cp", "-r", "/m-tier", "/opt/keycloak/themes/"]
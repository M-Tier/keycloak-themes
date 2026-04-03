FROM busybox:1.37
COPY m-tier/ /m-tier/
CMD ["cp", "-r", "/m-tier", "/opt/keycloak/themes/"]
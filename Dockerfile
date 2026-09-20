FROM busybox:1.38
COPY m-tier/ /themes/m-tier/
COPY m-tier-geo/ /themes/m-tier-geo/
CMD ["sh", "-c", "cp -r /themes/* /opt/keycloak/themes/"]

# vim:set ft=dockerfile
#
# Docker image for chef testing
# Individual things need to be broken out from this main docker image
# Base rhel image pulled from registry.access.redhat.com/rhel6

FROM registry.access.redhat.com/rhel6.6:latest
MAINTAINER John R. Ray <jray@shadow-soft.com>

# Register the system and attach a sub
RUN /usr/bin/subscription-manager register --username jray@scantech --password u0hk0z6LNPOc --auto-attach

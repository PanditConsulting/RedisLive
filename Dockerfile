FROM sushanto/prv:python

MAINTAINER Sushanto Pandit <sushanto@gmail.com>

RUN pip install --upgrade pip
RUN pip install tornado
RUN pip install redis
RUN pip install python-dateutil

RUN rm /etc/localtime
RUN ln -sf /usr/share/zoneinfo/US/Pacific /etc/localtime

COPY src/* /opt/
COPY start.sh /
COPY redis-live.conf /opt/

ENTRYPOINT ["/start.sh"]


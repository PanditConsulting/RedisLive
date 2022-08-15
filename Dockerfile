FROM sushanto/prv:python

MAINTAINER Sushanto Pandit <sushanto@gmail.com>

RUN pip install --upgrade pip

RUN rm /etc/localtime
RUN ln -sf /usr/share/zoneinfo/US/Pacific /etc/localtime

RUN mkdir -p /redislive
COPY . /redislive
RUN cd /redislive \
    && pip install -r requirements.txt

WORKDIR /redislive/src
ENV HOME /redislive/src

EXPOSE 63790

# Configure container to run as an executable
CMD ["./redis-monitor.py", "--duration=120", "--quiet"]

ENTRYPOINT ["./redis-live.py"]


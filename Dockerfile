#
#	self-hosted runner for Github
#
#	mandatory environment variables: RUNNER_URL and RUNNER_TOKEN
#

FROM debian:latest

RUN addgroup --gid 998 docker998
RUN addgroup --gid 999 docker999
RUN apt -qq update && apt -y install curl bash >/dev/null
RUN curl -Lsk https://get.docker.com/ |bash -sx
RUN adduser --disabled-password --gecos "" --ingroup docker user
RUN usermod -G docker998,docker999 user

WORKDIR /home/user
RUN curl -Lsk $(curl -Lsk https://github.com/actions/runner/releases/|grep -Eo 'https://github.com/actions/runner/releases/download/.+/actions-runner-linux-x64-.+.tar.gz' |head -1) | tar -zx
RUN ./bin/installdependencies.sh

COPY *.sh /

RUN chown -R user .

USER user

ENTRYPOINT '/entrypoint.sh'


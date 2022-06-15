FROM circleci/node:16-stretch

RUN sudo apt update && sudo apt install -y make python3-pip \
    && pip3 install awscli --upgrade --user \
    && curl -fsSL https://get.pnpm.io/install.sh | PNPM_VERSION=7.1.9 /bin/bash - 

ENV PATH=/home/circleci/.local/share/pnpm:/home/circleci/.local/bin:/home/circleci/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN pnpm config set store-dir .pnpm-store

COPY entrypoint.sh .

ENTRYPOINT ["./entrypoint.sh"]
CMD ["/bin/sh"]

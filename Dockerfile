FROM frolvlad/alpine-glibc

WORKDIR /workdir
ENV DENO_INSTALL=/workdir/.deno
ENV PATH=$PATH:$DENO_INSTALL/bin

# install deno
RUN apk add --no-cache --virtual .installdeps curl unzip && \
  curl -fsSL https://deno.land/x/install/install.sh | sh && \
  apk del .installdeps

COPY . .

RUN deno install oak.ts

EXPOSE 8000
CMD ["deno", "run", "--allow-net", "oak.ts"]

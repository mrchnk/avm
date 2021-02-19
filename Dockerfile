FROM ubuntu:20.04 AS builder

RUN apt-get update && \
  apt-get install -y --no-install-recommends g++ make cmake && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /avm
ADD . .
RUN cmake -S . -B build -DBUILD_TESTING=OFF -DBUILD_DEVELOPMENT=OFF
RUN cmake --build build --target avm
RUN cmake --install build

FROM ubuntu:20.04

COPY --from=builder /usr/local/bin/avm /usr/local/bin/avm
ENTRYPOINT [ "avm" ]

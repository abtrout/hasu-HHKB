FROM debian

COPY . /hhkb
WORKDIR /hhkb

RUN apt update && apt install -y \
  build-essential \
  gcc-avr \
  binutils-avr \
  avr-libc \
  dfu-util \
  dfu-programmer

CMD ["/bin/bash"]

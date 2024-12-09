# Gunakan image Flutter resmi
ARG android_sdk_ver=34
FROM ghcr.io/cirruslabs/android-sdk:${android_sdk_ver}

ARG flutter_ver=3.24.5
ARG build_rev=0

ENV FLUTTER_HOME=/usr/local/flutter \
    FLUTTER_VERSION=${flutter_ver} \
    PATH=$PATH:/usr/local/flutter/bin:/usr/local/flutter/bin/cache/dart-sdk/bin
RUN apt-get update \
 && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends --no-install-suggests \
            ca-certificates \
 && update-ca-certificates \
    \

    && curl -fL -o /tmp/flutter.tar.xz \
    https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_${flutter_ver}-stable.tar.xz \
&& tar -xf /tmp/flutter.tar.xz -C /usr/local/ \
&& git config --global --add safe.directory /usr/local/flutter \
&& flutter config --enable-android \
              --enable-linux-desktop \
              --enable-web \
              --no-enable-ios \
&& flutter precache --universal --linux --web --no-ios \
&& (yes | flutter doctor --android-licenses) \
&& flutter --version \
\
&& rm -rf /var/lib/apt/lists/* \
      /tmp/*


# Set working directory
WORKDIR /monkeep

# Salin semua file proyek ke dalam container
COPY . .

# Install dependensi Flutter
RUN flutter pub get

# Build APK dalam mode release
RUN flutter build apk --release

# Hasil build akan berada di /app/build/app/outputs/flutter-apk/

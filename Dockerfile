FROM python:3.9

ENV PYTHONIOENCODING utf-8

WORKDIR /app

# 必要なシステムパッケージをインストール
RUN apt-get update && \
    apt-get install -y \
        build-essential \
        gcc \
        gfortran \
        libgcc-11-dev \
        libgfortran5 \
        liblapack-dev \
        python3-dev \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        meson \
        ninja-build \
        curl \
        unzip \
        libexif-dev \
        udev \
        fonts-freefont-ttf \
        chromium \
        chromium-driver \
        xvfb \
    && rm -rf /var/lib/apt/lists/*

# Docker CLIのインストール
RUN curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-20.10.7.tgz -o /tmp/docker.tgz \
    && tar -xzvf /tmp/docker.tgz -C /usr/local/bin --strip-components=1 \
    && rm /tmp/docker.tgz

# 追加のPythonパッケージ
RUN pip install scikit-learn selenium pyvirtualdisplay xvfbwrapper
RUN pip install pandas openai pymysql pydynamic PyMuPDF
RUN pip install tqdm

# Pythonライブラリのインストール
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# アプリケーションコードをコピー
COPY . .

# アプリケーションの起動
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]

FROM nikolaik/python-nodejs:python3.9-nodejs15-slim
# python for youtube dl installation (outdated apt package)
ENV DEBIAN_FRONTEND noninteractive

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app
RUN apt -qq update
RUN apt -qq install -y ffmpeg
COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt
ENV LANG en_US.UTF-8
RUN npm install && \
    npm run build
CMD ["npm","start"]
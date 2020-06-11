FROM nginx:latest

RUN apt-get update
RUN ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
RUN apt-get install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN apt-get install -y nano wget curl zip unzip software-properties-common locales
RUN wget https://releases.hashicorp.com/consul-template/0.25.0/consul-template_0.25.0_linux_amd64.zip&&unzip consul-template_0.25.0_linux_amd64.zip && chmod +x consul-template && ln -sf $PWD/consul-template /usr/local/bin

EXPOSE 80
ENTRYPOINT ["service nginx start"]

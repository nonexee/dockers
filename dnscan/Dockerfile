FROM python:3.9-slim
RUN apt update;apt install git wget -y \
&& git clone https://github.com/rbsec/dnscan.git \
&& cd dnscan \
&& wget https://raw.githubusercontent.com/janmasarik/resolvers/master/resolvers.txt \
&& pip install -r requirements.txt \
&& pip install cryptography \
&& apt remove -y wget git \
&& apt autoremove -y

ENTRYPOINT ["python","/dnscan/dnscan.py"]

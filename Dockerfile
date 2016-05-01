FROM microsoft/dotnet:latest
MAINTAINER Roman Atachiants "roman@misakai.com"

# Make sure we have S3 & additional libraries
RUN apt-get update -qq \
	&& apt-get install -y s3cmd git wget

# Install CLR debugger as well
RUN curl -sSL https://raw.githubusercontent.com/Microsoft/MIEngine/getclrdbg-release/scripts/GetClrDbg.sh | bash /dev/stdin vs2015u2 ~/clrdbg

# Application will be in app folder
WORKDIR /app
ADD deploy.sh /

# Volumes for faster deploy
VOLUME /app
VOLUME /root/.nuget/packages
CMD ["/bin/bash", "/deploy.sh"]
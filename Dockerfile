FROM microsoft/dotnet:latest
MAINTAINER Roman Atachiants "roman@misakai.com"

# Make sure we have S3 & additional libraries
RUN apt-get update -qq \
	&& apt-get install -y s3cmd git wget

# Application will be in app folder
WORKDIR /app
ADD deploy.sh /

CMD ["/bin/bash", "/deploy.sh"]
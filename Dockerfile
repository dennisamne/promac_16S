#Base image
FROM rocker/tidyverse:3.6.3

LABEL description = "Image for R analysis"
MAINTAINER "Dennis Amnebrink" dennis.amnebrink@lnu.se

# Use the bash shell
SHELL ["/bin/bash", "-c"]

#Workdir
WORKDIR /Home


#Copy files to container
#CMD bash mkdir analysis data results

#COPY analysis ./analysis/
#COPY data ./data/
#COPY results ./results/
#COPY install.packages.R .

RUN R -e 'install.packages("rmarkdown")' \
	&& R -e 'install.packages("renv")' \
	&& R -e 'renv::consent()'
	&& R -e 'renv::restore()'

CMD ["/init"]


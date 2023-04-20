FROM python

WORKDIR /builder

RUN curl -fsSL https://clis.cloud.ibm.com/install/linux | sh

RUN ibmcloud plugin install cr -f
RUN ibmcloud plugin install code-engine -f

CMD [ "ibmcloud", "plugin", "list" ]
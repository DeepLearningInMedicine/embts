FROM python:2.7
WORKDIR /usr/src/app

RUN pip install --upgrade pip && pip install --upgrade setuptools
RUN pip install SimpleITK
RUN apt-get update && apt-get -y install bsdtar
RUN curl -SL https://bitbucket.org/s0216660/brain_tumor_segmentation_em/get/c9b3de8795bf.zip -o /usr/src/app/install.zip && bsdtar -xf /usr/src/app/install.zip -s'|[^/]*/||'  && rm -rf install.zip

COPY numpy-1.8.0.tar.gz ./
RUN pip install numpy-1.8.0.tar.gz && rm -rf numpy-1.8.0.tar.gz

COPY main.py ./

RUN python ./setup.py install

#ENTRYPOINT ["python"]
#CMD ["main.py", "--help"]

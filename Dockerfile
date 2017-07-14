FROM python:2.7
WORKDIR /usr/src/app

RUN pip install --upgrade pip && pip install --upgrade setuptools
RUN pip install SimpleITK
RUN apt-get update && apt-get -y install bsdtar
RUN curl -SL https://bitbucket.org/s0216660/brain_tumor_segmentation_em/get/c9b3de8795bf.zip -o /usr/src/app/install.zip && bsdtar -xf /usr/src/app/install.zip -s'|[^/]*/||'  && rm -rf install.zip

RUN curl -SL https://pypi.python.org/packages/73/46/c5b5c61fccec607dad15a2d1f832dec1a8d094ea770d8f8e4a43abd8be7b/numpy-1.8.0.tar.gz#md5=2a4b0423a758706d592abb6721ec8dcd -o/usr/src/app/numpy-1.8.0.tar.gz
RUN pip install numpy-1.8.0.tar.gz && rm -rf numpy-1.8.0.tar.gz

COPY main.py ./

RUN python ./setup.py install

#ENTRYPOINT ["python"]
#CMD ["main.py", "--help"]

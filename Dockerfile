FROM python:2.7
WORKDIR /usr/src/app

ADD ./brats_vanilla/ /usr/src/app

COPY ./brain_tumor_segmentation_em_alberts/requirements.txt ./
COPY ./brain_tumor_segmentation_em_alberts/numpy-1.8.0.tar.gz ./

RUN pip install --upgrade pip
RUN pip install --upgrade setuptools
RUN pip install SimpleITK
RUN pip install numpy-1.8.0.tar.gz
RUN rm - rf numpy-1.8.0.tar.gz

CMD [ "python", "./setup.py", "install" ]
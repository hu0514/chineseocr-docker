FROM centos:7
RUN yum install wget gcc make zlib-devel libffi-devel openssl-devel python3-devel libSM-1.2.2-2.el7.x86_64 libXrender.x86_64 libXext-1.3.3-3.el7.x86_64 -y \
    && python3 -m pip install --upgrade pip \
    && pip3 install -i https://pypi.mirrors.ustc.edu.cn/simple/ --timeout=120 torchvision \
    && pip3 install -i https://pypi.mirrors.ustc.edu.cn/simple/ --timeout=120 opencv-contrib-python==4.1.1.26 \
    && pip3 install -i https://pypi.mirrors.ustc.edu.cn/simple/ --timeout=120 easydict Cython h5py pandas requests bs4 matplotlib lxml keras==2.1.5 pillow tensorflow==1.8 web.py \
    && sed -i "s/original_keras_version = f.attrs\['keras_version'\].decode('utf8')/original_keras_version = f.attrs\['keras_version'\]/g" /usr/local/lib/python3.6/site-packages/tensorflow/python/keras/_impl/keras/engine/saving.py \
    && sed -i "s/original_backend = f.attrs\['backend'\].decode('utf8')/original_backend = f.attrs\['backend'\]/g" /usr/local/lib/python3.6/site-packages/tensorflow/python/keras/_impl/keras/engine/saving.py \
    && yum clean all
WORKDIR /chineseocr
#ADD . /chineseocr
ARG MODEL_PATH
ARG BIN_PATH

FROM pytorch/pytorch:2.4.1-cuda11.8-cudnn9-runtime

WORKDIR /app

# COPY ${MODEL_PATH} ./model
COPY ${BIN_PATH} ./bin

RUN pwd && ls

RUN pip install -U pip
RUN pip install \
    opencv-python \
    pycocotools \
    tensorflow \
    scikit-image \
    pyyaml \
    scipy \
    pandas \
    tensorboardX \
    tensorflow-datasets \
    tensorflow-graphics \
    tensorflow-metadata \
    tensorflow-probability \
    tensorboard \
    google-auth \
    setuptools \
    pillow \
    einsum \
    dask[dataframe] \
    datasets \
    transformers \
    huggingface_hub[cli] \
    cityscapesscripts
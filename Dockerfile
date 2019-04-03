FROM continuumio/miniconda3



ADD ilamb-venv.yml /tmp/ilamb-venv.yml


RUN echo "source activate $(head -1 /tmp/ilamb-venv.yml | cut -d' ' -f2)" > ~/.bashrc
ENV PATH /opt/conda/envs/$(head -1 /tmp/ilamb-venv.yml | cut -d' ' -f2)/bin:$PATH

RUN conda env create -f ilamb-venv.yml
RUN echo "source activate env" > ~/.bashrc

WORKDIR ILAMB_WK

COPY 


ENV ILAMB_ROOT ILAMB_WK/ILAMB_ROOT


#
CMD ["python" "lmt_post.py"]


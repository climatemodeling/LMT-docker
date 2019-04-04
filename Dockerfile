#get the base 
FROM continuumio/miniconda3


#ENTRYPOINT [ “/bin/bash”, “-c” ]
 
ADD lmt-bm-venv-py3.yml /tmp/lmt-bm-venv.yml

RUN conda env create -f /tmp/lmt-bm-venv.yml

#activate the venv automatically
RUN echo "source activate $(head -1 /tmp/lmt-bm-venv.yml | cut -d' ' -f2)" > ~/.bashrc
#it seemed that the following line are not needed
#ENV PATH /opt/conda/envs/$(head -1 /tmp/lmt-venv.yml | cut -d' ' -f2)/bin:$PATH
#RUN echo "source activate env" > ~/.bashrc

WORKDIR /home/lmtuser

RUN mkdir /home/lmtuser/ILAMB_ROOT
ENV ILAMB_ROOT /home/lmtuser/ILAMB_ROOT

#set up the ILAMB running directory
RUN mkdir /home/lmtuser/ILAMB_ROOT/MODEL
RUN mkdir /home/lmtuser/ILAMB_ROOT/DATA

#set up postprocessing or comorizing directories
RUN mkdir /home/lmtuser/lmt_wkflow

ADD alm2ilamb_wkflow/* /home/lmtuser/lmt_wkflow/bin/

#
#CMD ["python" "lmt_post.py"]


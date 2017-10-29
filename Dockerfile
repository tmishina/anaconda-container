FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y curl vim bzip2
RUN apt-get install -y bsdtar && ln -sf $(which bsdtar) $(which tar)
RUN cd /root && curl -L -O https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh
RUN cd /root && bash ./Anaconda3-5.0.1-Linux-x86_64.sh -b -p /opt/anaconda3
RUN echo "export PATH=\"/opt/anaconda3/bin:\$PATH\"" >> /root/.bashrc
RUN mkdir /host
RUN mkdir /root/.jupyter
ADD jupyter_notebook_config.py /root/.jupyter
RUN /opt/anaconda3/bin/conda install -c r r-essentials
CMD /host/entrypoint.sh



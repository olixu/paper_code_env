# Use the FROM instruction to pull other images to base your new one on
FROM debian:latest

# ENV PATH="/root/anaconda/bin/"

# Install Python and pip (pip3)
RUN apt-get -y update && apt-get install -y apt-utils python3-pip && pip3 install --upgrade pip && apt -y install wget git htop vim && rm -rf /var/lib/apt/lists/*

# install anaconda
RUN wget https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh -O condainstall.sh && \
    bash condainstall.sh -b -p $HOME/anaconda && eval "$(/root/anaconda/bin/conda shell.bash hook)" && \
    /root/anaconda/bin/conda init && \
    echo y | /root/anaconda/bin/conda create -n po python==3.8

# Some installs to facilitate the process.
RUN /root/anaconda/bin/conda init bash

# SHELL ["/root/anaconda/bin/conda", "run", "-n", "po", "/bin/bash", "-c"]
# RUN /root/anaconda/bin/conda install -y pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch && \
#     pip install cvxpy cvxpylayers && \
#     /root/anaconda/bin/conda install -y matplotlib pandas
# RUN /root/anaconda/bin/conda install -y matplotlib

#  It's imperative that you install jupyter, in particular, to work with Gradient
RUN pip install jupyterlab
# RUN pip install notebook


# Use EXPOSE to instruct the image to expose ports as needed
EXPOSE 8888


# The main purpose of a CMD is to provide defaults for an executing container
# This CMD opens the jupyter notebook when you run the image
CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter-lab --ip 0.0.0.0 --no-browser --LabApp.trust_xheaders=True --LabApp.disable_check_xsrf=False --LabApp.allow_remote_access=True --LabApp.allow_origin='*'"]

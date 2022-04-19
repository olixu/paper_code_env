# 基于最新的debian版本构建
FROM continuumio/anaconda3

# # 更新系统，包括python3
RUN apt -y update && \
    apt -y upgrade && \
    apt-get install -y python3-pip && pip3 install --upgrade pip && \
    apt -y install wget git htop vim zsh && \
    wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O - | sh && \
    chsh -s /bin/zsh root && \
    rm -rf /var/lib/apt/lists/*

# #  安装jupyter lab等python的包
# RUN conda install -y pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch && \
#     conda install -y jupyterlab && \
#     pip3 install --no-cache-dir cvxpy cvxpylayers matplotlib pandas && \
#     conda clean -y -a 
RUN conda install -y jupyterlab
    
   
# # 安装jupyter lab extensions
# RUN conda install -y -c conda-forge nodejs jupyterlab-lsp python-lsp-server ipympl jupyterlab-drawio && \
#     pip3 install --no-cache-dir jupyterlab-topbar jupyterlab-system-monitor lckr-jupyterlab-variableinspector  && \
#     conda clean -y -a 

# 使用8888端口访问
EXPOSE 8888


# The main purpose of a CMD is to provide defaults for an executing container
# This CMD opens the jupyter notebook when you run the image
# CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --ip 0.0.0.0 --no-browser --allow-root"]
CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter lab --ip 0.0.0.0 --no-browser --allow-root"]
# CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter lab --ip 0.0.0.0 --allow-root --ip=0.0.0.0 --no-browser --ServerApp.trust_xheaders=True --ServerApp.disable_check_xsrf=False --ServerApp.allow_remote_access=True --ServerApp.allow_origin='*' --ServerApp.allow_credentials=True"]

# # Use the FROM instruction to pull other images to base your new one on
# FROM nvidia/cuda:11.6.2-devel-ubuntu20.04

# # ENV PATH="/root/anaconda/bin/"

# # Install Python and pip (pip3)
# RUN apt-get -y update && apt-get install -y apt-utils python3-pip && pip3 install --upgrade pip && apt -y install wget git htop vim && rm -rf /var/lib/apt/lists/*

# # # install anaconda
# # RUN wget https://repo.anaconda.com/archive/Anaconda3-2021.11-Linux-x86_64.sh -O condainstall.sh && \
# #     bash condainstall.sh -b -p $HOME/anaconda && eval "$(/root/anaconda/bin/conda shell.bash hook)" && \
# #     rm condainstall.sh
# #     # /root/anaconda/bin/conda init && \
# #     # echo y | /root/anaconda/bin/conda create -n po python==3.8

# # Some installs to facilitate the process.
# # RUN /root/anaconda/bin/conda init bash

# # SHELL ["/root/anaconda/bin/conda", "run", "-n", "po", "/bin/bash", "-c"]
# # RUN /root/anaconda/bin/conda install -y pytorch torchvision torchaudio cudatoolkit=11.3 -c pytorch && \
# #     pip install cvxpy cvxpylayers && \
# #     /root/anaconda/bin/conda install -y matplotlib pandas
# # RUN /root/anaconda/bin/conda install -y matplotlib

# # #  It's imperative that you install jupyter, in particular, to work with Gradient
# # RUN pip --no-cache-dir install jupyterlab
# # # RUN pip install notebook

# # # Use EXPOSE to instruct the image to expose ports as needed
# # EXPOSE 8888


# # # The main purpose of a CMD is to provide defaults for an executing container
# # # This CMD opens the jupyter notebook when you run the image
# # CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter-lab --ip 0.0.0.0 --allow-root --ip=0.0.0.0 --no-browser --ServerApp.trust_xheaders=True --ServerApp.disable_check_xsrf=False --ServerApp.allow_remote_access=True --ServerApp.allow_origin='*' --ServerApp.allow_credentials=True"]

# #  It's imperative that you install jupyter, in particular, to work with Gradient
# RUN pip install jupyter 

# # Use wget to grab files of interest to have in the container
# # RUN apt-get install -y wget

# # A sample notebook to use to confirm Tensorflow works
# RUN wget https://raw.githubusercontent.com/gradient-ai/TensorFlow/main/quick_start_beginner.ipynb


# # Use EXPOSE to instruct the image to expose ports as needed
# EXPOSE 8888


# # The main purpose of a CMD is to provide defaults for an executing container
# # This CMD opens the jupyter notebook when you run the image
# CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --ip 0.0.0.0 --no-browser --allow-root"]





# # Use the FROM instruction to pull other images to base your new one on
# FROM docker.io/paperspace/tensorflow:2.0.0-gpu-py3-jupyter-lab

# # Use the RUN instruction to make the image do a terminal command like behavior
# # Prevent conflicts with pip3
# RUN mv /usr/local/bin/pip /usr/local/bin/pip_2

# # Install Python and pip (pip3)
# RUN apt-get -y update && apt-get install -y python3-pip && pip3 install --upgrade pip

# RUN rm /usr/local/bin/pip && mv /usr/local/bin/pip_2 /usr/local/bin/pip


# # Some installs to facilitate the process.
# RUN pip install \
#     tensorflow-gpu \
#     scikit-learn \
#     scipy \
#     sklearn \
#     pandas \
#     Pillow \
#     matplotlib \
#     h5py \
#     mock \
#     certifi \
#     configparser \
#     enum34 \
#     funcsigs \
#     pathlib2 \
#     pbr \
#     scandir \
#     singledispatch \
#     webencodings 

# #  It's imperative that you install jupyter, in particular, to work with Gradient
# RUN pip install jupyter 

# # Use wget to grab files of interest to have in the container
# RUN apt-get install -y wget

# # A sample notebook to use to confirm Tensorflow works
# RUN wget https://raw.githubusercontent.com/gradient-ai/TensorFlow/main/quick_start_beginner.ipynb


# # Use EXPOSE to instruct the image to expose ports as needed
# EXPOSE 8888


# # The main purpose of a CMD is to provide defaults for an executing container
# # This CMD opens the jupyter notebook when you run the image
# CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --ip 0.0.0.0 --no-browser --allow-root"]

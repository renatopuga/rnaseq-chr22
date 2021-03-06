FROM gitpod/workspace-full

# Install custom tools, runtimes, etc.
# For example "bastet", a command-line tetris clone:
# RUN brew install bastet
#
# More information: https://www.gitpod.io/docs/config-docker/

RUN sudo apt-get update -y \
  && sudo DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata \ 
  && sudo apt-get install -y fastqc samtools bowtie2
COPY .gitpod.yml run.dow.apps.sh run.make.samples.sh run.merge.files.R run.star.rsem.sh Transcript2Symbol.txt ./
COPY reference ./reference 
COPY input ./input 
  
CMD ["samtools", "fastqc" , "bowtie2"]

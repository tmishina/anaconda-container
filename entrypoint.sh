#! /bin/sh

export PATH="/opt/anaconda3/bin:$PATH"
cd /host
jupyter notebook --port 8888 --ip 0.0.0.0 --allow-root --no-browser > log/jupyter.log 2>&1


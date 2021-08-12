FROM gitpod/workspace-full

USER gitpod

WORKDIR /home/gitpod

# Get the emsdk repo
RUN git clone https://github.com/emscripten-core/emsdk.git

# Enter that directory
WORKDIR /home/gitpod/emsdk

# Download and install the latest SDK tools.
RUN ./emsdk install 2.0.4

# Make the "latest" SDK "active" for the current user. (writes .emscripten file)
RUN ./emsdk activate 2.0.4

# Activate PATH and other environment variables in the current terminal
RUN . ./emsdk_env.sh

WORKDIR /home/gitpod

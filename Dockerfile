FROM swift:5.0.3

WORKDIR /SwagGen
COPY . /SwagGen
RUN make install

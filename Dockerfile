FROM ocaml/opam:ubuntu

USER opam
WORKDIR /home/opam/src

RUN sudo apt-get update && sudo apt-get install -y m4 libgmp-dev libcairo2-dev pkg-config z3 libz3-dev
RUN opam switch create 4.06.0 && eval $(opam env)
RUN opam depext -i conf-m4 cairo2 zarith jupyter jupyter-archimedes z3

COPY . .

CMD ["opam", "exec", "--", "jupyter", "notebook", "--ip", "0.0.0.0", "--no-browser", "--allow-root"]

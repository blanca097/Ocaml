FROM ocaml/opam:ubuntu

USER opam
WORKDIR /home/opam/src

RUN sudo apt-get update && sudo apt-get install -y m4 libgmp-dev z3 libz3-dev
RUN opam switch create 4.06.0 && eval $(opam env)
RUN opam depext -i z3

CMD ["opam", "exec", "--", "utop"]


run_ctfbox_16_04(){
    docker run -it --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v `pwd`:/home/ctf/chall ctfbox-16.04
}


alias ctfbox-16.04="run_ctfbox_16_04"

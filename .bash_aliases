# cap-add and security-opt options are required to use ptrace in docker
# https://stackoverflow.com/questions/19215177/how-to-solve-ptrace-operation-not-permitted-when-trying-to-attach-gdb-to-a-pro
run_ctfbox_16_04(){
    docker run -it --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v `pwd`:/home/ctf/chall ctfbox-16.04
}

run_ctfbox_18_04(){
    docker run -it --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v `pwd`:/home/admin/chall yasmu/ctf:18.04
}

run_ctfbox_19_04(){
    docker run -it --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v `pwd`:/home/admin/chall yasmu/ctf:19.04
}

run_ctfbox_19_10(){
    docker run -it --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v `pwd`:/home/admin/chall yasmu/ctf:19.10
}


alias ctfbox-16.04="run_ctfbox_16_04"
alias ctfbox-18.04="run_ctfbox_18_04"
alias ctfbox-19.04="run_ctfbox_19_04"
alias ctfbox-19.10="run_ctfbox_19_10"

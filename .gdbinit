define peda
source ~/peda/peda.py
end

define peda-arm
source ~/peda-arm/peda-arm.py
end

define pwn
source /opt/pwndbg/gdbinit.py
set telescope-skip-reapeating-val off
end

define gef
source ~/.gdbinit-gef.py
end


# xv6 stuff
add-auto-load-safe-path /home/ty/work/xv6-public/.gdbinit

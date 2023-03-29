# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific aliases and functions

# Python
export PATH=/share/exp/users/$USER/bin:$PATH
export LD_LIBRARY_PATH="/usr/local/cuda/lib64/:/usr/lib64/:/opt/intel/compilers_and_libraries_2019.5.281/linux/tbb/lib/intel64_lin/gcc4.7:/opt/intel/compilers_and_libraries_2019.5.281/linux/compiler/lib/intel64_lin:/opt/intel/compilers_and_libraries_2019.5.281/linux/mkl/lib/intel64_lin"

# Save history
function myLocalHistory()
{
        HISTORYLINE=`history | tail -1 | sed 's:^ *[0-9]* *::g' | useHistory`
        if [ ! -z "$HISTORYLINE" ] ; then
          ((date +%F.%H-%M-%S | tr -d '\n' ; echo " $HISTORYLINE") >>.history.$USER) 2>/dev/null
        fi
}
function h()
{
     tail .history.$USER 2>/dev/null
}
function gh()
{
     cat .history* | tr -d '\0' | cut -d ' ' -f2- | grep "$1"  2>/dev/null
}
function ghg()
{
     zgrep -a "$1" .history* | sed -e "s/.history\.\?\([^:]*\):\([^ ]*[0-9]*\) /: \2 \1 ; /" | sort -n 2>/dev/null
}
alias useHistory='grep -v "^ls$\|^ll$\|^l$\|^dir$\|^cd \|^h$\|^gh$\|^gh \|^bg$\|^fg$\|^qsm$\|^quser$\|^qstat \|^note \|^mutt\|^std\|^clear$"'
export PROMPT_COMMAND="myLocalHistory" # comment if you want to disable
                                       # your local .history file

                                                                 
############ User specific aliases #######################       
if [ -f ~/.bashrc.oskoller ]; then                               
    . ~/.bashrc.oskoller                                         
fi                                                               

#conda config --set changeps1 False
#echo $PS1
#PS1+="<\$(basename \"\$CONDA_DEFAULT_ENV)\">";
                                                          

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/share/exp/sw/python/Anaconda3-2022.07/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/share/exp/sw/python/Anaconda3-2022.07/etc/profile.d/conda.sh" ]; then
        . "/share/exp/sw/python/Anaconda3-2022.07/etc/profile.d/conda.sh"
    else
        export PATH="/share/exp/sw/python/Anaconda3-2022.07/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


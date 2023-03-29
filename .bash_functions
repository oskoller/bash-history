# save history
function myLocalHistory()
{
        HISTORYLINE=`history | tail -1 | sed 's:^ *[0-9]* *::g' | grep -v "^ls$\|^ll$\|^l$\|^dir$\|^cd \|^h$\|^gh$\|^gh \|^bg$\|^fg$\|^clear$"`
        if [ ! -z "$HISTORYLINE" ] ; then
          ((date +%F.%H-%M-%S | tr -d '\n' ; echo " $HISTORYLINE") >>.history.$USER) 2>/dev/null
        fi
}

# grep history
function gh()
{
     cat .history* | tr -d '\0' | cut -d ' ' -f2- | grep "$1"  2>/dev/null
}

# grep history with dates
function ghg()
{
     zgrep -a "$1" .history* | sed -e "s/.history\.\?\([^:]*\):\([^ ]*[0-9]*\) /: \2 \1 ; /" | sort -n 2>/dev/null
}

# save history on every prompt
# comment if you want to disable
# your local .history file
export PROMPT_COMMAND="myLocalHistory" 

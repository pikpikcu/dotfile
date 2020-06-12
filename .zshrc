#▄███████▄     ▄████████    ▄█    █▄       ▄████████  ▄██████
#██▀     ▄██   ███    ███   ███    ███     ███    ███ ███    ███
#     ▄███▀   ███    █▀    ███    ███     ███    ███ ███    █▀
#▀█▀▄███▀▄▄   ███         ▄███▄▄▄▄███▄▄  ▄███▄▄▄▄██▀ ███
# ▄███▀   ▀ ▀███████████ ▀▀███▀▀▀▀███▀  ▀▀███▀▀▀▀▀   ███
#▄███▀                ███   ███    ███   ▀███████████ ███    █▄
#███▄     ▄█    ▄█    ███   ███    ███     ███    ███ ███    ███
#▀████████▀  ▄████████▀    ███    █▀      ███    ███ ████████▀
#                                         ███    ███
#bash
blue="\e[94m"
printf "${blue}" 
figlet -f cosmic "pikpikcu"
echo
# TMUX
if [ "$TMUX" = "" ]; then
#    tmux kill-server
    tmux new
#    echo "pikpikcu" | figlet -f cosmic
    clear
fi
# TMUX - Kill dettached sessions
tdk() {
	tmux list-sessions | grep -E -v '\(attached\)$' |
		while IFS='\n' read line; do
    			tmux kill-session -t "${line%%:*}"
		done
}
source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.zsh
export ZSH="/home/xploit/.oh-my-zsh" # Path to your oh-my-zsh installation. # See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="tonotdo"
#ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
CASE_SENSITIVE="true" # Uncomment the following line to use case-sensitive completion.
HYPHEN_INSENSITIVE="false"
DISABLE_AUTO_UPDATE="true" # Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_UPDATE_PROMPT="true" # Uncomment the following line to automatically update without prompting.
#export UPDATE_ZSH_DAYS=13
DISABLE_MAGIC_FUNCTIONS="false"
DISABLE_LS_COLORS="false"
DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="false"
ZSH_CUSTOM=~/.oh-my-zsh/plugins/*
plugins=(
      common-aliases
      git
      zsh-autosuggestions
      zsh-syntax-highlighting
      lol
      nanoc
      mix
      nmap
      emoji
      zsh-navigation-tools
      vscode
      tmux
      tmuxinator
      tmux-cssh
      go
)
source $ZSH/oh-my-zsh.sh
# User configuration
export PATH=~/bin:~/go/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:~/.local/bin:/snap/bin:$PATH
export MANPATH="/usr/local/man:$MANPATH"
# PATH
PATH="/home/xploit/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/xploit/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/xploit/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/xploit/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/xploit/perl5"; export PERL_MM_OPT;
# zsh is able to auto-do some kungfoo
# depends on the SUFFIX :)
if is-at-least 4.2.0; then
  # open browser on urls
  if [[ -n "$BROWSER" ]]; then
    _browser_fts=(htm html de org net com at cx nl se dk)
    for ft in $_browser_fts; do alias -s $ft=$BROWSER; done
  fi
  _editor_fts=(cpp cxx cc c hh h inl asc txt TXT tex)
  for ft in $_editor_fts; do alias -s $ft=$EDITOR; done

  if [[ -n "$XIVIEWER" ]]; then
    _image_fts=(jpg jpeg png gif mng tiff tif xpm)
    for ft in $_image_fts; do alias -s $ft=$XIVIEWER; done
  fi
  _media_fts=(ape avi flv m4a mkv mov mp3 mpeg mpg ogg ogm rm wav webm)
  for ft in $_media_fts; do alias -s $ft=mplayer; done
  #read documents
  alias gf="/home/xploit/go/bin/gf"
  alias -s pdf=acroread
  alias -s ps=gv
  alias -s dvi=xdvi
  alias -s chm=xchm
  alias -s djvu=djview
  #list whats inside packed file
  alias -s zip="unzip -l"
  alias -s rar="unrar l"
  alias -s tar="tar tf"
  alias -s tar.gz="echo "
  alias -s ace="unace l"
fi
# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
## Set TTY Linux font [Terminus-normal-18 or 20 (for 15")]
if [[ "${TERM}" = linux ]]; then
	setfont ter-u18n -m 8859-2
fi
# Set Dircolors
if type dircolors >/dev/null; then
	if [[ -f ~/.dir_colors ]]; then
		eval "$(dircolors ~/.dir_colors)"
	elif [[ -f /etc/DIR_COLORS ]]; then
		eval "$(dircolors /etc/DIR_COLORS)"
	else
		eval "$(dircolors)"
	fi
fi
#      ▄███████▄  ▄█     ▄█   ▄█▄    ▄███████▄  ▄█     ▄█   ▄█▄  ▄████████ ███    █▄
#      ███    ███ ███    ███ ▄███▀   ███    ███ ███    ███ ▄███▀ ███    ███ ███    ███
#      ███    ███ ███▌   ███▐██▀     ███    ███ ███▌   ███▐██▀   ███    █▀  ███    ███
#      ███    ███ ███▌  ▄█████▀      ███    ███ ███▌  ▄█████▀    ███        ███    ███
#      ▀█████████▀  ███▌ ▀▀█████▄    ▀█████████▀  ███▌ ▀▀█████▄    ███        ███    ███
#      ███        ███    ███▐██▄     ███        ███    ███▐██▄   ███    █▄  ███    ███
#      ███        ███    ███ ▀███▄   ███        ███    ███ ▀███▄ ███    ███ ███    ███
#      ▄████▀      █▀     ███   ▀█▀  ▄████▀      █▀     ███   ▀█▀ ████████▀  ████████▀
#                       ▀                             ▀
# YOUTIBE DL
#alias wordlists ="word > wordlis.txt"
alias youtube-dl-best='youtube-dl -f "bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio" '
alias youtube-dl-480='youtube-dl -f "bestvideo[height<=480][ext=mp4]+bestaudio[ext=m4a]" '
alias youtube-dl-720='youtube-dl -f "bestvideo[height<=720][ext=mp4]+bestaudio[ext=m4a]" '
alias youtube-dl-4k='echo -e "This will transcode the video from webm to h264 which could take a long time\n\n"; youtube-dl -f "bestvideo[ext=webm]+bestaudio[ext=m4a]" --recode-video mp4 '
alias youtube-dl-mp3='youtube-dl --extract-audio -f bestaudio[ext=mp3] --no-playlist '
alias mp3="youtube-dl -x --audio-format mp3 "
#######################################################################################################################################

alias manager='synaptic-pkexec'

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
alias zshrc='${=EDITOR} ~/.zshrc' # Quick access to the ~/.zshrc file
alias c="clear" # clear
alias :q="exit"
alias listalias="declare -f;alias" ## List all alises and Functions
alias :q=q
alias ::q=q
alias :Q=q
alias ::Q=q
alias slurm="slurm -i wlp2s0" # Slurm set to wlp2s0 interface
alias st="speedtest --bytes" # SpeedTest set to bytes instead of bits
alias ag="/usr/bin/ag --nofollow --hidden --smart-case --stats --silent" ## Silver Searcher & GREP
alias upgrub="sudo grub-mkconfig -o /boot/grub/grub.cfg" ## GRUB Updater hook
#alias btc='echo "[ Bluetooth manager <CLI> ]" ; bluetoothctl' ## Bluetooth manager ( CLI )
# Alias ##
# Alias Hackers
alias arjun="~/pikpikcu/Arjun/arjun.py"
alias parrot="curl parrot.live" ## Parrot Fun
alias a2='echo "[ Aria2 Custom Config Download ]"; aria2c' ## Aria2 shortcut
alias matrix='LC_ALL=C tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
alias osint="osint"
alias laz="lazyrecon"
alias gau="gauu"
alias py="python" # python
alias py3="python3" # python3
alias k="knockpy" # subdomains enumeration
alias sf="subfinder -nW -silent" #subdomains scanners
alias adbf="adb forward tcp:31415 tcp:31415" # Adb connection
alias tnn="cd ~/src/github.com/tomnomnom" # tomnomnom hacker
alias ds="dirsearch -2 -f -waf -t 50 -w ~/pikpikcu/recon/wordlists/personal.txt -u"
alias dss="dirsearch  -w ~/pikpikcu/recon/wordlists/personal.txt -u"
alias ds1="dirsearch -2 -f -waf -t 50  -w ~/pikpikcu/recon/wordlists/personal.txt -L"
alias goaltdns="goaltdns -w ~/pikpikcu/subfinder/goaltdns/words.txt"
alias hf="htmlfilter"
#alias recon="cd ~/pikpikcu/recon" # recon tools
#alias shot="python /Users/sahil/opt/recon/webscreenshot/webscreenshot.py"
#alias mobsf="docker run -it -p 8000:8000 opensecurity/mobile-security-framework-mobsf:latest"
alias norg="gron --ungron"
alias ungron="gron --ungron"
alias phpunit='phpunit --colors'
alias flush__dns="dscacheutil -flushcache"
alias myip2='dig ANY +short @resolver2.opendns.com myip.opendns.com' # DNS lookup utility #https://linuxize.com/post/how-to-find-ip-address-linux/#disqus_thread
# netcat
alias flush__memcached="echo 'flush_all' | nc localhost 11211" # netcat
alias backdoor="nc -lvp 1234"
# GREP
alias ugrep="faurls | tac | urlgrep.sh -s0.08" # Use my urlgrep.sh to grep text from URLs
alias grep="grep --color=auto" # grep(REGEX)
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias igrep='grep -i'
alias psg='ps aux | grep'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '
alias hgrep="fc -El 0 | grep"
alias gg='git grep -ni'
alias t='tail -f'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias lastl='last | head -5 | tr -s " "' # Last log-ins
alias -g NUL="> /dev/null 2>&1"
alias hgrep="fc -El 0 | grep"
# Tail
alias follow="tail -f -n +1"
alias sortnr='sort -n -r'
## Custom Calendar
alias cal="cal -3s"
# DIR
alias PWD="pwd" #cek location dir
alias ..='cd ..'
alias ...='cd ...'
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../../../"
#alias ~='cd ~/' #home user
alias mkdir="mkdir -pv"
alias cda="cd ~/arq/"
alias cdw="cd ~/Downlods"
alias cdd="cd ~/Documents"
alias cdm="cd ~/bin/markets"
alias cdmnt="cd /run/media"
alias cds="cd ~/bin"
alias cdb="cd ~/bak/"
alias cdt="cd ~/tmp"
#mkcd() { mkdir "$1" && cd "$1";}
# LS
alias l.='ls -d .* --color=tty'
alias ll='ls -l --color=tty'
alias lsc='ls --color=tty'
alias ll='ls -hal'
alias cl='curl -L'
alias sl='ls'
alias l='ls -lFh'     #size,show type,human readable
alias la='ls -lAFh'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh'   #long list,sorted by date,show type,human readable
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'
# Count log-ins
alias countl='for user in $(ls /home); do echo -ne "$user\t"; last $user | wc -l; done' # REF: https://www.networkworld.com/article/3431864/keeping-track-of-linux-users-when-do-they-log-in-and-for-how-long.html
# CP/mv/rm/find/ps
alias rm='rm -i'
alias cp='cp -i' # confirm before overwriting something
alias mv='mv -i'
alias fd='find . -type d -name'
alias ff='find . -type f -name'
alias lastchanges='find . -type f -print0 | xargs -0 stat -f "%m %N" | sort -rn | cut -f2- -d" "'
alias cp='cp --interactive' ## Copying: '-i' interactively & recursively on
alias mv='mv --interactive' # MV usage eg: xargs mv -t /app/dest/ < /tmp/list.txt
alias h='history'
alias p='ps -f'
alias unexport='unset'
alias cs="composer"
alias v="vagrant"
# EDITOR
alias vimpress="VIMENV=talk vim"
alias np='nano -w PKGBUILD'
alias vi="vim"
alias v=vim
alias e=vim
alias vf=vifm
alias vimdiff='vimdiff "+colorscheme default" "+syntax off" "+set t_Co=16"'
#alias more=less
alias vless=/usr/share/vim/vim81/macros/less.sh
alias lvim='vim -c "normal '\''0"' # With "'0", you can jump back to the file and line where you exited Vim
alias vbak="~/bak/vim_autobak/backup" # Check VIM backup files
alias vswap="vim -r;cd ~/bak/vim_autobak/swap; ls -a" # Go to VIM swap dir
## Edit RC files
alias vrc="vim ~/.vimrc"
alias vfrc="vim ~/.config/vifm/vifmrc"
alias xrc="vim ~/.Xresources"
alias xbk="vim ~/.xbindkeysrc"
#alias scrc="vim ~/.screenrc"
alias trc="vim ~/.tmux.conf"
alias mrc="vim ~/.mutt/muttrc"
alias sbrc=". ~/.bashrc"
alias szrc=". ~/.zshrc"
alias src=". ~/.rc"
# font ## Check font list
alias fontlist="fc-list | col | sort | less" #https://wiki.netbsd.org/tutorials/how_to_use_ttf_fonts_in_xterm/
alias bigger='echo "setfont iso02-12x22"; setfont iso02-12x2' ## Set bigger font for terminal
alias which='alias | /usr/bin/which --tty-only --read-alias --show- dot --show-tilde'
# rm(remove)
alias rm='rm -I' ## Removing files; set -I to interactively ask once;
#alias rmf="rm -rf" # don't stupid
# MAN
alias help='man'
# du
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias biggest="du -h --max-depth=1 | sort -h"
# linux
alias visudo="sudo /usr/bin/visudo" ## Visudo
alias wc="wc -l"
alias sc="screen" # GNU Screen Multiplexer
alias -g P="2>&1| pygmentize -l pytb"
alias df='df -h'  # human-readable sizes
#alias free='free -m' # show sizes in MB
alias j="jobs"
alias x="startx" ## Command to start X Server from .xinit file
alias ka="killall" # Kill process
# docker
alias d="sudo docker"
# Tmux
alias tls="tmux ls"
alias ta="tmux attach-session -t"
#same as chmod +x [file1] [file2]
alias cx='chmod +x'
# Set combined sound sinks for my laptop
alias sas="~/bin/sas.sh"
alias sase="~/bin/sas.sh && exit"
# Wallet and Trading Monitoring
alias W=walletmonitor.sh
alias T=tradingview.sh
## Wifi Passwords #  All conections #####################
alias wifipsks="sudo find /etc/NetworkManager/system-connections -type f -exec cat {} \; | grep -w -e '^id=*' -w -e '^psk=*'"
alias wifipsk="sudo cat '"/etc/NetworkManager/system-connections/$(iw dev | grep ssid | awk '{print $2}').nmconnection"' |  grep -e '^id=*' -e '^psk=*'" # Current connection #https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/Existe-algum-comando-para-exibir-a-senha-do-wifi-que-estou-conectado-no-momento/?pagina=1
## OpenX.sh
alias openx="~/bin/markets/openx.sh"
## CoinLayer.com
alias clay="~/bin/markets/clay.sh"
## Mycurrency.net
alias myc="~/bin/markets/myc.sh"
## Exchangerates.com
alias erates="~/bin/markets/erates.sh"
## Blockchain.info
alias binfo="~/bin/markets/binfo.sh"
## Bitstamp
alias bitstamp="~/bin/markets/bitstamp.sh"
## Binance.sh
alias binance="~/bin/markets/binance.sh"
## CoinGecko.com
alias cgk="~/bin/markets/cgk.sh"
## CoinMarketCap.com
alias cmc="~/bin/markets/cmc.sh"
# Cointop
alias ctop="cointop --hide-chart"
alias cointop="cointop --hide-chart"
## Bc
alias cc="bc -l <<<'"
# To find any files not owned by the user in $HOME as a result of sudo
alias homesudo="find $HOME ! -uid $(id -u) ! -gid $(id -g)"
#Espeak config
alias espeak='espeak -a30 -s150 -p30'
## SCRIPT SHORTCUTS
#alias anta="~/bin/anta.sh"
##########################################################################
#             ,--.,--.           ,--.,--.                                #
#             ,---. `--'|  |,-.  ,---. `--'|  |,-. ,---.,--.,--.         #
#             | .-. |,--.|     / | .-. |,--.|     /| .--'|  ||  |        #
#             | '-' '|  ||  \  \ | '-' '|  ||  \  \\ `--.'  ''  '        #
#             |  |-' `--'`--'`--'|  |-' `--'`--'`--'`---' `----'         #
#             `--'               `--'                                    #
##########################################################################
#Edit test scripts
#et() { vim ~/bin/test.sh;}
#et2() { vim ~/bin/test2.sh;}
#Run tests
#t1() { ~/bin/test.sh ${@};}
#t2() { ~/bin/test2.sh ${@};}
## Test shell performance
#fasts(){ strace -cf bash -c 'for i in $(seq 1 1000); do bash -c ":"; done';}
cloudflare() {
	python ${HOME}/bin/cloudflare/cloudflair.py "${1}"
	#https://medium.com/bugbountywriteup/bypass-cloudflare-waf-to-pwned-application-2c9e4f862319
	#https://github.com/christophetd/CloudFlair
}
#Use WASD to move
tron() { ssh sshtron.zachlatta.com;} # games
htmlfilter() { sed 's/<[^>]*>//g';}
#Curly Brackets removal
htmlfilter2() { sed ':again;N;b again; s/{[^}]*}//g'; } #https://unix.stackexchange.com/questions/166873/how-can-i-delete-all-text-between-curly-brackets-in-a-multiline-text-file
cssfilter() { sed "s@/\*.*\*/@@g" | sed '/\/\*/,/\*\//d';} #https://www.linuxquestions.org/questions/programming-9/remove-css-comments-with-sed-776853/
# Curl + htmlfilter - blank lines
chf() { curl -sLb cookiefile "${1}" | sed -e 's/<[^>]*>//g' -e '/^\s*$/d';}
# Website links?
sedlinks() {  sed -r 's/.*"(http.*)".*/\1/g';}
##################################################
################ MARKET FUNCTIONS ################
##################################################
#MOP -- See Stocks the hacker Way
mop() { go run ~/go/src/github.com/mop-tracker/mop/cmd/mop/main.go;}
#HEX rate in USD
hex() { (
	date
	DATA="$(curl -s "https://api.exchange.bitcoin.com/api/2/public/ticker")"
	HEXETH="$(jq -r '.[]|select(.symbol == "HEXETH")|.last' <<<"${DATA}")"
	ETHUSD="$(jq -r '.[]|select(.symbol == "ETHUSD")|.last' <<<"${DATA}")"
	echo "Bitcoin.com Ticker"
 	column -et -s' ' <<-!
		$(jq -r '.[]|select(.symbol == "HEXETH")'<<<"${DATA}"|tr -d '",}{'|sed 's/^\s\s*//g'|tac)
		!
	echo "HEXETH:       $HEXETH"
	echo "ETHUSD:       $ETHUSD"
	echo
	bc -l <<<"$HEXETH*$ETHUSD" | xargs printf 'BITCOIN.COM:  %.10f\n'
	cgk.sh hex usd | xargs printf 'CGK________:  %.10f\n'
	cmc.sh hex usd | xargs printf 'CMC________:  %.10f\n'
	) | tee -a ~/.hexRecord
	}
#Count better and worse performing top coin compared to BTC
cmcc() { (
	TOP="${1:-15}"
	DATA0="$(cmc -t $TOP btc)"
	DATA1="$(cmc -t $TOP usd)"
	A1=$(awk '{print $5}'<<<"$DATA0" | sed '1,2d' | grep -cv '^-')
	B1=$(awk '{print $5}'<<<"$DATA0" | sed '1,2d' | grep -c '^-')
	C1=$(awk '{print $5}'<<<"$DATA1" | sed '1,2d' | grep -cv '^-')
	D1=$(awk '{print $5}'<<<"$DATA1" | sed '1,2d' | grep -c '^-')
	A24=$(awk '{print $6}'<<<"$DATA0" | sed '1,2d' | grep -cv '^-')
	B24=$(awk '{print $6}'<<<"$DATA0" | sed '1,2d' | grep -c '^-')
	C24=$(awk '{print $6}'<<<"$DATA1" | sed '1,2d' | grep -cv '^-')
	D24=$(awk '{print $6}'<<<"$DATA1" | sed '1,2d' | grep -c '^-')
	A7=$(awk '{print $7}'<<<"$DATA0" | sed '1,2d' | grep -cv '^-')
	B7=$(awk '{print $7}'<<<"$DATA0" | sed '1,2d' | grep -c '^-')
	C7=$(awk '{print $7}'<<<"$DATA1" | sed '1,2d' | grep -cv '^-')
	D7=$(awk '{print $7}'<<<"$DATA1" | sed '1,2d' | grep -c '^-')
	echo -e "Coins: $TOP"
	column -et -s= -NxBTC,POS,NEG -RxBTC,POS,NEG <<-!
		1H=$A1=$B1
		24H=$A24=$B24
		7D=$A7=$B7
		!
	echo
	column -et -s= -NxUSD,POS,NEG -RxUSD,POS,NEG <<-!
		1H=$C1=$D1
		24H=$C24=$D24
		7D=$C7=$D7
		!
		:<<-!
		POS=${A1}=${B1}=${A24}=${B24}=${A7}=${B7}
		NEG=${C1}=${D1}=${C24}=${D24}=${C7}=${C7}
		!
	);}
#Loop: Pegar resultado da média do brasilbtc.sh
lbrasilbtc.sh() { while :; do brasilbtc.sh -mm; sleep 5m; done;}
#Dominance Cryptomarket
dom() {
	printf "Coin dominance watch 10m.\n"
	watch -d -t -n600 '~/bin/markets/cgk.sh -m | grep  -A11 -i Dominance'
}
## Lista de ações da BOVESPA
lstocks() {
	set -- "${1}" "${2}"
	if [[ "${1}" = "-h" ]]; then
		echo "Lista de ações  : lstocks"
		echo "Somente ações P*: lstocks -o P"
		echo "Busca comum     : lstocks | grep -i \"nome_ação\""
		echo "Busca assíncrona: lstocks -a \"nome_ação\""
		return 0
	fi
	if [[ "${1}" = "-a" ]]; then
		#export local SEARCH="${2:-.}"
		for i in {{A..Z},{0..9}}; do
			(curl -s "https://br.advfn.com/bolsa-de-valores/bovespa/${i}" |
				htmlfilter | sed -n '/Ação/,/var ZD_USER/p' |
				sed -e '1d' -e '$d' | awk 'NF' | grep -i "${2:-.}" &)
		done
		return
	elif [[ "${1}" = "-o" ]]; then
		local ONLY="${2:0:1}"
		curl -s "https://br.advfn.com/bolsa-de-valores/bovespa/${ONLY}" |
			htmlfilter | sed -n '/Ação/,/var ZD_USER/p' |
			sed -e '1d' -e '$d' | awk 'NF'
	else
		for i in {{A..Z},{0..9}}; do
			curl -s "https://br.advfn.com/bolsa-de-valores/bovespa/${i}" |
				htmlfilter | sed -n '/Ação/,/var ZD_USER/p' |
				sed -e '1d' -e '$d' | awk 'NF'
		done
	fi
}
## Google Finances Hack
gfin() {
	curl -s 'https://www.google.com/async/finance_wholepage_price_updates?ei=ywprXZHwMcCy5OUPqeK3qAw&yv=3&async=mids:%2Fm%2F016yss%7C%2Fg%2F1q6b4f1pf%7C%2Fm%2F04xjcr%7C%2Fm%2F07zm2vb%7C%2Fm%2F07zllzd%7C%2Fm%2F07zln_9%7C%2Fm%2F02853rl%7C%2Fm%2F04zvfw%7C%2Fm%2F0877z%7C%2Fm%2F046k_p%7C%2Fm%2F02hl6w%7C%2Fm%2F04ww1p%7C%2Fm%2F0b18t%7C%2Fm%2F016j14%7C%2Fm%2F04t5sp,currencies:%2Fm%2F02l6h%2B%2Fm%2F09nqf%7C%2Fm%2F09nqf%2B%2Fm%2F088n7%7C%2Fm%2F01nv4h%2B%2Fm%2F09nqf%7C%2Fm%2F09nqf%2B%2Fm%2F0ptk_%7C%2Fm%2F09nqf%2B%2Fm%2F02nb4kq%7C%2Fm%2F09nqf%2B%2Fm%2F0hn4_%7C%2Fm%2F0kz1h%2B%2Fm%2F09nqf,_fmt:jspb' |
		htmlfilter |
		grep -E "\"*[[:digit:]]+.[[:digit:]]+\"" |
		grep -oP '"\K[^"]+' |
		grep -Ev -e '^,$' -e 'newwindow' -e 'search' -e '[[:digit:]]+]' -e '^]$' -e 'null' -e '/m/' -e '/g/' |
		sed -e 's/,.,/\n/g' -e 's/,$//g' -e 's/^,//g' -e 's/\\u0026/\&/g' |
 		grep --color=never -i -e "${1}" -A6 -B3
	return
}
## Yahoo Finance Hack for Stocks
yfin() {
	# Help
	if [[ "${1}" = "-h" ]]; then
		printf "Usage: yfin [yahoo_finance_stock_code]  #defaults='IBV=F'\n"
		printf "       yfin -l IBV=F  #use local time\n"
		return 0
	fi
	# Test if you want local timestamps
	test "${1}" = "-l" && set -- "${2}" || local UTCSET="-u"
	# Teste se há input
	test -z "${1}" && set -- "IBV=F" #^IXIC ^DJI VALE3.SA PETR4.SA XAUUSD=X XAGUSD=X
	# Get JSON
	local YJSON="$(curl -s "https://query1.finance.yahoo.com/v8/finance/chart/${1}?region=US&lang=en-US&includePrePost=false&interval=1d&range=1d&corsDomain=finance.yahoo.com&.tsrc=finance" --compressed)"
	# Print JSON?
	if [[ -n "${JSON}"  ]]; then
		printf "%s\n" "${YJSON}"
		return
	fi
	# Checagem de erro
	if [[ "$(printf "%s\n" "${YJSON}" | jq -r '.chart.error.code//empty')" =~ [a-zA-Z] ]]; then
		printf "%s\n" "${YJSON}" | jq -r '.chart.error.description'
		return 1
	fi
	(
	# Stock Info
	printf "%s\n" "${YJSON}" | jq -r '.chart.result[].meta| "Symbol  : \(.symbol)  Currency: \(.currency)","Exchange: \(.exchangeName)  Type: \(.instrumentType)","Price   : \(.regularMarketPrice)"'
	# Update
	printf "Update  : %s  Local: %s\n" "$(printf "%s\n" "${YJSON}" | jq -r '.chart.result[].timestamp[]' | tail -n1 | xargs -i date ${UTCSET} -d@"{}" "+%FT%T%Z")" "$(printf "%s\n" "${YJSON}" | jq -r '.chart.result[].timestamp[]' | tail -n1 | xargs -i date -d@"{}" "+%FT%T%Z")"
	# Hours
	printf "Trading hours:\n"
	printf "Pre     : %s  %s\n" "$(printf "%s\n" "${YJSON}" | jq -r '.chart.result[].meta.currentTradingPeriod.pre.start' | xargs -i date ${UTCSET} -d@"{}" "+%FT%T%Z")" "$(printf "%s\n" "${YJSON}" | jq -r '.chart.result[].meta.currentTradingPeriod.pre.end' | xargs -i date ${UTCSET} -d@"{}" "+%FT%T%Z")"
	printf "Regular : %s  %s\n" "$(printf "%s\n" "${YJSON}" | jq -r '.chart.result[].meta.currentTradingPeriod.regular.start' | xargs -i date ${UTCSET} -d@"{}" "+%FT%T%Z")" "$(printf "%s\n" "${YJSON}" | jq -r '.chart.result[].meta.currentTradingPeriod.regular.end' | xargs -i date ${UTCSET} -d@"{}" "+%FT%T%Z")"
	printf "Post    : %s  %s\n" "$(printf "%s\n" "${YJSON}" | jq -r '.chart.result[].meta.currentTradingPeriod.post.start' | xargs -i date ${UTCSET} -d@"{}" "+%FT%T%Z")" "$(printf "%s\n" "${YJSON}" | jq -r '.chart.result[].meta.currentTradingPeriod.post.end' | xargs -i date ${UTCSET} -d@"{}" "+%FT%T%Z")"
	) 2>/dev/null
}
##Yahoo Finance OIL
yoil() { yfin CL=F | grep -ie price -e update; }
## Tesouro  Direto -- Precos e Taxas dos Titulos
tesouro() {
	wget -qO- 'http://www.tesouro.fazenda.gov.br/tesouro-direto-precos-e-taxas-dos-titulos' | xmlstarlet format --recover --html 2>/dev/null | xmlstarlet select --html --template --value-of "/html/body/div/div/div/div/div/div/div/div/div/div/table/tbody/tr/td[@class='listing0' or @class='listing' or @class='listing ']" | paste -d ";" - - - - - | column -s ';' -t
	printf "<http://www.tesouro.fazenda.gov.br/tesouro-direto-precos-e-taxas-dos-titulos>.\n"
}
# From: https://stackoverflow.com/questions/47593807/how-to-scrape-a-html-table-and-print-it-on-terminal-using-bash
## Crypto Rates & Charts
rates() {
	if [[ ${*} = help ]]; then
		curl -s "rate.sx/:help"
		return
	fi
 	curl -s 'rate.sx/?TFq' | sed -e '1,6d' -e '$d'
}
rate() {
	if [[ -z ${*} ]]
	then
		set -- btc usd
	elif [[ -z ${2} ]] || [[ ${2} =~ [0-9] ]]; then
		set -- ${1} usd ${2}
	elif [[ ${*} = :help ]]
	then
		curl -s "rate.sx/:help"
		return
	fi
	printf "Rate [from_currency] [to_currency] [@date|?T|..]\n"
	#printf "Default: btc in usd today"
	#printf "Max backwards date is 2018-01-07"
	curl -s "${2}.rate.sx/${1}${3}" | awk NF
}
# Bitcoin addresses
#Private keys
btcgrep0() { grep -e '[5KL][1-9A-HJ-NP-Za-km-z]\{50,51\}';}
#Perhaps add word boundary \b symbols?
#https://bitcoin.stackexchange.com/questions/56737/how-can-i-find-a-bitcoin-private-key-that-i-saved-in-a-text-file
btcgrep1() { grep -E '(bc1|[13])[a-zA-HJ-NP-Z0-9]{25,39}';}
#https://stackoverflow.com/questions/21683680/regex-to-match-bitcoin-addresses
btcgrep2() { grep -E '[^13][a-km-zA-HJ-NP-Z1-9]{25,34}';}
#https://bitcoin.stackexchange.com/questions/89065/grep-help-bitcoin-address-key-buried-as-text-somewhere-on-hdd
# Segwit only?
btcgrep3() { grep -Ee '\bbc(0([ac-hj-np-z02-9]{39}|[ac-hj-np-z02-9]{59})|1[ac-hj-np-z02-9]{8,87})\b';}
#Bitcoin transaction
btctxgrep() { grep -E '\s[0-9a-f]{64}\s';}
# ETH addresses
ethgrep() { grep -Ei -e "(0x)?[0-9a-f]{40}";}
#https://ethereum.stackexchange.com/questions/1374/how-can-i-check-if-an-ethereum-address-is-valid
##################################################
############## END MARKET FUNCTIONS ##############
##################################################
# cacalib, chafa and aalib
#AA lib Fire test
fire() { aafire -driver curses -bold -reverse -dim -eight -gamma 0.5 -floyd_steinberg;}
fire2() { CACA_DRIVER=ncurses cacafire;}
# Remove duplicate lines
#rdl() { awk '!visited[$0]++';}
# rdl1() { cat -n | sort -uk2 | sort -nk1 | cut -f2-;}
#https://opensource.com/article/19/10/remove-duplicate-lines-files-awk
##########################################################################
#             ,--.,--.           ,--.,--.                                #
#             ,---. `--'|  |,-.  ,---. `--'|  |,-. ,---.,--.,--.         #
#             | .-. |,--.|     / | .-. |,--.|     /| .--'|  ||  |        #
#             | '-' '|  ||  \  \ | '-' '|  ||  \  \\ `--.'  ''  '        #
#             |  |-' `--'`--'`--'|  |-' `--'`--'`--'`---' `----'         #
#             `--'               `--'                                    #
##########################################################################
# Youtube-Dl
## ( configuration file at '~/.config/youtube-dl/config' )
yt() { youtube-dl ${@};}
## Download video of best quality ( may download video and audio
## separetedly and then put them together afterwards )
ytb() {
	echo '[ Download best quality video & audio ]'
	youtube-dl -f best ${@}
}
## Download video of medium quality ( codec number is set to 18 )
ytc() {
	echo '[ Download medium quality video ]'
	youtube-dl -f 18 ${@}
}
## Download from file '~/Downloads/yt.txt' --batch-file
ytt() {
	local URLFILE="${HOME}/Downloads/yt${1}.txt"
	printf "[ Download medium quality video from ]\n"
	printf "[ textfile; Deletes .txt on success  ]\n"
	if youtube-dl -f 18 --batch-file "${URLFILE}"; then
		mv "${URLFILE}" ~/.local/share/Trash/files
	fi
}
#wordlists
#word() {
#    :waybackurls $1 | grep "?" | unfurl keys | sort -u | tee -a wordlists.txt 
#    }
## Download audio and convert it to mp3
yta() {
	echo "[ Download & convert to mp3 ]"
	youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 \
	--metadata-from-title "(?P<artist>.+?) - (?P<title>.+)" \
       	--embed-thumbnail --add-metadata -o "~/Documents/Music/%(title)s.%(ext)s" "${@}"
}
## Download and convert to mp3 from yt.txt --batch-file same as -a
ytta() {
	echo "[ Download & convert to mp3 from textfile ]"
	youtube-dl -f bestaudio --extract-audio --audio-format mp3 --audio-quality 0 \
	--metadata-from-title  "(?P<artist>.+?) - (?P<title>.+)"  \
	--embed-thumbnail --add-metadata -o "~/Documents/Music/%(title)s.%(ext)s" \
	--batch-file "/home/jsn/Downloads/yt.txt" "${@}" &&
		trash-put ~/Downloads/yt.txt
	}
## Grep media info the correct way ( in JSON _)
ffinfo() { ffprobe -show_streams -print_format json file:2019-04-30-205124.webm 2>/dev/null; }
ffinfores() { ffinfo "${1}" | jq -r '[.streams[] | select(.codec_type == "video")][0] | "\(.width) \(.height)" '; }
# Find out where a mount/partition or file is
wherep() {
	test -z "${@}" && set .
	df -P  "${@}" | tail -1 | cut -d' ' -f 1
}
## Quitting like in Vim/ViFM
q() {
	echo '[bye pikpikcu..]'
	sleep 0.25
	exit
}
# (numerical chmod permissions) and file name
stat() {
	if [[ -z $1 ]]; then
		/usr/bin/stat -c "%a %u %U >> %n" -- *
	else
		/usr/bin/stat -c "%a %u %U >> %n" "${1}"
	fi
}
# Remove past text
clr() { printf '\033[2J'; }
#Copy buffer to clipboard
clip() { cat | xsel -b;}
# Coloured man pages:
mans() {
	if [ "$TERM" = 'linux' ]; then
		env \
			LESS_TERMCAP_mb=$(printf "\e[34m") \
			LESS_TERMCAP_md=$(printf "\e[1;31m") \
			LESS_TERMCAP_me=$(printf "\e[0m") \
			LESS_TERMCAP_se=$(printf "\e[0m") \
			LESS_TERMCAP_so=$(printf "\e[44;93m") \
			LESS_TERMCAP_ue=$(printf "\e[0m") \
			LESS_TERMCAP_us=$(printf "\e[32m") \
					/usr/bin/man "$@"
	else
		env \
			LESS_TERMCAP_mb=$(printf "\e[1;34m") \
			LESS_TERMCAP_md=$(printf "\e[38;5;9m") \
			LESS_TERMCAP_me=$(printf "\e[0m") \
			LESS_TERMCAP_se=$(printf "\e[0m") \
			LESS_TERMCAP_so=$(printf "\e[44;93m") \
			LESS_TERMCAP_ue=$(printf "\e[0m") \
			LESS_TERMCAP_us=$(printf "\e[38;5;10m") \
					/usr/bin/man "$@"
	fi
}
xhost +local:root > /dev/null 2>&1
# ex - archive extractor
# # usage: ex <file>
ex() {
 if [ -f "${1}" ] ; then
 case "${1}" in
   *.tar.bz2)   tar xjf "${1}"   ;;
   *.tar.gz)    tar xzf "${1}"   ;;
   *.bz2)       bunzip2 "${1}"   ;;
   *.rar)       unrar x "${1}"   ;;
   *.gz)        gunzip "${1}"    ;;
   *.tar)       tar xf "${1}"    ;;
   *.tbz2)      tar xjf "${1}"   ;;
   *.tgz)       tar xzf "${1}"   ;;
   *.zip)       unzip "${1}"     ;;
   *.Z)         uncompress "${1}";;
   *.7z)        7z x "${1}"      ;;
   *.tar.*) tar xvf "${1}"       ;;
   *)           echo "'$1' cannot be extracted via ex()" ;;
   esac
 else
   echo "'$1' is not a valid file"
 fi
}
grepid() { # Grep pid and program which is executing
  ps -eo ppid,pid,cmd | awk '{p[$1]=p[$1]","$3}END{ for(i in p) print i, p[i]}';
}
hsy() { ## Shell History
	[[ -n "$ZSH_VERSION" ]] && set -- "${1:-0}"
	history "${@}"
}
gconf() { ## Edit GRUB configuration file
	sudo vim /etc/default/grub
	printf "Don't forget to update GRUB!" 1>&2
}
sdh() ## ShutDown Halt
{
	printf '[halt]\n'
	sleep 1
	sudo systemctl poweroff
	#sudo shutdown -h now
	#xfce4-session-logout --halt
}
sdr() ## ShutDown Restart
{
	printf '[reboot]\n'
	sleep 1
	sudo systemctl reboot
	#sudo shutdown -r now
	#xfce4-session-logout --reboot
}
out() { # XFCE4 logout
	if [[ -n "${TMUX}" ]]; then
		printf "Cannot run xfce4-session under Tmux.\n" 1>&2
		sleep 0.6
		exit 1
	fi
	xfce4-session-logout --fast --logout
}

sdk() { # Screen Kill Detached Sessions
  screen -ls | grep Detached | cut -d. -f1 | awk '{print $1}' | xargs kill ;
}
sls() { # List screen processes
	screen -list | grep -Eo "[0-9]{4,}" | xargs -n 1 pstree -p;
} #https://askubuntu.com/questions/302662/reattaching-to-an-existing-screen-session
screencht() {
   w3m http://aperiodic.net/screen/quick_reference;
 } # GNU Screen cheat sheet
 ku() { ## Kill user #SIGINT = 1 , SIGKILL = 9 , SIGTERM = 15
 sudo pkill -15 -u "${1}";
}
batt () { # How to check battery level on arch linux
        X=$(cat /sys/class/power_supply/BAT0/energy_now)
        Y=$(cat /sys/class/power_supply/BAT0/energy_full)
        python2 -c "z=$X/$Y.; print('%.2f' % z)"
}
rr() { ## Reload .Xresources
	xrdb -remove
	sleep 2
	xrdb ~/.Xresources
	sleep 2
	xrdb -query
	echo "[.xresources reloaded]"
}
kk() { ## Rebind Keys
	killall -15 xbindkeys
	sleep 2
	xbindkeys  #-f ~/.xbindkeysrc
	sleep 2
	xbindkeys --show
}
brc() { ## Edit .bashrc & source it
	vim ~/.bashrc
	if [[ -n "$BASH_VERSION" ]]; then
		printf '[sourcing ~/.bashrc]\n'
		. ~/.bashrc
	fi
}
zrc() { # Edit .zshrc && source it
	vim ~/.zshrc
	if [[ -n "$ZSH_VERSION" ]]; then
		print '[sourcing ~/.zsh]'
		. ~/.zshrc
	fi
}
rc() { # Edit .rc && source it
	vim ~/.rc
	printf '[sourcing ~/.rc]\n'
	. ~/.rc
}
gitc() { # Copy and Print text files from GitHub repos
	#tmp file setting
	local TMPF="/tmp/${1##*/}"
	#if no arg given
	if [[ -z "${1}" ]]; then
		#z-shell completion help
		if [[ -n $ZSH_VERSION ]] && [[ -z $OK ]]; then
			OK=1
			print -z "file= ; gitc mountaineerbr/dotfiles/\$file \#> ~/\$file"
			return
		#help tip
		else
			cat <<-!
			SYNOPSIS
			        Download and print a textfile from GitHub.

				$ gitc git_user/repo/file

				Ex: gitc mountaineerbr/dotfiles/.bashrc
				    gitc mountaineerbr/dotfiles/master/.bashrc
			!
			return
		fi
	fi
	#get file and test
	set -- "${1#/}"
	testf() { head "${TMPF}" | grep -q -e '404: Not Found' -e '400: Invalid request';}
	if { ! curl -s "https://raw.githubusercontent.com/${1}" > "${TMPF}" || testf;} &&
		{ ! curl -s "https://raw.githubusercontent.com/${1%/*}/master/${1##*/}" > "${TMPF}" || testf;}; then
			rm "${TMPF}"
			printf "Error. Bad git file path?\n" 1>&2
			return 1
	fi
	#print file
	cat "${TMPF}"
	{
	#Check MD5 checksum
	md5sum "${TMPF}"
	#Compare with local file
	find -P "${HOME}" -maxdepth 3 -name "${1##*/}" -exec md5sum {} \;
	} 1>&2
}
# Reset all cloned repo
gitres() {
	git fetch --all || return 1
	git reset --hard origin/master
}
# Revert one file
gitout() {
	git checkout HEAD -- "${1}" #my-file.txt
}
# Start conkies
conkies() { ~/bin/conkykiller.sh; }
meminfo() { # memory info
	cat /proc/meminfo
	printf '\n'
	free -m
	printf '\n'
	vmstat
}
mnt() {
	mount | awk -F' ' '{ printf "%s\t%s\n",$1,$3; }' |
		column -t | egrep ^/dev/ | sort
}
## Monitor Selection Buffers
# With XSEL
clipboard() {
	while :; do
		echo -ne '\033[35;1mPRIMARY:   '
		xclip -p -o
		echo -ne '\n\033[34;1mCLIPBOARD: '
		xsel -b -o
		echo -e '\n\033[m--------'
		sleep 1
	done
}
# With XCLIP
clipboard2() {
	while :; do
		echo -ne '\033[35;1mPRIMARY:   '
		xclip -o -sel p
		echo -ne '\n\033[34;1mCLIPBOARD: '
		xclip -o -sel c
		echo -e '\n\033[m--------'
		sleep 1
	done
}
## Gram to regula rounce ratio #platinum & palladium
OZ="28.349523125"
## Gram to troy ounce ratio #gold & silver
TOZ='31.1034768' #also 31.1034807
oz() {
	#copy to clipboard
	xclip -selection clipboard <<<"${OZ}"
	printf "%s\n" "${OZ}"
}
toz() {
	#copy to clipboard
	xclip -selection clipboard <<<"${TOZ}"
	printf "%s\n" "${TOZ}"
}
# Emulate Ksh from running Zsh
# use 'emulate -L ksh' for scripts
kshf() { ARGV0=ksh exec zsh;}
#Z-shell User Guide
#original documentation by Paul Falstad:
#http://zsh.sourceforge.net/Guide
#updated guide:
#http://zsh.sourceforge.net/Doc
#process html into txt: for i in *.html; do w3m -dump $i > ./plainTxt/${i/.html}.txt; done
z() {
	local GUIDEDIR="${HOME}/arq/docs/zshGuide/plainTxt"
	#if file descriptor 1 is closed, do not print line numbers
	if [[ -t 1 ]]; then
		local NUMOPT='-n'
	fi
	cat ${NUMOPT} "${GUIDEDIR%/}/"*.txt
	#for html: sed -e 's/<[^>]*>//g' -e 's/&agrave;/à/g' -e 's/&amp;/\&/g' -e 's/&gt;/>/g' -e 's/&lt;/</g' -e 's/&nbsp;/ /g' -e 's/&ouml;/ö/g' -e 's/&pound;/£/g' -e 's/&uuml;/ü/g'
}
#Z-shell Doc 5.7.1 by Paul Falstad
zz() {
	local GUIDEDIR="${HOME}/arq/docs/zshDoc5.7.1/plainTxt"
	#if file descriptor 1 is closed, do not print line numbers
	if [[ -t 1 ]]; then
		local NUMOPT='-n'
	fi
	cat ${NUMOPT} "${GUIDEDIR%/}/"*.txt
}
# Grep only file names (without version)
#pkgname() { sed -e 's/-\([0-9]\)/ \1/' | awk 'BEGIN {printf("%-30s %s\n", "PkgName", "Version")} {printf("%-30s %s\n", $1, $2)}';}
#https://askubuntu.com/questions/1096602/extract-only-package-name-without-version-using-awk-or-sed
#Hyphenation based on dictionary
hy() {
	local DIC='arq/docs/hyphenDict/mhyphCustom.txt'
	\ag -i --no-numbers "^${1} =" "${DIC}" | sed 's/=/  /g'
}
# Hyphenate words -- requires Python2
hy2() { python2 ~/bin/hyphenate.py "${1}"; }
#https://nedbatchelder.com/code/modules/hyphenate.html

## Convert any time format ( including Linux Time )
cdate() {
	#printf "Local time:\n"
	#TZ="America/Sao_Paulo" date ...     #TZ is not necessary for local time
	date --date="${*}" "+%FT%T%Z" || date -d@"${*}" "+%FT%T%Z"
} 2>/dev/null
#Nice: date --date='last month' '+%Y-%m-%d'
#Nice: date --date='3 days ago' '+%Y-%m-%d'
## Time and timezones
utc() { TZ=UTC date -d@"$(curl -s GET "https://api.binance.com/api/v3/time" | grep -oE "[0-9]{10}")";}
utc2() { curl -s "http://worldtimeapi.org/api/timezone/Etc/GMT.txt" |awk -F': ' '/utc_datetime: /{print $2}';}
#http://technostuff.blogspot.com/2008/10/some-useful-socat-commands.html
utc3() {
	curl -s "https://www.timeanddate.com/worldclock/full.html" |
		sed  -e 's/<[^>]*>//g' | sed -n '/Around the World/,/et=/p' |
		sed '$d' | sed -e 's/\([0-9][0-9]:[0-9]\{2\}\)/\1\n/g' \
		-e 's/\([a-z]\)\([A-Z]\)/\1  \2/g' |
		{ [[ -z "${@}" ]] && cat || grep -i -e "${@}";}
}
utc4() {
	curl -s "https://www.worldtimeserver.com/worldclock.aspx" |
		sed  -e 's/<[^>]*>//g' -e '/^\s*$/d' |
		sed -n '/Your Location/,/Daylight Saving Tim/p' |
		{ [[ -z "${@}" ]] && cat || grep -iA1 -e "${@}";}
}
timez() {
	curl -s "https://en.wikipedia.org/wiki/List_of_time_zone_abbreviations" |
		sed  -e 's/<[^>]*>//g' -e '/^\s*$/d' | sed -n '/Abbr\./,/List of tz/p' |
		{ [[ -z "${@}" ]] && cat || grep -iA2 -e "^${@}";}
}
timez2() { ls /usr/share/zoneinfo*/*;}
timez3() { timedatectl list-timezones;}
## Get bookmarks and history URLs
URLTEMPF="${HOME}/Downloads/urls.sqlite"
#FFUSERDB="${HOME}/.mozilla/firefox/XXXXXXXX.default/places.sqlite"
FFUSERDB="${HOME}/.mozilla/firefox/sdqosrgm.jsn_firefox/places.sqlite"
GCUSERDB="${HOME}/.config/google-chrome/Default/History"
##Firefox
# All URLs (history, etc)
faurls() {
	cp "${FFUSERDB}" "${URLTEMPF}" <<<'y' || return 1
	sqlite3 "${URLTEMPF}" <<<'select url from moz_places where 1;'
	rm "${URLTEMPF}"
}
# Bookmarks
fburls() {
	cp "${FFUSERDB}" "${URLTEMPF}" <<<'y' || return 1
	sqlite3 "${URLTEMPF}" <<<'select url from moz_bookmarks, moz_places where moz_places.id=moz_bookmarks.fk;'
	rm "${URLTEMPF}"
}
##Chrome
# All URLs (history, etc)
caurls() {
	cp "${GCUSERDB}" "${URLTEMPF}" <<<'y' || return 1
	sqlite3 "${URLTEMPF}" <<<'select url from urls where 1;'
	rm "${URLTEMPF}"
}
# Bookmarks
cburls() { jq -r '..|.url? // empty' "${HOME}/.config/google-chrome/Default/Bookmarks";}
## Recommended function from "curl wttr.in/:bash.function
pt()
{
    local request="wttr.in/${1-$1}"
    [ "$COLUMNS" -lt 125 ] && request+='?nMq'
    curl -H "Accept-Language: pt-br" --compressed "$request"
}
## Get my IP Adress
myip() {
	printf 'IPv4:\n'
	curl -4 'http://ifconfig.io'
	printf 'IPv6:\n'
	if ! curl -6 'http://ifconfig.io'; then
		printf "No IPv6 address.\n"
 	fi
}
## URL shortner
turl() {
	curl -s http://tinyurl.com/api-create.php?url="${*}" |
	tee /dev/tty |
	xclip -selection clipboard
	printf "\nCopied to clipboard!\n"
}
##Color functions
colors() {
	for x in {9..1}; do  #original 'for x in 0 1 4 5 7 8'
		for i in {30..37}; do
			for a in {40..47}; do
				echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m ";
	done
		echo
		done
		done
		echo "End color: \\\e[0;0;0m or \\\e[m"
}
# https://askubuntu.com/questions/27314/script-to-display-all-terminal-colors
colors2() {
	local fgc bgc vals seq0
	printf "Color escapes are %s\n" "\e[${value};...;${value}m"
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"
	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black
			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}
			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}
## Print 256 colours For Fun
colors3 ()
{
	x=`tput op` y=`printf %76s`
	for i in {0..256};do o=00$i
		echo -e ${o:${#o}-3:3} `tput setaf $i
		tput setab $i`${y// /=}$x
	done
}
## Ref: https://wiki.archlinux.org/index.php/Color_output_in_console#diff
colors4() {
	local fgc bgc vals seq0
	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"
	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}
# XTerm Escape sequences (windowsops, fontops etc must be on; don't work under Tmux)
#http://rtfm.etla.org/xterm/ctlseq.html
#https://www.jpichon.net/blog/2010/06/xterm-control-sequences/
#echo -e '\e[8;24;80t'
# also check command 'resize -s' for XTerm
xtr() { echo -e '\e[8;24;80t';}  #reset XTerm termianl size to 80x24
xtf() { echo -e '\e[8;41;135t';}
xtfr() {  echo -e "\e]50;#0\a";}  #reset XTerm font
xtfs() {
	if [[ "${1}" = [[:digit:]]* ]]; then
		echo -e "\e]50;-xos4-terminus-medium-r-*--${1}-*-*-*-*-*-*-*\a"
	else
		echo -e "\e]50;${1}\a"
	fi
	xlsfonts | grep xos4 | grep medium
}

# Check if Intel Hyperthread is being used
ht() { cat /proc/cpuinfo | grep -o ht | uniq;}
model() { cat /proc/cpuinfo;}
cores() { grep -H . /sys/devices/system/cpu/cpu*/topology/thread_siblings_list;}
# Disable one of each sibling
dht() {
	[[ -n ${TMUX} ]] && { printf "Command cannot be run under Tmux.\n";sleep 0.6;exit 1;}
	for i in 2 3; do
		echo "Disabling logical HT core $i."
		echo 0 > /sys/devices/system/cpu/cpu${i}/online;
	done
}
eht() {
	[[ -n ${TMUX} ]] && { printf "Command cannot be run under Tmux.\n";sleep 0.6; exit 1;}
	for i in 2 3; do
		echo "Enabling logical HT core $i."
		echo 1 > /sys/devices/system/cpu/cpu${i}/online;
	done
}
# Toggle CAPS LOCK to ESC -- Execute once within XTerm or create a .Xmodmap file
# Defaults:
#xmodmap -e "keycode   9 = Escape NoSymbol Escape"
#xmodmap -e "keycode  66 = Caps_Lock NoSymbol Caps_Lock"
# or use "xcape"
#caps() { xmodmap ~/.Xmodmap;}
caps() {
	if xmodmap -pk | grep -q "Caps_Lock"; then
		xmodmap -e "clear Lock"
		xmodmap -e "keycode 66 = Escape NoSymbol Escape"
		printf "Caps Lock set to Escape.\n"
	else
		xmodmap -e "clear Lock"
		xmodmap -e "keycode 66 = Caps_Lock NoSymbol Caps_Lock"
		printf "Caps Lock reset.\n"
	fi
}

# Check which graphics cards are being used
graphics() {
	optirun glxinfo|egrep "OpenGL vendor|OpenGL renderer"
	glxinfo|egrep "OpenGL vendor|OpenGL renderer"
	lspci -vnnn | perl -lne 'print if /^\d+\:.+(\[\S+\:\S+\])/' | grep VGA
}
# BBSwitch
#Get the status:
bb() { cat /proc/acpi/bbswitch;}
bbm() {
	printf "Monitor BB Switch.\n"
	watch -d -t -n1 'cat /proc/acpi/bbswitch'
}
#Turn the card off, respectively on:
bboff() { tee /proc/acpi/bbswitch <<<OFF;}
bbon() { tee /proc/acpi/bbswitch <<<ON;}
#https://github.com/Bumblebee-Project/bbswitch
## Sources
#[[ -f ~/.apikeys ]] && . ~/.apikeys
#[[ -f $(ls ~/.rc.pos*) ]] &>/dev/null && . ~/.rc.pos*
# Chuck Norris Jokes
joke() {
	curl -s "http://api.icndb.com/jokes/random" | jq -r '.value.joke' | sed 's/&quot;/\"/g'
}
##########################################################################################################################################
#                                     $$$$$$\  $$\ $$\ $$\
#                                    $$  __$$\ \__|$$ |\__|
#       $$$$$$\   $$$$$$\   $$$$$$\  $$ /  \__|$$\ $$ |$$\ $$$$$$$\   $$$$$$\         $$$$$$\   $$$$$$\   $$$$$$$\  $$$$$$\  $$$$$$$\
#      $$  __$$\ $$  __$$\ $$  __$$\ $$$$\     $$ |$$ |$$ |$$  __$$\ $$  __$$\       $$  __$$\ $$  __$$\ $$  _____|$$  __$$\ $$  __$$\
#      $$ /  $$ |$$ |  \__|$$ /  $$ |$$  _|    $$ |$$ |$$ |$$ |  $$ |$$ /  $$ |      $$ |  \__|$$$$$$$$ |$$ /      $$ /  $$ |$$ |  $$ |
#      $$ |  $$ |$$ |      $$ |  $$ |$$ |      $$ |$$ |$$ |$$ |  $$ |$$ |  $$ |      $$ |      $$   ____|$$ |      $$ |  $$ |$$ |  $$ |
#      $$$$$$$  |$$ |      \$$$$$$  |$$ |      $$ |$$ |$$ |$$ |  $$ |\$$$$$$$ |      $$ |      \$$$$$$$\ \$$$$$$$\ \$$$$$$  |$$ |  $$ |
#      $$  ____/ \__|       \______/ \__|      \__|\__|\__|\__|  \__| \____$$ |      \__|       \_______| \_______| \______/ \__|  \__|
#      $$ |                                                          $$\   $$ |
#      $$ |                                                          \$$$$$$  |
#      \__|                                                           \______/
##########################################################################################################################################
#exploit-db
exd(){
	cat /usr/share/exploitdb/$1
}


gauu() {
	gauq $1 -subs | \
	grep "=" | \
	egrep -iv ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)" | \
	qsreplace -a
}
sqliz() {
	gauu $1 | python3 $HOME/pikpikcu/DSSS/dsss.py
}

bxss() {
	BLIND="https://your.xss.ht"
	gauu $1 | kxss | grep -Eo "(http|https)://[a-zA-Z0-9./?=_-]*" | \
	dalfox pipe -b $BLIND
}


#subssl
subssl(){
  timeout 3 openssl s_client -showcerts -servername $1 -connect $1:443 <<< "Q" 2>/dev/null | \
  openssl x509 -text -noout | \
  grep DNS | \
  tr ',' '\n' | \
  cut -d ':' -f 2 | \
  sort -fu
  }

# xss vuln
xss() {
	ex='".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)"'
    gospider -S $1 -c 10 -d 5 --blacklist $ex --other-source | \
	grep -e "code-200" | \
	awk '{print $5}' | \
	grep "=" | \
	qsreplace -a| \
	dalfox pipe -o out.txt  
    }

xssbug(){
   links="https://3xploitsec.xss.ht"
   echo '$1' | assetfinder  | hakrawler -plain -usewayback -wayback | grep "=" | egrep -iv ".(jpg|jpeg|gif|css|tif|tiff|png|ttf|woff|woff2|ico|pdf|svg|txt|js)" | qsreplace -a | dalfox pipe -b $links -o out.txt 
    }

# waybackurls
word() { 
    waybackurls $1 | grep "?" | unfurl keys | sort -u | tee -a wordlis.txt
}
wayback(){
echo
waybackurls $1 | awk -F"[/:]" '{print $4}' | sort -u | uniq | tee -a >> ~/Desktop/$1.txt
echo -e "[+] Save Output: " ~/Desktop/$1.txt
echo
cat ~/Desktop/$1.txt
}
# nmap automater quick
nmater1(){
  nmap.sh $1 Quick
}
nmater2(){
  nmap.sh $1 Basic
}
nmater3(){
  nmap.sh $1 UDP
}
nmater4(){
  nmap.sh $1 Full
}
nmater5(){
  nmap.sh $1 Recon
}
# assetfinder
subdo(){
assetfinder --subs-only $1
}
# Check ASN
asn(){
url=$1
di=$(dig +short $url)
whois -h whois.cymru.com $di
}
# Check Dns Informasi
dsi(){
dt -debug -scan -showfail $1
}
# REGEX SUBDO
geksub(){
cat $1 | grep -Po "(\w+\.\w+\.\w+)$" | sort -u >> $1.txt
}
# Sort
tsort(){
sort -u $1 -o $1.txt
}
tsort1(){
  sort -u $1 | egrep -v "^http$|https$" |tee -a $1.txt
}
# Check Live Subdomains (HTTPS)
ceksubs(){
cat $1 | sort -u | httprobe -s -p https:443 | tr -d ":443" | tee -a  $1.txt
}
# Check Live Subdomains (HTTP)
ceksub(){
cat $1 | sort -u | httprobe -s -p http:80 | tr -d ":80" | tee -a  $1.txt
}
# AWS
s3ls(){
aws s3 ls s3://$1
}
s3cp(){
aws s3 cp $2 s3://$1
}
# generate wordlists
wor(){
pd=$(pwd)
curl -s "http://web.archive.org/cdx/search/cdx?url=$1/*&output=text&fl=original&collapse=urlkey" | sed 's/\//\n/g' | sort -u | grep -v 'svg\|.png\|.img\|.ttf\|.http:\|:\|.eot\|woff\|ico\|css\|bootstrap\|wordpress\|.jpg\|.jpeg\|.js\|.pdf\|.gif\|.JPG\|.PNG\|www.\|.com' | tee -a >> $1.txt
echo -e "[+] Save: "  $pd/$1.txt
}
#  Content discovery
cur(){
curl -s $1 | grep path | sed -n "s/.*resource path=\"\(.*\)\".*/\1/p" | tee -a ~/Desktop/$1.txt
echo -e "Save Output: " ~/Desktop/$1.txt
}
#  recon using AMASS
am(){
amass enum --passive -d $1 -json $1.json
jq .name $1.json | sed "s/\"//g"| httprobe -c 60 | tee -a ~/Desktop/$1-domains.txt
echo -e "Save Output: " ~/Desktop/$1-domains.txt
}
# certprob
certprobe(){
pd=$(pwd)
curl -s https://crt.sh/\?q\=\%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe | tee -a $1.txt
echo -e "[+] Save: " $pd/$1.txt
}
# masscan
mscan(){
sudo masscan -p4443,2075,2076,6443,3868,3366,8443,8080,9443,9091,3000,8000,5900,8081,6000,10000,8181,3306,5000,4000,8888,5432,15672,9999,161,4044,7077,4040,9000,8089,443,744 $1 | tee -a $1.txt
}
# certspott prints
certspotter(){
curl -s https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1 | tee -a $1.txt
}
crtsh(){
curl -s 'https://crt.sh/?q=%.'$1'&output=json' | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u
}
certnmap(){
curl https://certspotter.com/api/v0/certs\?domain\=$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1
nmap -T5 -Pn -sS -i - -$1
}
ipinfo(){
curl http://ipinfo.io/$1
}
# web archive
webarch(){
  curl -s "http://web.archive.org/cdx/search/cdx?url=*."$1"/*&output=text&fl=original&collapse=urlkey" |sort| sed -e 's_https*://__' -e "s/\/.*//" -e 's/:.*//' -e 's/^www\.//' | uniq >>$1.txt
}
#crt.sh
crt(){
  curl 'https://crt.sh/?q=%.'$1'&output=json' | jq '.[] | {name_value}' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u |grep "name_value"|cut -d ' ' -f4 > $1.txt
}
#------ Tools ------
bdir(){
dirsearch -u $1 -e $2 -t 50 -b
}
ncx(){
nc -l -n -vv -p $1 -k
}
crtshdirsearch(){ #gets all domains from crtsh, runs httprobe and then dir bruteforcers
curl -s https://crt.sh/?q\=%.$1\&output\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe -c 50 | grep https | xargs -n1 -I{} python3 ~/tools/dirsearch/dirsearch.py -u {} -e $2 -t 50 -b
}
#dns brute
dnsbur(){
  curl -s https://dns.bufferover.run/dns?q=%.$1 | jq -r .FDNS_A[] | cut -d',' -f2 | sort -u >>$1.txt
}
certs(){
  curl -s "https://certspotter.com/api/v0/certs?domain="$1 | jq '.[].dns_names[]' | sed 's/\"//g' | sed 's/\*\.//g' | sort -u | grep $1 >>$1.txt
}
# subdo using curl and amass
curmas(){
  curl -s  -X POST --data "url=$1&Submit1=Submit" 'https://suip.biz/?act=amass' | grep $1 | cut -d ">" -f 2 | awk 'NF' | uniq >>$1.txt
  echo "[+] Subdomain $(wc -l $1.txt | awk '{ print $1 }' )" "=> ${1}"
  echo "[+] Save File: "$(pwd)/"$1.txt"
}
# subfinder
subfi(){
  curl -s  -X POST --data "url=$1&Submit1=Submit" 'https://suip.biz/?act=subfinder' | grep $1 | cut -d ">" -f 2 | awk 'NF' | uniq >>$1.txt
}
# ufurl
uf(){
cat $1.txt | unfurl format "%s://%d%p?%q%r%u%%%S" | tee -a cek_$1
}
subf(){
  pd=$(pwd)
  echo -e "[+] Cek status response..."
  subfinder -silent -d $1 | httprobe | tee -a output.txt
  echo -e "[+] Done..."
  echo -e "[+] Saved: " $pd/output.txt 
#  for site in $(cat output.txt);do
#    $site | grep -Po '(\w+.\w+.\w+.\w+.\w+.\w+.\w+)' | subfinder -v
#  done
}
subv(){
cat $1 | grep -Po '(\w+.\w+.\w+.\w+.\w+.\w+.\w+)' | subfinder -v
}
subn(){
  echo -e "[+] Start subdo & nmap..."
  subfinder -d $1 -o $1.json -oJ -nW | cat $1.json | sort -u | grep -Po '(\w+.\w+.\w+.\w+)' | tee -a > $1.nmap
  nmap -v --reason -iL $1.nmap -T5 -Pn -oG nmap.txt -p-
}
subv(){
  cat $1.txt | subfinder -v | tee -a $1.txt
}
# NMAP
mapvul(){
##############
    pd=$(pwd)
    echo -e "[+] Start nmap..."
    nmap -v --reason -iL $1 -T5 -Pn -oG $1.txt -p-
    echo -e "[+] Save: " $pd/$1.txt
    echo
    #######################3
    echo -e "[+] Check IP.."
    egrep -v "^#|Status: Up" $1.txt | cut -d' ' -f2,4- | sed -n -e 's/Ignored.*//p' | awk -F, '{split($0,a," "); printf "%-20s" , a[1], NF}' | sort -k 5 -g >> nmap_ip_$1.txt
    echo -e "[+] Save: " $pd/nmap_ip_$1.txt
    echo
    #########################
    echo -e "[+] Start Fping..."
    fping -f nmap_ip_$1.txt
    echo
    ##########################3
    echo "[+] Start Scanning Vulnerabilty..."
    echo "[+] Wait...   (10/30m)"
    nmap -A --reason --script vuln -iL nmap_ip_$1.txt -T5 -oG vuln_$1.grep -p-
    echo -e "[+] Save: " $pd/vuln_$1.grep
    echo
    ##########################
    ##########################
    echo -e "[+] Check Host and Open Port"
    egrep -v "^#|Status: Up" $1.txt | cut -d' ' -f2,4- | sed -n -e 's/Ignored.*//p' | awk '{print "Host: " $1 " Ports: " NF-1; $1=""; for(i=2; i<=NF; i++) { a=a" "$i; }; split(a,s,","); for(e in s) { split(s[e],v,"/"); printf "%-8s %s/%-7s %s \n" , v[2], v[3], v[1], v[5]}; a=""}' | tee -a >> nmap_reslute_ip.$1.txt
    echo -e "[+] Save: " $pd/nmap_reslute_ip.$1.txt
    echo
    ###########################
    echo -e "[+] Check Service Port"
    egrep -v "^#|Status: Up" vuln_$1.grep | cut -d' ' -f2,4- | sed -n -e 's/Ignored.*//p' | tr ',' '\n' | sed -e 's/^[ \t]*//' | sort -n | uniq -c | sort -k 1 -r | head -n 10 | tee -a >> reslute_port.$1.txt
    echo -e "[+] Save: " $pd/reslute_port.$1.txt
    echo
    #############################
    echo -e "[+] Check top service"
    egrep -v "^#|Status: Up" vuln_$1.grep | cut -d' ' -f2,4- | tr ',' '\n' | sed -e 's/^[ \t]*//' | awk -F '/' '{print $5}' | grep -v "^$" | sort | uniq -c | sort -k 1 -nr | tee -a >> resulte_service.$1.txt
    echo -e "[+] Save: " $pd/resulte_service.$1.txt
}
pikpikcu(){
  #!/bin/bash
if [[ $# -eq 0 ]];
then
   echo
   echo "+--------------------------------------+"
   echo "|        Recon Bash Scripting          |"
   echo "|   Code By: Ari Sec                   |"
   echo "|   github: @3xploit-db                |"
   echo "+--------------------------------------+"
   echo "Usage: ./script.sh site.com"
   echo
   exit 0
fi
echo
echo "[+] Check ASN..."
whois -h whois.cymru.com $(dig +short $1)
echo "[+] DNS Display Iformasion..."
dt -debug -scan -showfail $1
mkdir subdo
#run=$1
if [[ -d "subdo" ]]; then
	echo "[+] Check Subdomains..."
	assetfinder --subs-only $1 >> subdo/subdomains.txt
fi
sort -u subdo/subdomains.txt -o subdo/domains.txt
cat subdo/domains.txt
#echo "[+] Done Save Output: subdo/domains.txt"
mkdir live_subdo
if [[ -d "live_subdo" ]]; then
    echo "[+] Check Live Subdomains..."
    cat subdo/domains.txt | sort -u | httprobe -s -p https:443 | tr -d ":443" | tee -a  live_subdo/https.txt
else
    cat subdo/domains.txt | sort -u | httprobe -s -p http:80 | tr -d ":80" | tee -a  >> live_subdo/http.txt
fi
#echo "[+] Done Save Output: live_subdo/https.txt"
mkdir sucses
if [[ -d "sucses" ]];
then
    cat live_subdo/https.txt | grep -Po "(\w+\.\w+\.\w+)$" | sort -u >> sucses/https.txt
else
    cat live_subdo/http.txt | grep -Po "(\w+\.\w+\.\w+)$" | sort -u >> sucses/http.txt
fi
#echo "[+] Done Saved Output: sucses/https.txt"
mkdir dir_response
if [[ -d "dir_response" ]]; then
    echo "[+] Check Status Response..."
    cat sucses/https.txt | assetfinder | hakrawler -plain | hakcheckurl | grep -v 404 | tee -a  dir_response/dir_https.txt
else
    cat sucses/http.txt | assetfinder | hakrawler -plain | hakcheckurl | grep -v 404 >> dir_response/dir_http.txt
fi
#dt -debug -scan -showfail $1
#echo "[+] Done Saved Output: dir_response/dir_https.txt"
echo "[+] Get All urls..."
echo "[+] Wait...(10/30m)"
cat sucses/https.txt | getallurls -subs | concurl -c 20 -- -s -L -o /dev/null -k -w '%{https_code},%{size_download}' | tee -a  out.txt
if [[ -d "file" ]]; then
  cat sucses/http.txt | getallurls -subs | concurl -c 20 -- -s -L -o /dev/null -k -w '%{http_code},%{size_download}' | tee -a >> out1.txt
  else
     echo "[+] http.txt Not Founds..."
fi
mkdir nmap
if [[ -d "nmap" ]]; then
    echo "[+] Start nmap..."
    nmap -v --reason -iL sucses/https.txt -T5 -Pn -oG nmap/nmap.grep -p- | tee -a >> nmap/nmap-log.txt
else
   echo "[+] Start nmap..."
   nmap -v --reason -iL sucses/http.txt -sV -oG nmap/nmap.grep -p- | tee -a >> nmap/nmap-log.txt
fi
egrep -v "^#|Status: Up" nmap/nmap.grep | cut -d' ' -f2,4- | sed -n -e 's/Ignored.*//p' | awk -F, '{split($0,a," "); printf "%-20s" , a[1], NF}' | sort -k 5 -g >> nmap/nmap_ip.txt
fping -f nmap/nmap_ip.txt
echo "[+] Start Scanning Vulnerabilty..."
echo "[+] Wait...   (10/30m)"
nmap -A --reason --script vuln -iL nmap/nmap_ip.txt -T5 -oG nmap/nmap_vuln.grep -p- | tee -a >> nmap_log_vuln.txt
# Check Host and Open Port
egrep -v "^#|Status: Up" nmap/nmap.grep | cut -d' ' -f2,4- | sed -n -e 's/Ignored.*//p' | awk '{print "Host: " $1 " Ports: " NF-1; $1=""; for(i=2; i<=NF; i++) { a=a" "$i; }; split(a,s,","); for(e in s) { split(s[e],v,"/"); printf "%-8s %s/%-7s %s \n" , v[2], v[3], v[1], v[5]}; a=""}' | tee -a >> nmap/nmap_reslute_ip.txt
# Check Service Port
egrep -v "^#|Status: Up" nmap/nmap_vuln.grep | cut -d' ' -f2,4- | sed -n -e 's/Ignored.*//p' | tr ',' '\n' | sed -e 's/^[ \t]*//' | sort -n | uniq -c | sort -k 1 -r | head -n 10 | tee -a >> nmap/nmap_reslute_port.txt
# Check top service
egrep -v "^#|Status: Up" nmap/nmap_vuln.grep | cut -d' ' -f2,4- | tr ',' '\n' | sed -e 's/^[ \t]*//' | awk -F '/' '{print $5}' | grep -v "^$" | sort | uniq -c | sort -k 1 -nr | tee -a >> nmap/nmap_resulte_service.txt
}

# export LANG=en_US.UTF-8
# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
## Cd and Ls dir content
#function cl() {
#    DIR="$*";
#        # if no DIR given, go home
#        if [ $# -lt 1 ]; then
#                DIR=$HOME;
#    fi;
#    builtin cd "${DIR}" && \
#    # use your preferred ls command
#        ls -F --color=auto
#}
## Sort by Size -- Reports
# blame by "install size"
#expac -H M -l '\n' '%m %n' | sort -k1nr
# blame by "depends on"
#expac -l ' ' '%n %E' | awk '{print NF - 1, $1}' | sort -k1nr
# blame by "required by"
#expac -l ' ' '%n %N' | awk '{print NF - 1, $1}' | sort -k1nr


#The following code:
#
#for i in $@; do :; done
#echo "Last arg : $i"
#
#Can be written as follows:
## If you do not tell what to loop over shell will loop over the arguments i.e. $@ .
## This is a default.
#
#for i; do :; done
#echo "Last arg : $i"
#
#Ref:https://www.cyberciti.biz/faq/linux-unix-bsd-apple-osx-bash-get-last-argument/

# Important: To grep text between two lines:
#Ex:
#I Love Linux
#***** BEGIN *****
#BASH is awesome
#BASH is awesome
#***** END *****
#I Love Linux
#sed -n '/StartPattern/,/EndPattern/p' FileName
#awk '/StartPattern/,/EndPattern/' FileName
#https://www.shellhacks.com/sed-awk-print-lines-between-two-patterns/
#
#Between pattern in same line:
#abc:string"def
#$ sed -e 's/\(^.*:\)\(.*\)\(".*$\)/\2/' file

## REMEMBER:
## WIFI-MENU, it ships with netcfg and doesn't need wireless_tools
# Arch script is (wifi-menu) ou:
# Se ainda tens o network manager então é só usar o nmtui.
#Ref:https://www.vivaolinux.com.br/dica/Arch-Linux-Configurando-Wi-Fi-com-wifi-menu
## Install and use ncdu for disk and folder usage.
## For a feh alternative, check sxiv

# Ref: <https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html>

## Monero mineration with NVIDIA card
#alias xxx='cd /home/jsn/*Minerador && sudo cpupower \
#frequency-set -g performance && sudo sysct\
#l -w vm.nr_hugepages=128 && xfce4-terminal \
#-e "optirun -b none nvidia-settings -c :8"\
#&& sleep 10s && xmr-stak'
##

### BASH Readline
#Only works when it is running interactively
#foo bar baz
#
#
# Ctr + W  		Kill word backwards
# Alt + B		Move one word backward
# Ctrl+ Sft + _  	Undo
#
# Meta = Alt
#
# Meta + Sft + _  	Yaks last argument
# Ctl + Meta + Y 	Yanks first argument
# Meta + 2 and then
#  	Ctl+ Meta + Y 	Yaks from $2
# Ctl + Y 		Yank and past from buffer
# Alt + B 		Go back one word at a time
# Meta + R		Revert line like many  Undoes
# Meta+. 		Repeatedly cycle through final
##			argument from earlier commands

## Other Tips
# Try changing directories and then:
#
#cd - changes back to the previous directory
#    Handy if you forgot to pushd
#
#In general ~- is the previous directory
#    Useful for working with files in 2 different directories
#
# .XXXrc (it is called a c file)
#
#Grabbing Other Bits --  Bang History
#    Other bits of previous commands can be grabbed with !
#
#    !:0 		is the previous command name
#    !^, !:2, !:3, …, 	!$ are the arguments
#    !* 			is all the arguments
#    !-2, !-3, … 	are earlier commands
#    	e.g.:
##	!-2^, !-2:2, !-2$, !-2*

## Key mappings available
#  The 2 unused keystrokes with Ctrl are
#  the rather awkward:
#  Ctrl+\
#  Ctrl+^
#
#  But there are 15 letters available for
#  use with Meta, namely:
#  Meta+A, Meta+E, Meta+G, Meta+H, Meta+I,
#  Meta+J, Meta+K, Meta+M, Meta+O, Meta+Q,
#  Meta+S, Meta+V, Meta+W, Meta+X, and Meta
##

## Comment inside a comd
#Add     ${IFS#comment}
#    The IFS is a special shell variable.
#    You can change the value of IFS as per your requirments.
#    The Internal Field Separator (IFS) that is used for word splitting after expansion and to split lines into words with the read builtin command.
#    The default value is <space><tab><newline>. You can print it with the following command:
#
#cat -etv <<<"$IFS"

#Make it Snow!
#clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.1;done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH*\033[0;0H",a[x],x;}}'

#Make it Rain!
#clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.1;done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH.\033[0;0H",a[x],x;}}'

#Make it Rain fast!
#clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.0;done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH.\033[0;0H",a[x],x;}}'

#Make it Rain Money!
#clear;while :;do echo $LINES $COLUMNS $(($RANDOM%$COLUMNS));sleep 0.1;done|gawk '{a[$3]=0;for(x in a) {o=a[x];a[x]=a[x]+1;printf "\033[%s;%sH ",o,x;printf "\033[%s;%sH$\033[0;0H",a[x],x;}}'
#Ref: https://www.youtube.com/watch?v=0HsE4RRhLQ0

#alias emoji_shrug='echo -n "¯\_(ツ)_/¯" | xclip -selection clipboard'
#alias emoji_run='echo -n "ᕕ( ᐛ )ᕗ" | xclip -selection clipboard'
# Ref: https://github.com/charnley/dotfiles/blob/master/bash_aliases


## Weather forecast in CLI ( Previsao do Tempo )
#	curl wttr.in/Londrina?lang=pt

#https://gitlab.com/dwt1/dotfiles/blob/master/.bashrc

# Scrape images from website
# {wget -nd -H -p -A jpg,jpeg,png,gif -e robots=off "${*}";}
# https://davidwalsh.name/scrape-images-wget


# For more jokes at once: http://api.icndb.com/jokes/random/5
# https://medium.com/cameron-nokes/working-with-json-in-bash-using-jq-13d76d307c4


## Custom Ls _ GRML has ls aliases already
#l() { ls -hF --group-directories-first "${@}" | cut -c1-22 | column -c 80; }
#la() { ls -ahF --group-directories-first "${@}" | cut -c1-22 | column -c 80; }
#alias ll="ls++ --potsf"
# Ref: https://unix.stackexchange.com/questions/112335/can-i-truncate-long-file-names-in-ls-listing/112341#112341


#Make a wav file with text input:
#espeak --stdout -f text.txt > text.wav


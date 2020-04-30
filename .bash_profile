## Terminal executes
##   /etc/profile
## then looks for the following and executes the first it finds:
##   ~/.bash_profile
##   ~/.bash_login
##   ~/.profile

if [ -r ~/.bashrc ]; then
  source ~/.bashrc
fi


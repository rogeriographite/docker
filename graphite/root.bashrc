# Source web application environment
# source /etc/environment

# Web env vars
export GRAPHITECODE='/var/www/html'
export graphite='/var/www/html'

# PHP unit tests
alias yiic='$GRAPHITECODE/protected/yiic'
alias runtests='$GRAPHITECODE/protected/testRunner.php'
alias syncSchema='$GRAPHITECODE/protected/yiic Util Run syncSchema'

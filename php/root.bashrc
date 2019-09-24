# Source web application environment
source /etc/environment

# Web env vars
export SHCODE=/var/www/html

# PHP unit tests
alias runtests='$SHCODE/protected/testRunner.php'
alias syncSchema='$SHCODE/protected/yiic Util Run syncSchema'
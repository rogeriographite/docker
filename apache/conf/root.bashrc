# Source web application environment
source /etc/environment

# PHP unit tests
# GRAPHITE_CODE defined in Dockerfile
alias runtests='$GRAPHITE_CODE/protected/testRunner.php'
alias syncSchema='$GRAPHITE_CODE/protected/yiic Util Run syncSchema'
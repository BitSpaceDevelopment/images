# add rbenv to path
export PATH="/home/ubuntu/.rbenv/bin:$PATH"

# set default env vars
export RBENV_VERSION=2.2.2
export RBENV_ROOT=/home/ubuntu/.rbenv
export RAILS_ENV=${RAILS_ENV:-test}

# initialize and set ruby version
eval "$(rbenv init -)"
rbenv global 2.2.2

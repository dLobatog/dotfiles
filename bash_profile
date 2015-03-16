source ~/.bashrc

# Ruby GC Tuning
export RUBY_GC_HEAP_INIT_SLOTS=600000
export RUBY_GC_MALLOC_LIMIT=59000000
export RUBY_HEAP_FREE_MIN=100000

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

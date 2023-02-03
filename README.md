# SETTERY  SERVICE
# ~~~~~~~~~~~~~~~~

To build and run:
    docker build -t settery-service
    docker run -p 3333:3333 settery-service

# TICKET TRACKING
install taskwarrior,

    brew install task


add workspace toggle to your rc,

    alias setc="task rc.default.data.location=~/path/to/this/project/.task;
    task color bright red on white"

    alias xset="task rc.default.data.location=~/.task;
    task color rgb150 on gray3"


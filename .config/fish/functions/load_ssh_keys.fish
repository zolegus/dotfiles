function load_ssh_keys
    if not pgrep -qf "ssh-agent -s"; ssh-agent -c | source -; end > /dev/null 2>&1
    for key in ~/.ssh/*
        if test -f $key
            if not string match -q -- '*.pub' (basename $key)
                and not string match -q -- '*.old' (basename $key)
                and not string match -q -- 'known_hosts' (basename $key)
                    ssh-add "$key" > /dev/null 2>&1
            end
        end
    end
end

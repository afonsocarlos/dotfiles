function take
    if string match -q --regex '^([A-Za-z0-9]+@|https?|git|ssh|ftps?|rsync).*\.git/?$' $argv[1]
        takegit $argv
    else
        takedir $argv
    end
end

function takegit
    takedir (string replace -r '.*/([^/]+)(\.git)?$' '$1' $argv | string replace -r '\.git$' '')
    git clone --bare $argv .git
    git config remote.origin.fetch '+refs/heads/*:refs/remotes/origin/*'
end

function takedir
    mkdir -p $argv && cd $argv[-1]
end

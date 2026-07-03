# 1. Inherit core docker-compose commands and options
complete -c sail -w 'docker compose'

# 2. Add Sail-specific subcommands not present in docker-compose
complete -c sail -f -a 'artisan' -d 'Run a Laravel Artisan command'
complete -c sail -f -a 'composer' -d 'Run a Composer command'
complete -c sail -f -a 'npm' -d 'Run a Node Package Manager command'
complete -c sail -f -a 'npx' -d 'Run an npx command'
complete -c sail -f -a 'yarn' -d 'Run a Yarn command'
complete -c sail -f -a 'bun' -d 'Run a Bun command'
complete -c sail -f -a 'tinker' -d 'Start a Laravel Tinker session'
complete -c sail -f -a 'test' -d 'Run application tests via Pest or PHPUnit'
complete -c sail -f -a 'dusk' -d 'Run Laravel Dusk tests (browser testing)'
complete -c sail -f -a 'shell' -d 'Start a CLI session inside the application container'
complete -c sail -f -a 'root-shell' -d 'Start a root CLI session inside the application container'
complete -c sail -f -a 'share' -d 'Share your local site publicly via Expose'
complete -c sail -f -a 'tail' -d 'Tail the application log files'

# complete -c sail -n '__fish_seen_subcommand_from artisan' -w artisan
complete -c sail -x -a '(__fish_complete_subcommand)'

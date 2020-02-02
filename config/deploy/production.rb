server "http://52.56.241.102/", user: "jules", roles: %w{app db web}
set :ssh_options, keys: "/home/jules/.ssh/id_rsa.pub"

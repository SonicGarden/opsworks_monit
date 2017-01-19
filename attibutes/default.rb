default[:monit] = {
  smtp: {
    username: 'test@example.com',
    password: 'password',
    address: 'smtp.example.com',
    port: 25
  },
  notification: {
    from: 'support+opsworks@sonicgarden.jp',
    to: 'infra@sonicgarden.jp'
  }
}

case node[:platform_family]
when 'rhel', 'fedora', 'suse'
  default[:monit][:includes_dir] = '/etc/monit.d'
else
  default[:monit][:includes_dir] = '/etc/monit/conf.d'
end

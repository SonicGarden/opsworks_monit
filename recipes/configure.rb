node[:deploy].each do |application, deploy|

  template "#{node[:monit][:includes_dir]}/mail_setting.monitrc" do
    source "mail_setting.erb"
    mode 0440
    owner 'root'
    group 'root'
    variables(monit: node[:monit])
    notifies :restart, "service[monit]", :immediately
  end

  template "#{node[:monit][:includes_dir]}/system.monitrc" do
    source "system.erb"
    mode 0440
    owner 'root'
    group 'root'
    notifies :restart, "service[monit]", :immediately
  end

  service 'monit' do
    supports status: true, restart: true, reload: true
    action :nothing
  end
end

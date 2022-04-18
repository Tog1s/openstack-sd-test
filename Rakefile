terraform_path = './terraform/workers'

task test: ['test:terraform', 'test:ansible']
task init: ['tf:apply', 'ansible:inventory', 'ansible:deploy']

desc 'Test infrastructure code'
namespace :test do
  task :terraform do
    puts 'Validate terraform'
    system "cd #{terraform_path} && terraform validate"
  end

  task :ansible do
    puts 'Validate ansible'
    system 'cd ./ansible/playbooks && ansible-lint'
  end
end

namespace :tf do
  task :fmt do
    system "cd #{terraform_path} && terraform fmt"
  end
  task :init do
    system "cd #{terraform_path} && terraform init"
  end
  task :plan do
    system "cd #{terraform_path} && terraform plan"
  end
  task :apply do
    system "cd #{terraform_path} && terraform apply -auto-approve"
  end
  task :destroy do
    system "cd #{terraform_path} && terraform destroy"
  end
end

namespace :ansible do
  task :inventory do
    system 'cd ansible && ./inventory.sh'
  end
  task :deploy do
    system 'cd ansible && ansible-playbook ./playbooks/monitoring.yml'
    system 'cd ansible && ansible-playbook ./playbooks/docker.yml'
  end
end

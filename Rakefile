require 'rake'

root = __dir__

task default: %w(test)
task test: %w(build bundle_install)

desc 'Build the docker image'
task :build do
  system('docker build -t cloud-data-base .')
end

desc 'Bundle install on the docker container'
task :bundle_install do
  system('docker run -v "$PWD":/opt/test -w /opt/test --rm -t cloud-data-base bash -l -c "bundle install -j2"')
end

describe 'etcd-env' do
  etcd = nil

  before(:all) do
    `mkdir -p /tmp/etcd`
    etcd = spawn 'etcd --data-dir /tmp/etcd', err: '/dev/null'
    sleep 2  # Give etcd time to spin up
    `etcdctl mkdir /test`
    ENV['ETCD_HOST'] = 'localhost'
  end

  before(:each) do
    `for key in $(etcdctl ls /test); do etcdctl rm $key; done`
  end

  after(:all) do
    ENV['ETCD_HOST'] = nil
    Process.kill :SIGTERM, etcd
    Process.wait etcd
  end

  it 'should pass environment variables to scripts' do
    `etcdctl set /test/FOO ham`
    `etcdctl set /test/BAR cheese`
    expect(`./exe/etcd-env /test 'echo $FOO $BAR'`.chomp).to eq 'ham cheese'
  end

  it 'should work with big multiline variables' do
    cert = File.read('spec/cert')
    `etcdctl set /test/CERT < spec/cert`
    expect(`./exe/etcd-env /test 'echo "$CERT"'`.chomp).to eq cert
  end
end

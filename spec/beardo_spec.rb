require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require File.join(File.dirname(__FILE__), '..' , 'lib', 'beardo')

def create_config
  @config = { 'email'    => 'ralph@robotsinc.com', 
              'password' => 'robot',
              'group'    => 1337 }
end

describe "beardo command line interface" do
  before do
    create_config
    @beardo = Object.new
    stub(Beardo).new { @beardo }
    stub(Beardo).read_config { @config }
    stub(@beardo).post { true }
    @rest_client = Object.new
    stub(RestClient::Resource).new { @rest_client }
    stub(@rest_client).post { true }
  end

  it "should read in configuration options" do
    mock(Beardo).read_config { @config }
    Beardo.run([])
  end

  it "should create a new instance of a Beardo on .run" do
    mock(Beardo).new(@config) { @beardo }
    Beardo.run([])
  end

  describe "temporary directory exists" do
    before do
      begin
        Dir.mkdir(Beardo::CONFIG_PATH)
      rescue Errno::EEXIST
      end
    end

    it "should produce correct configs when send .read_config" do
      File.open(Beardo::CONFIG_FILE, 'w') do |f|
        f.puts(@config.to_yaml)
      end
      Beardo.read_config.should == @config
    end

    after do
      FileUtils.rm_rf(Beardo::CONFIG_PATH)
    end
  end

  it "should post to coop on .run" do
    @beardo = Object.new
    mock(@beardo).post('work sucks') { true }
    Beardo.run(['work sucks'])
  end
end

describe "instance methods" do
  before do
    create_config
    @rest_client = Object.new
  end

  it "should send the message to Coop on #post" do
    mock(@rest_client)["groups/#{@config['group']}/statuses"].stub!.post("<status>f this</status>", :content_type => "application/xml")
    mock(RestClient::Resource).
      new("http://coopapp.com",
          {:user => @config['email'],
           :password => @config['password']}) { @rest_client }
    @beardo = Beardo.new(@config)
    @beardo.post('f this')
  end
end

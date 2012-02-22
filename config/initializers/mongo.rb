MongoMapper.config = {
  'development' => {'host' => '127.0.0.1', 'port' => 27017, 'database' => "pat_#{Rails.env}", :logger => Rails.logger},
  'test'        => {'host' => '127.0.0.1', 'port' => 27017, 'database' => "pat_#{Rails.env}"},
  'production'  => {'host' => '127.0.0.1', 'port' => 27017, 'database' => "pat_#{Rails.env}"},
}

MongoMapper.connect Rails.env

if defined?(PhusionPassenger)
   PhusionPassenger.on_event(:starting_worker_process) do |forked|
     MongoMapper.connection.connect_to_master if forked
   end
end

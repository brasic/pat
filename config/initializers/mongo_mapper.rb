database_config_file = File.join(Rails.root, "/config/database.mongo.yml")
yaml_content = File.read(database_config_file)
MongoMapper.config = YAML::load(yaml_content)

if MongoMapper.config[Rails.env] && MongoMapper.config[Rails.env]['adapter'] == 'mongodb'
  MongoMapper.connect Rails.env, logger: Rails.logger
end

if defined?(PhusionPassenger)
   PhusionPassenger.on_event(:starting_worker_process) do |forked|
     MongoMapper.connection.connect_to_master if forked
   end
end

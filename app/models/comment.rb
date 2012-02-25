class Comment
  include MongoMapper::EmbeddedDocument
  plugin MongoMapper::Plugins::Userstamps

  key :text,       String
  key :references, Array
  key :updated_at, Time
  key :created_at, Time

  userstamps!

  validates_presence_of :text
end

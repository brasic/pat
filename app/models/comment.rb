class Comment
  include MongoMapper::EmbeddedDocument
  plugin MongoMapper::Plugins::Userstamps

  key :text,       String
  key :references, Array

  timestamps!
  userstamps!

  validates_presence_of :text
end

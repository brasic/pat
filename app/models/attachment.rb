class Attachment
  include MongoMapper::Document
  plugin AttachIt

  has_attachment :file
end

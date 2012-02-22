class Concern
  include MongoMapper::Document

  key :title
  key :content
  key :status

  many :comments
  timestamps!
  userstamps!

  validates_presence_of :title
  validates_presence_of :content
end

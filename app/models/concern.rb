class Concern
  include MongoMapper::Document

  key :title
  key :content

  many :comments
  timestamps!
  userstamps!

  validates_presence_of :title
  validates_presence_of :content
end

class User
  include MongoMapper::Document

  key :username
  key :name
  key :email

  timestamps!

  validates_presence_of :username
  validates_presence_of :name
  validates_presence_of :email
end

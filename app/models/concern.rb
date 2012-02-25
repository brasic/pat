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

  # list of all the user ids used by the concerns and comments
  def self.user_ids
    all.map{|x| [x.updater_id.to_i] + x.comments.map{|y| y.updater_id.to_i rescue 0}}.flatten.uniq
  end

  # fetch the actual users that we care about for preloading onto the page
  # this should be a full list of the users who have made comments or created concerns
  def self.relevant_users
    User.all_cached.select{|x| x.id.in? self.user_ids}
  end

end

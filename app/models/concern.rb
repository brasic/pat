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
  
  # return a list of {id:x, title:y} results for use by the frontend in searches
  def self.search(query="")
    if query.empty?
      all
    else
      all(
        # return all hashes where a text field matches the query
        "$or"=>[ 
          {:title          => /#{query}/i}, 
          {:content        => /#{query}/i}, 
          {"comments.text" => /#{query}/i}
        ])
    end.
      # make an array of id and title hashes
      map{|x| {id: x.id, title: x.title}}
  end

end

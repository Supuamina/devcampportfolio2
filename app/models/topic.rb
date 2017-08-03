class Topic < ApplicationRecord
  validates_presence_of :title

  has_many :blogs
  
  def self.with_blogs
    includes(:blogs).where.not(blogs: { id: nil })
  end
end
blog_filled_array = []
topics = Topic.all
topics.each do |topic|
  blog_filled_array << topic if topic.blogs.count > 0
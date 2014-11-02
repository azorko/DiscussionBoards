class Post < ActiveRecord::Base
  
  validates :title, :user_id, presence: true
  
  belongs_to :user
  
  has_many :post_subs
  
  has_many :subs, through: :post_subs, source: :sub
  
  has_many :comments
  
  def comments_by_parent_id
    comment_hash = Hash.new { |h, k| h[k] = [] }
    self.comments.each do |comment|
      comment_hash[comment.parent_id] << { id: comment.id, parent_id: comment.parent_id, content: comment.content, created_at: comment.created_at }
    end
    comment_hash
  end
  
end

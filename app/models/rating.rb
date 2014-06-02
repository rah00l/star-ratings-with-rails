class Rating < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  attr_accessible :score,:article_id, :user_id
end

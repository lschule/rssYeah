class Feed < ActiveRecord::Base
  has_many :article
end

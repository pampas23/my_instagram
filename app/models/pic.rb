class Pic < ApplicationRecord
	acts_as_votable

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	belongs_to :user

	def like_by_user(user)
		if user.voted_for? self
			self.unliked_by user
		else
			self.liked_by user			
		end
	end
end

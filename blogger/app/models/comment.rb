class Comment < ActiveRecord::Base
	belongs_to :article
	validates :author_name, presence: true,
	length:{minimum: 5,maximum:20}
	validates :body, presence: true,
	length:{minimum:6,maximum:100}
end

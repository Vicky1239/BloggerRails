class Comment < ActiveRecord::Base
	belongs_to :article
	validates :author_name, presence: true,
	length:{minimum: 5,maximum:20,
		:message => " must lie between 5-20 characters"}
	validates :body, presence: true,
	length:{minimum:6,maximum:100,
		:message => " must lie between 10-100 characters"}
end


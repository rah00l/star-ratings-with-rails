namespace :db do 
	desc "Eraseing and populating databse"
	task :populate => :environment do
		require 'populator'

		[Article].each(&:delete_all)  
		Article.populate 25 do |article|
			article.name = Populator.words(1..3).titleize
			article.content = Populator.sentences(2..10)
			article.created_at = 2.years.ago..Time.now
			article.published_at = article.created_at
		end
	end	
end

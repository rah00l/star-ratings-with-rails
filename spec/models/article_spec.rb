require 'rails_helper'

RSpec.describe Article, :type => :model do


# 	before :all do
#   `sunspot-solr start`
#   begin
#     Sunspot.remove_all!
#   rescue Errno::ECONNREFUSED
#     sleep 1 && retry
#   end
# end
	# it "is invalid without a name"
	# `rake sunspot:solr:start RAILS_ENV=test`
	# before(:each) do
	# 	@attr = {
	# 		name: "Test Sample  Article",
	# 		content: "The best way to use this guide is to follow each step as it happens, no code or step needed to make this example application has been left out, so you can literally follow along step by step. You can get the complete code" 
	# 	}
	# end


	# before(:each) do
 #    @attr = FactoryGirl.create(:Article)
 #    # Blog.default may have already cached a copy of the default blog, and
 #    # it won't see our changes.  So override the caching.
 #    # Blog.stub(:default).and_return(@blog)
 #  end

	it "should create a new instance given a valid attribute" do
		# article = Article.create!(@attr)
		article = FactoryGirl.build(:article)
		expect(article).to be_valid
		article.run_callbacks(:save)
		article.run_callbacks(:create)
	end


	it "should require a name for article" do
    	# no_name_article = Article.new(@attr.merge(name: ""))
    	# no_name_article.should_not be_valid
    	article = FactoryGirl.build(:article, name: nil)
    	expect(article).to have(1).errors_on(:name)
    	# expect { no_name_article }.not_to raise_error
  	end

  	it "should require a content"  do 
  		# no_content_article = Article.new(@attr.merge(content: ""))
  		# expect { no_content_article }.not_to raise_error
  		article = FactoryGirl.build(:article, content: nil)
    	expect(article).to have(1).errors_on(:content)
  	end



end

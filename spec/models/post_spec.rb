require 'rails_helper'

describe Post do
  describe 'validations' do
    subject(:post) { Post.new }
    before { post.valid? }

    [:title, :body].each do |attribute|
      it "should validate presence of #{attribute}" do
        expect(post.errors[attribute].size).to be >= 1
        expect(post.errors.messages[:title]).to include "can't be blank"
      end
    end
  end
end

describe Comment do
  describe 'validations' do
    subject (:comment) { Comment.new }
    before { comment.valid? }

    [:post, :body].each do |attribute|
      it "should validate the presence of #{attribute}" do
        expect(comment.errors[attribute].size).to be >= 1
        expect(comment.errors.messages[attribute]).to include "can't be blank"
      end
    end
  end
end

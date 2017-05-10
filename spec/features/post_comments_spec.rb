require 'rails_helper'

feature 'Posting Comments' do
  background do
    @post = Post.create(title: 'Awesome Blog Post', body: 'Lorem Ipsum dolor sit amet')
  end

  scenario 'posting a comment' do
    visit post_path(@post)

    comment = 'this is just filler text. ripped off!'

    fill_in 'comment_body', with: comment
    click_button 'Add comment'

    expect(page).to have_content comment
  end
end

require 'rails_helper'

feature 'Managing blog posts' do
  scenario 'guests cannot create posts' do
    visit root_path
    click_link 'New Post'

    expect(page).to have_content 'Access denied'
  end

  scenario 'Posting a new blog' do
    visit root_path

    page.driver.browser.authorize 'admin', 'secretpassword'
    click_link 'New Post'

    expect(page).to have_content 'New Post'

    fill_in 'Title', with: 'I love cheese'
    fill_in 'Body', with: "It's pretty amazing, don't you think?"

    click_button 'Create Post'
    expect(page).to have_content 'I love cheese'
  end

  context 'with an existing blog post' do
    background do
      @post = Post.create(title: 'Awesome Blog Post', body: 'Lorem ipsum dolor sit amet')
    end

    scenario 'Editing an existing blog' do
      visit post_path(@post)

      page.driver.browser.authorize 'admin', 'secretpassword'
      click_link 'Edit'

      fill_in 'Title', with: 'Not really an Awesome Blog Post'
      click_button 'Update Post'

      expect(page).to have_content 'Not really Awesome Blog Post'
    end
    end
  end




end

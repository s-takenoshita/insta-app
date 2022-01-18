require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let!(:user) { create(:user) }
  let!(:posts) { create_list(:post, 10, user: user) }

  describe 'GET /posts' do
    it '200 status が帰ってくる' do
      get posts_path
      expect(response).to have_http_status(200)
    end
  end
end

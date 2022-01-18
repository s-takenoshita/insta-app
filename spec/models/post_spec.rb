require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  let!(:user) do
    user = User.create!({
      email: 'test@exsample.com',
      password: '99999999'
    })
  end

  context '内容（content）が入力されている場合' do
    # # before方式
    # before do
    #   user = User.create!({
    #     email: 'test@exsample.com',
    #     password: '99999999'
    #   })
    #   @post = user.posts.build({
    #     content: Faker::Lorem.characters(number: 15)
    #   })
    # end

    # let方式
    let!(:post) do
      post = user.posts.build({
        content: Faker::Lorem.characters(number: 15)
      })
    end

    it 'Postデータを保存できる。' do
      expect(post).to be_valid
    end
  end

  context '内容（content）の文字数が少ない場合' do
    let!(:post) do
      post = user.posts.create({
        content: Faker::Lorem.characters(number: 2)
      })
    end

    it 'Postデータを保存できない。' do
      puts '----> ' + post.errors.messages[:content][0]
      expect(post.errors.messages[:content][0]).to eq('is too short (minimum is 4 characters)')
    end
  end
end

require 'rails_helper'

RSpec.describe Post, type: :model do

  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:post) { build(:post, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        post.title = ''
        expect(post.valid?).to eq false;
      end
      it '2文字以上であること' do
        post.title = Faker::Lorem.characters(number:1)
        expect(post.valid?).to eq false;
      end
      it '40文字以下であること' do
        post.title = Faker::Lorem.characters(number:41)
        expect(post.valid?).to eq false;
      end
    end

    context 'bodyカラム' do
      it '空欄でないこと' do
        post.body = ''
        expect(post.valid?).to eq false;
      end
      it '1000文字以下であること' do
        post.body = Faker::Lorem.characters(number:1001)
        expect(post.valid?).to eq false;
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end
end

require 'rails_helper'

RSpec.describe LearningForm, type: :model do
  describe '投稿の保存' do
    before do
      user = FactoryBot.create(:user)
      @learning_form = FactoryBot.build(:learning_form, user_id: user.id)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@learning_form).to be_valid
      end
      it 'テキストが空でも投稿できる' do
        @learning_form.content = ''
        expect(@learning_form).to be_valid
      end
      it '画像が空でも投稿できる' do
        @learning_form.image = nil
        expect(@learning_form).to be_valid
      end
      it 'タグが空でも投稿できる' do
        @learning_form.image = nil
        expect(@learning_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'タイトルが空では投稿できない' do
        @learning_form.title = ''
        @learning_form.valid?
        expect(@learning_form.errors.full_messages).to include("Titleを入力してください")
      end
      it 'テキストと画像が空では投稿できない' do
        @learning_form.image = nil
        @learning_form.content = ''
        @learning_form.valid?
        expect(@learning_form.errors.full_messages).to include("Contentを入力してください")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @learning_form.user_id = nil
        @learning_form.valid?
        expect(@learning_form.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end

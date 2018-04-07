# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ability, type: :model do
  let(:user) { build(:user, roles: [role]) }
  subject(:ability) { Ability.new(user) }
  let(:role) { build(:role) }
  describe 'Initiative' do
    context '# when is a not authorized' do
      it { is_expected.not_to be_able_to(:create, Initiative) }
      it { is_expected.to be_able_to(:read, Initiative) }
      it { is_expected.not_to be_able_to(:update, Initiative) }
      it { is_expected.not_to be_able_to(:destroy, Initiative) }
    end

    context '# when is a user' do
      before(:each) do
        user.add_role :user
      end
      it { is_expected.to be_able_to(:create, Initiative) }
      it { is_expected.to be_able_to(:read, Initiative) }
      it { is_expected.to be_able_to(:update, Initiative) }
      it { is_expected.to be_able_to(:destroy, Initiative) }
    end

    context '# when is a moderator' do
      before(:each) do
        user.add_role :moderator
      end
      it { is_expected.to be_able_to(:create, Initiative) }
      it { is_expected.to be_able_to(:read, Initiative) }
      it { is_expected.to be_able_to(:update, Initiative) }
      it { is_expected.to be_able_to(:destroy, Initiative) }
    end

    context '# when is a admin' do
      before(:each) do
        user.add_role :admin
      end
      it { is_expected.to be_able_to(:create, Initiative) }
      it { is_expected.to be_able_to(:read, Initiative) }
      it { is_expected.to be_able_to(:update, Initiative) }
      it { is_expected.to be_able_to(:destroy, Initiative) }
    end
  end

  describe 'Comment' do
    context '# when is a not authorized' do
      it { is_expected.not_to be_able_to(:create, Comment) }
      it { is_expected.not_to be_able_to(:read, Comment) }
      it { is_expected.not_to be_able_to(:update, Comment) }
      it { is_expected.not_to be_able_to(:destroy, Comment) }
    end

    context '# when is a user' do
      before(:each) do
        user.add_role :user
      end
      it { is_expected.to be_able_to(:create, Comment) }
      it { is_expected.to be_able_to(:read, Comment) }
      it { is_expected.to be_able_to(:update, Comment) }
      it { is_expected.to be_able_to(:destroy, Comment) }
    end

    context '# when is a moderator' do
      before(:each) do
        user.add_role :moderator
      end
      it { is_expected.to be_able_to(:create, Comment) }
      it { is_expected.to be_able_to(:read, Comment) }
      it { is_expected.to be_able_to(:update, Comment) }
      it { is_expected.to be_able_to(:destroy, Comment) }
    end

    context '# when is a admin' do
      before(:each) do
        user.add_role :admin
      end
      it { is_expected.to be_able_to(:create, Comment) }
      it { is_expected.to be_able_to(:read, Comment) }
      it { is_expected.to be_able_to(:update, Comment) }
      it { is_expected.to be_able_to(:destroy, Comment) }
    end
  end

  describe 'Category' do
    context '# when is a not authorized' do
      it { is_expected.not_to be_able_to(:create, Category) }
      it { is_expected.not_to be_able_to(:read, Category) }
      it { is_expected.not_to be_able_to(:update, Category) }
      it { is_expected.not_to be_able_to(:destroy, Category) }
    end

    context '# when is a user' do
      before(:each) do
        user.add_role :user
      end
      it { is_expected.not_to be_able_to(:create, Category) }
      it { is_expected.not_to be_able_to(:read, Category) }
      it { is_expected.not_to be_able_to(:update, Category) }
      it { is_expected.not_to be_able_to(:destroy, Category) }
    end

    context '# when is a moderator' do
      before(:each) do
        user.add_role :moderator
      end
      it { is_expected.to be_able_to(:create, Category) }
      it { is_expected.to be_able_to(:read, Category) }
      it { is_expected.to be_able_to(:update, Category) }
      it { is_expected.to be_able_to(:destroy, Category) }
    end

    context '# when is a admin' do
      before(:each) do
        user.add_role :admin
      end
      it { is_expected.to be_able_to(:create, Category) }
      it { is_expected.to be_able_to(:read, Category) }
      it { is_expected.to be_able_to(:update, Category) }
      it { is_expected.to be_able_to(:destroy, Category) }
    end
  end

  describe 'User' do
    context '# when is a not authorized' do
      it { is_expected.not_to be_able_to(:create, User) }
      it { is_expected.not_to be_able_to(:read, User) }
      it { is_expected.not_to be_able_to(:update, User) }
      it { is_expected.not_to be_able_to(:destroy, User) }
    end

    context '# when is a user' do
      before(:each) do
        user.add_role :user
      end
      it { is_expected.not_to be_able_to(:create, User) }
      it { is_expected.to be_able_to(:read, User) }
      it { is_expected.to be_able_to(:update, User) }
      it { is_expected.not_to be_able_to(:destroy, User) }
    end

    context '# when is a moderator' do
      before(:each) do
        user.add_role :moderator
      end
      it { is_expected.not_to be_able_to(:create, User) }
      it { is_expected.not_to be_able_to(:read, User) }
      it { is_expected.not_to be_able_to(:update, User) }
      it { is_expected.not_to be_able_to(:destroy, User) }
    end

    context '# when is a admin' do
      before(:each) do
        user.add_role :admin
      end
      it { is_expected.to be_able_to(:create, User) }
      it { is_expected.to be_able_to(:read, User) }
      it { is_expected.to be_able_to(:update, User) }
      it { is_expected.to be_able_to(:destroy, User) }
    end
  end
end

require 'spec_helper'

describe UserDecorator do
  subject { described_class.new(new_user) }


  describe "#username" do
    let(:new_user) { build :user, name: 'User1', email: "user1@user.user", password: "password"}
    context 'name is present' do
      it { expect(subject.username).to eq('User1') }
    end

    context 'name is empty' do
      before { allow(new_user).to receive(:name).and_return(nil) }

      it 'returns email' do
        expect(subject.username).to eq('user1@user.user')
      end
    end
  end

  describe '#user_picture' do
    context 'when picture is empty' do
      let(:new_user) { build :user, name: 'User1', email: "user1@user.user", password: "password"}
      it { expect(subject.user_picture).to be_nil }
    end

    context 'when picture is present' do
      let(:new_user) { build :user, :with_picture, name: 'User1', email: "user1@user.user", password: "password"}
      it { expect(subject.user_picture).to include('netguru.jpg') }
    end

  end
end

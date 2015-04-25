require 'spec_helper'

describe SubjectDecorator do
  subject { described_class.new(subject_item) }

  describe "#full_name" do
    let(:subject_item) { build :subject, name: 'Math', short_name: 'MLO' }

    it { expect(subject.full_name).to eq("Math (MLO)") }
  end
end

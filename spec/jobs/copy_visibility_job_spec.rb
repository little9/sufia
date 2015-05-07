require 'spec_helper'

describe CopyVisibilityJob do

  describe "an open access work" do
    let(:work) { FactoryGirl.create(:work_with_files) }
    subject { CopyVisibilityJob.new(work.id) }

    it "should have no content at the outset" do
      expect(work.generic_files.first.visibility).to eq Hydra::AccessControls::AccessRight::VISIBILITY_TEXT_VALUE_PRIVATE
    end

    it "should copy visibility to its contained files" do
      work.visibility = Hydra::AccessControls::AccessRight::VISIBILITY_TEXT_VALUE_PUBLIC
      work.save
      subject.run
      work.reload.generic_files.each do |file|
        expect(file.visibility).to eq 'open'
      end
    end
  end
end

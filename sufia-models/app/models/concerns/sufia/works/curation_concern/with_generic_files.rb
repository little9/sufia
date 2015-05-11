module Sufia::Works
  module CurationConcern
    module WithGenericFiles
      extend ActiveSupport::Concern

      def copy_visibility_to_files
        generic_files.each do |gf|
          gf.visibility = visibility
          gf.save!
        end
      end

    end
  end
end

# a very simple type of work with DC metadata
module Sufia::Works
  class GenericWork < Work
    include Sufia::GenericFile::Permissions
    include Sufia::GenericFile::Metadata
    include CurationConcern::WithEditors
  end
end

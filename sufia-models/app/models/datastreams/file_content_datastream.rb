class FileContentDatastream < Hydra::PCDM::File
  include Hydra::Derivatives::ExtractMetadata
  include Sufia::FileContent::Versions
end

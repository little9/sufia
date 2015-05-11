class CopyPermissionsJob 
  def queue_name
    :permissions
  end

  attr_accessor :id

  def initialize(id)
    self.id = id
  end

  def run
    work = ActiveFedora::Base.load_instance_from_solr(id)
    if work.respond_to?(:generic_files)
      work.generic_files.each do |file|
        file.visibility = work.visibility
        file.edit_users = work.edit_users
        file.edit_groups = work.edit_groups 
        file.save!
      end
    end
  end
end

module CurationConcern
  class PermissionsController < ApplicationController
    include Worthwhile::CurationConcernController
    self.curation_concern_type = ActiveFedora::Base

    def confirm
    end

    def copy_visibility
      Sufia.queue.push(CopyVisibilityJob.new(params[:id]))
      flash_message = 'Updating file permissions. This may take a few minutes. You may want to refresh your browser or return to this record later to see the updated file permissions.'
      redirect_to Sufia::Engine.routes.url_helpers.generic_work_path(params[:id]), notice: flash_message
    end

    def curation_concern
      @curation_concern ||= self.curation_concern_type.find(params[:id], cast: true)
    end
  end
end

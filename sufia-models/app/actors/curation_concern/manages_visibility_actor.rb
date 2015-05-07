module CurationConcern
  #  To use this module, include it in your Actor class
  #  and then add its interpreters wherever you want them to run.
  #  They should be called _before_ apply_attributes is called because
  #  they intercept values in the attributes Hash.
  #
  #  @example
  #  class MyActorClass < BaseActor
  #     include CurationConcern::ManagesVisibilityActor
  #
  #     def create
  #       interpret_visibility && super && copy_visibility
  #     end
  #
  #     def update
  #       interpret_visibility && super && copy_visibility
  #     end
  #  end
  #
  module ManagesVisibilityActor
    extend ActiveSupport::Concern

      def confirm
      end

      def copy_visibility
        Sufia.queue.push(CopyVisibilityJob.new(curation_concern.id))
        true
      end
  end
end

# frozen_string_literal: true

module Api
  module V1
    class UpdatesController < ApplicationController
      def all
        updates = WorkUpdate.includes(:person).all.order(created_at: :desc)

        result = updates.map do |u|
          # Note, per result we do a query. This is not ideal, but okay for
          # now and can be refactored later.
          tags = TagWorkUpdate.includes(:tag).where(work_update_id: u.id)

          # NOTE: There's potential for a lot of duplication in the results
          # here; bringing down the same image for the same person, the same
          # colour for the same tag, etc. But let's just note it and worry
          # about it later :)
          { 'person' => { 'name' => u.person.name, 'image' => u.person.image },
            'content' => u.content,
            'tags' => tags.map { |t| { 'name' => t.tag.name, 'colour' => t.tag.colour } },
            'created' => u.created_at }
        end
        render json: result
      end
    end
  end
end

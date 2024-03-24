# frozen_string_literal: true

module Api
  module V1
    class UpdatesController < ApplicationController
      include ActionView::Helpers::DateHelper
      def all
        updates = WorkUpdate.includes(:person, :tags).all.order(created_at: :desc)

        result = updates.map do |u|
          # NOTE: There's potential for a lot of duplication in the results
          # here; bringing down the same image for the same person, the same
          # colour for the same tag, etc. But let's just note it and worry
          # about it later :)
          { 'person' => { 'name' => u.person.name, 'image' => u.person.image },
            'content' => u.content,
            'tags' => u.tags.map { |tag| { 'name' => tag.name, 'colour' => tag.colour } },
            'created_ago' => "#{time_ago_in_words(u.created_at)} ago",
            'created_at' => u.created_at }
        end
        render json: result
      end
    end
  end
end

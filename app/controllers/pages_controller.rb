class PagesController < ApplicationController
  def home
    if params[:search]
      if Rails.env.development?
        @projects = Project.search do
          fulltext "#{params[:search][:terms]}" do
            phrase_fields :name => 2.0
            phrase_slop  1
          end
        end
        @projects = @projects.results
      else
      end
    end
  end
end

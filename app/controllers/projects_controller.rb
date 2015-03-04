class ProjectsController < ApplicationController

  def index
    
    
    
    if params[:search].present?
      @projects = Project.near(params[:search], 50, :order => :distance)
    else
      @projects = Project.all
    end

  end

end

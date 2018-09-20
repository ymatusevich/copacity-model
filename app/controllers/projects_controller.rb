class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    projects = Project.includes(:client, :resources, :estimations, :adjustments)
    projects = params[:client_id] ? projects.where(client_id: params[:client_id]) : projects
    @projects = params[:status] ? projects.where(status: Project::STATUS[params[:status].to_sym]) : projects
  end

  def show
  end

  def new
    @project = ProjectForm.new
  end

  def edit
    attrs = @project.attributes
                .merge(@project.assigned_resources_attributes)
                .merge(@project.estimations_attributes)

    @project = ProjectForm.new(attrs)
  end

  def create
    @project = ProjectForm.new(new_project_form_params)

    if @project.save
      redirect_to projects_path, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def update
    @project = ProjectForm.new(edit_project_form_params)

    if @project.update
      redirect_to projects_path, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def new_project_form_params
      params.fetch(:project, {})
    end

    def edit_project_form_params
      new_project_form_params.merge(id: params[:id])
    end
end

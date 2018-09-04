class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.includes(:client, :resources)
  end

  def show
  end

  def new
    @project = ProjectForm.new
  end

  def edit
    @project = ProjectForm.new(@project.attributes.merge(@project.assigned_resources_attributes))
  end

  def create
    @project = ProjectForm.new(new_project_form_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to projects_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @project = ProjectForm.new(edit_project_form_params)

    respond_to do |format|
      if @project.update
        format.html { redirect_to projects_path, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
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
      params.fetch(:project_form, {})
    end

    def edit_project_form_params
      new_project_form_params.merge(id: params[:id])
    end
end

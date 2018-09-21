module Reports
  class ProjectService
    def initialize(params = {})
      @project = Project.find(params[:id])
      @resources = @project.resources
      @project_days = @project.project_days
      @data = { data: {}, resources: [], project_name: @project.name }
    end

    def call
      @resources.each do |resource|
        @data[:resources] << resource
        @data[:data][resource.name] = {}
        @project_days.select { |project_day| project_day.resource == resource }.each do |project_day|
          next if (assigned_resource = project_day.assigned_resource).blank?

          if @data[:data][resource.name][project_day.date]
            @data[:data][resource.name][project_day.date] += assigned_resource.consumed_per_day
          else
            @data[:data][resource.name][project_day.date] = assigned_resource.consumed_per_day
          end
        end
      end
      Reports::BaseResult.new(data: @data, type: :render, endpoint: 'projects/show')
    end
  end
end

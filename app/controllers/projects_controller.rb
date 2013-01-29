class ProjectsController < ApplicationController
# =================================
# Prerequisites
# =================================
	before_filter :authenticate_user!
	before_filter :f_organization

# =================================
# projects#index
# =================================
	def index
		@project = @organization.projects.all
	end

# =================================
# projects#show
# =================================
	def show
		@project = @organization.projects.find( params[:id] )
	end

# =================================
# projects#new
# =================================
	def new
		# Prep a new
		@project = @organization.projects.build
	end

# =================================
# projects#create
# =================================
	def create
		# Save the form values
		@project = @organization.projects.create( params[:project] )

		# If the save was successful:
		if @project.save
			# Go to the project and notify user of success
			redirect_to( organization_project_path( @organization, @project ), notice: 'Project successfully created.' )
		else
			# Otherwise, go to the new page again, let the user know something went wrong.
			render action: 'new', notice: 'Something went wrong.'
		end
	end

# =================================
# projects#edit
# =================================
	def edit
		# Find the project
		@project = @organization.projects.find( params[:id] )
	end

# =================================
# projects#update
# =================================
	def update
		# Find the Project
		@project = @organization.projects.find( params[:id] )

		# If project is successfully updated:
		if @project.update_attributes( params[:project] )
			# Go to the project and notify user of the success
			redirect_to( organization_project_path( @organization, @project), notice: 'Project updated successfully.' )
		else
			# Otherwise, go to edit page again, let the user know something went wrong.
			render action: 'edit', notice: 'Something went wrong.'
		end
	end

# =================================
# projects#destroy
# =================================
	def destroy
		@project = @organization.projects.find( params[:id] )
		@project.destroy
		redirect_to organization_path( @organization ), notice: 'Project successfully removed.' 
	end


	def f_organization
		organization = params[:organization_id] || params[:id]

		if organization
			@organization = Organization.find(organization)
		else
			@organization = nil
		end
	end

end
class OrganizationsController < ApplicationController
	# Prerequisites

# =================================
# organizations#index
# =================================
	def index
		# Find all of the current users organizations
		@organization = current_user.organizations.all
	end

# =================================
# organizations#show
# =================================
	def show
		@organization = current_user.organizations.find( params[:id] )
	end

# =================================
# organizations#new
# =================================
	def new
		@organization = current_user.organizations.build
	end

# =================================
# organizations#create
# =================================
	def create
		@organization = current_user.organizations.create( params[:organization] )

		if @organization.save
			redirect_to( user_organization_path( current_user, @organization ), notice: 'Organization successfully created.' )
		else
			render action: 'new', notice: 'Something went wrong.'
		end
	end

# =================================
# organizations#edit
# =================================
	def edit
		# Find the Organization
		@organization = current_user.organizations.find( params[:id] )
	end

# =================================
# organizations#update
# =================================
	def update
		# Find the Organization
		@organization = current_user.organizations.find( params[:id] )

		# If organization is successfully updated:
		if @organization.update_attributes( params[:organization] )
			# Go to the organization and let the user know
			redirect_to( user_organization_path( current_user, @organization ), notice: 'Organization updated successfully.' )
		else
			# Otherwise, go to edit page again, and let the user name something went wrong.
			render action: 'edit', notice: 'Something went wrong.'
		end
	end

# =================================
# organizations#destroy
# =================================
	def destroy

		# Find the Organization
		@organization = Organization.find( params[:id] )
		
		# Destroy that organization
		@organization.destroy

		# Redirect back to user start screen
		redirect_to dashboard_path(current_user), notice: 'Organization successfully destroyed.'
	end

end
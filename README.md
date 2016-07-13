# crowdfunder
Crowdfunder

MVP features

- Ability to create and manage a project
- Ability to create and manage an account
- Ability to pledge to a project
- Ability to track pledges
- Ability to set a fundraising goal

Ability to:
- create rewards for projects
- set a deadline

Domain Model
- project
- User
- Pledge
  - Amount
  -Project
  -User
- Reward


- Comments

Things that are hard about Crowdfunder
- not meeting the goal by the deadline
- making an actual pledge with monies
- people defaulting on their pledges
- fufilling rewards for successful projects
- ensuring project owners follow through

Rails g model Project name: string goal:integer deadline:datetime
Rails g model Reward name:string description:text amount:integer project:belongs_to
Rails g controller Projects

Projects controller

def index, new, and create

def index
@projects = Project.all
end

def new
@project = Project.new
@reward = @project.rewards.build
end

def create
@project = Project.new(project_params)

if @project.save
  redirect_to projects_path
else
  render :new
end
end

private

def project_params
  params.require(:project).permit(:name, :goal, :deadline, rewards_attributes: [:name, :description, :amount])

end

RewardsController


index.html.erb

<h1>All Projects </h1>

<%= link_to ‘New Project’, new_project_path %>

<ul>
<% @projects.each do |project| %>

<%= link_to project.name, project_path(project) %>
<% end %>
</ul>

root ‘projects#index’
resources :projects do
  resources :rewards
end

new.html.erb

<%= form_for @project do |f| %>

<div class=field>
<%=f.label : name%>
f.text_field : name
</div>

f.label : goal
f.number_field : goal

f.label : deadline
f.datetime_field : deadline

f.fields_for :rewards do |rewards_fields|
<div class=”field”>
rewards_fields.label :name
rewards_fields.text_field :name

<div class=”field”>
rewards_fields.label :description
rewards_fields.text_field :description

<div class=”field”>
rewards_fields.label :amount
rewards_fields.number_field :amount

f.submit
<%end%>

Project model

class Project
has_many :rewards
accepts_nested_attributes_for :rewards
end 

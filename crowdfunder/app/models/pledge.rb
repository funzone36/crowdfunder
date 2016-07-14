class Pledge < ActiveRecord::Base
validate :deadline_past

  belongs_to :project
  belongs_to :user

private

    def deadline_past
      if self.project.deadline.past?
        errors.add("Deadline is past")
    end
  end
end

module Ruboty
  module Gitlab
    module Actions
      class CreateIssue < Base
        def call
          case
          when !has_private_token?
            require_private_token
          when !exists_project?
            message.reply("Could not find that project")
          else
            create_issue
          end
        end

        private

        def create_issue
          message.reply("Created #{project.web_url}/issues/#{issue.iid}")
        end

        def issue
          client.create_issue(project.id, given_title, { description: given_body })
        end

        def given_title
          message[:title]
        end

        def given_body
          message[:description] || ""
        end
      end
    end
  end
end

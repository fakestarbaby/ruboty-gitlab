module Ruboty
  module Gitlab
    module Actions
      class Base
        NAMESPACE = "gitlab"

        attr_reader :message

        def initialize(message)
          @message = message
        end

        private

        def private_tokens
          message.robot.brain.data[NAMESPACE] ||= {}
        end

        def require_private_token
          message.reply("I don't know your gitlab private token")
        end

        def has_private_token?
          !!private_token
        end

        def private_token
          @private_token ||= private_tokens[sender_name]
        end

        def sender_name
          message.from_name
        end

        def projects
          message.robot.brain.data[NAMESPACE][:projects] ||= {}
        end

        def exists_project?
          project.present?
        end

        def search_project
          client.projects({ search: given_project }).find { |project| project.name == given_project }
        end

        def project
          projects[given_project] ||= search_project
        end

        def given_project
          message[:project]
        end

        def client
          ::Gitlab::Client.new(client_options)
        end

        def client_options
          client_options_with_nil_value.reject {|key, value| value.nil? }
        end

        def client_options_with_nil_value
          {
            endpoint: gitlab_endpoint_url,
            private_token: private_token,
          }
        end

        def gitlab_endpoint_url
          ENV["GITLAB_URL"] + "/api/v3"
        end
      end
    end
  end
end

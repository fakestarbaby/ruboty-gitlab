module Ruboty
  module Handlers
    class Gitlab < Base
      env :GITLAB_URL, "GITLAB_URL - GitLab URL (e.g. https://gitlab.example.co.jp)"

      on(
        /create gitlab issue "(?<title>.+)" on (?<project>.+)(?:\n(?<description>[\s\S]+))?\z/,
        name: "create_issue",
        description: "Create a new issue",
      )

      on(
        /remember my gitlab token (?<token>.+)\z/,
        name: "remember",
        description: "Remember sender's GitLab private token",
      )

      def create_issue(message)
        Ruboty::Gitlab::Actions::CreateIssue.new(message).call
      end

      def remember(message)
        Ruboty::Gitlab::Actions::Remember.new(message).call
      end
    end
  end
end

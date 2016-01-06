module Ruboty
  module Handlers
    class Gitlab < Base
      on(
        /remember my gitlab token (?<token>.+)\z/,
        name: "remember",
        description: "Remember sender's GitLab private token",
      )

      def remember(message)
        Ruboty::Gitlab::Actions::Remember.new(message).call
      end
    end
  end
end

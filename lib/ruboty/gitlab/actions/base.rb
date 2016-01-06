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

        def sender_name
          message.from_name
        end
      end
    end
  end
end

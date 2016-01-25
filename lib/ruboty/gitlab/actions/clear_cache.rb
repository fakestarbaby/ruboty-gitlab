module Ruboty
  module Gitlab
    module Actions
      class ClearCache < Base
        def call
          clear_projects
          report
        end

        private

        def report
          message.reply("Cleared gitlab brain cache")
        end
      end
    end
  end
end

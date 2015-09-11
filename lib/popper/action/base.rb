module Popper::Action
  class Base
    @next_action = nil
    @action = nil

    def self.next_action(action=nil)
      @next_action = action if action
      @next_action
    end

    def self.action(action=nil)
      @action = action if action
      @action
    end

    def self.next_run(config, mail, params={})
      @next_action.run(config, mail, params) if @next_action
    end

    def self.action?(config)
      config.to_h.has_key?(self.action) && check_params(config)
    end

    def self.my_conf(config)
      config.send(self.action.to_s)
    end

    def self.check_params(config); end
  end
end
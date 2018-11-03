module Beehive::Preferences
  class Configuration
    include Beehive::Preferences::Preferable

    def configure
      yield(self) if block_given?
    end

    def preferences
      ScopedStore.new(self.class.name.underscore)
    end

    def reset
      preferences.each do |name, _value|
        set_preference name, preference_default(name)
      end
    end

    alias [] get_preference
    alias []= set_preference

    alias get get_preference

    def set(*args)
      options = args.extract_options!
      options.each do |name, value|
        set_preference name, value
      end

      set_preference args[0], args[1] if args.size == 2
    end

    def method_missing(method, *args)
      name = method.to_s.delete('=')
      if has_preference? name
        if method.to_s =~ /=$/
          set_preference(name, args.first)
        else
          get_preference name
        end
      else
        super
      end
    end
  end
end

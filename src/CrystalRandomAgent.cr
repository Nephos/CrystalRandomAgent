require "./CrystalRandomAgent/*"
require "yaml"

module CrystalRandomAgent

  CONFIG = YAML.parse(File.read "./user_agents.yml")

  USER_AGENTS = CONFIG["user_agents"].as_h.map do |_, subtypes|
    YAML::Any.new(subtypes).as_h.map do |_, agents|
       YAML::Any.new(agents).as_a.map{|ua| ua as String}
     end
  end.flatten

  def get_random_user_agent : String
    USER_AGENTS.sample
  end

  extend self

end

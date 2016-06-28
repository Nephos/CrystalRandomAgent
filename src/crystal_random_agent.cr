require "./crystal_random_agent/*"
require "yaml"

module CrystalRandomAgent

  CONFIG_FILE = File.expand_path "./user_agents.yml", __DIR__
  CONFIG = YAML.parse(File.read CONFIG_FILE)

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

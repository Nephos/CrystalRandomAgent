require "./spec_helper"

describe CrystalRandomAgent do
  it "works" do
    (CrystalRandomAgent::USER_AGENTS.size > 100).should eq true
    100.times do
      ua = CrystalRandomAgent.get_random_user_agent
      CrystalRandomAgent::USER_AGENTS.includes?(ua).should eq true
    end
  end
end

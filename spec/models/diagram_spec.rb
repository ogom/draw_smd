require 'spec_helper'

describe DrawSmd do
  describe "Diagram" do
    it ".schemas" do
      expect(DrawSmd::Diagram.schemas.count).to eq(0)
    end
  end
end

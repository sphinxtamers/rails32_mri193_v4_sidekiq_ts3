ThinkingSphinx::Index.define :article, :with => :active_record, :delta => ThinkingSphinx::Deltas::SidekiqDelta do
  indexes title, body
end

class ResourceSearch < Tableless
  column :query, :string
  column :category_id, :integer
  validate :query, :presence => true
end
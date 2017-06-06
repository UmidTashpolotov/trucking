class AddPgTrgmExtensionToDb < ActiveRecord::Migration[5.0]
  execute 'create extension pg_trgm;'
end

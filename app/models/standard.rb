class Standard < ActiveRecord::Base


  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      standard = find_by_id(row["id"]) || new
      standard.attributes = row.to_hash.slice(*attribute_names)
      standard.save!
    end
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |standard|
        csv << standard.attributes.values_at(*column_names)
      end
    end
  end
end

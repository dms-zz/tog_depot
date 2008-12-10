module Depot
  module FilesHelper

    def tag_cloud_files(classes)
      tags1 = Depot::File.tag_counts(:conditions => ["files.state='public'"])
			tags2 = Depot::Filefolder.tag_counts(:conditions => ["state='public'"])
			tags= tags1 + tags2
      return if tags.empty?
      max_count = tags.sort_by(&:count).last.count.to_f
      tags.each do |tag|
        index = ((tag.count / max_count) * (classes.size - 1)).round
        yield tag, classes[index]
      end
    end

  end
	
end

module Depot
  module FilesHelper

    def tag_cloud_files(classes)
      tags = Depot::File.tag_counts(:conditions => ["files.state='published'"])
      return if tags.empty?
      max_count = tags.sort_by(&:count).last.count.to_f
      tags.each do |tag|
        index = ((tag.count / max_count) * (classes.size - 1)).round
        yield tag, classes[index]
      end
    end

  end
end

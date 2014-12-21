def count_files(dir)
  res = Dir[File.join(dir, '**', '*')].count { |file| File.file?(file) }
end
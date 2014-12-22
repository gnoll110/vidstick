def count_files(dir)
  res = Dir[File.join(dir, '**', '*')].count { |file| File.file?(file) }
end

def count_symlinks(dir)
  res = Dir[File.join(dir, '**', '*')].count { |file| File.symlink?(file) }
end
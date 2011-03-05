class Array
  def keys
    map_with_index{|x,i|i}
  end
end

# http://snippets.dzone.com/posts/show/5119
class Array
  def map_with_index!
    each_with_index do |e, idx| self[idx] = yield(e, idx); end
  end

  def map_with_index(&block)
    dup.map_with_index!(&block)
  end
end

# http://www.dweebd.com/ruby/hash-key-rewrite
class Hash
  def rewrite mapping
    inject({}) do |rewritten_hash, (original_key, value)|
      rewritten_hash[mapping.fetch(original_key, original_key)] = value
      rewritten_hash
    end
  end
end

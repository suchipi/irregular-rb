require "irregular/version"

module Irregular
  def compile_regexp(regexp_or_string, options = 0)
    if regexp_or_string.is_a? Regexp
      source = regexp_or_string.source
      options |= regexp_or_string.options
    end

    if regexp_or_string.is_a? String
      source = regexp_or_string
    end

    # Ruby regular expressions don't support the global flag,
    # so we scan to collect results then gsub them in
    # instead of passing a block directly to match.

    template_regexp = /`(\w+)`/

    compiled_results = {}
    source.scan(template_regexp) do
      compiled_results[$1] = if respond_to?($1)
        send($1)
      else
        "`#{$1}`"
      end
    end

    compiled_source = source.gsub(template_regexp) do
      compiled_results[$1]
    end

    Regexp.new(compiled_source, options)
  end
end

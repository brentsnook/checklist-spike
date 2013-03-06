# Taken from https://github.com/sstephenson/sprockets/blob/37e80b651935ed5388abeacc35bf4c6ffc10bd8f/lib/sprockets/manifest.rb#L110
# in order to override the way files are written out.
# Specifically, we don't want a digest in the output file.

module Sprockets
  # The Manifest logs the contents of assets compiled to a single
  # directory. It records basic attributes about the asset for fast
  # lookup without having to compile. A pointer from each logical path
  # indicates with fingerprinted asset is the current one.
  #
  # The JSON is part of the public API and should be considered
  # stable. This should make it easy to read from other programming
  # languages and processes that don't have sprockets loaded. See
  # `#assets` and `#files` for more infomation about the structure.
  class Manifest

    # Taken from
    #   manifest.rb:110
    #
    # Compile and write asset to directory. The asset is written to a
    # fingerprinted filename like
    # `application-2e8e9a7c6b0aafa0c9bdeec90ea30213.js`. An entry is
    # also inserted into the manifest file.
    #
    #   compile("application.js")
    #
    def compile(*args)
      unless environment
        raise Error, "manifest requires environment for compilation"
      end

      paths = environment.each_logical_path(*args).to_a +
        args.flatten.select { |fn| Pathname.new(fn).absolute? if fn.is_a?(String)}

      paths.each do |path|
        if asset = find_asset(path)
          files[asset.digest_path] = {
            'logical_path' => asset.logical_path,
            'mtime'        => asset.mtime.iso8601,
            'size'         => asset.bytesize,
            'digest'       => asset.digest
          }
          assets[asset.logical_path] = asset.digest_path

          #target = File.join(dir, asset.digest_path)
          target = File.join(dir, asset.logical_path)

          # if File.exist?(target)
          #   logger.debug "Skipping #{target}, already exists"
          # else
            logger.info "Writing #{target}"
            asset.write_to target
          # end

          save
          asset
        end
      end
    end
  end
end

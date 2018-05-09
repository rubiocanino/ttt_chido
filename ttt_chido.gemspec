
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "ttt_chido/version"

Gem::Specification.new do |spec|
  spec.name          = "ttt_chido"
  spec.version       = TttChido::VERSION
  spec.authors       = ["Saul Rubio"]
  spec.email         = ["rubiocanino98@gmail.com"]

  spec.summary       = %q{This a gem it was made to play  Tic Tac Toe in the irb.}
  spec.description   = %q{It's a cool gem to have fun some time.}
  spec.homepage      = "https://github.com/rubiocanino/ttt_chido"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  
  spec.files         = Dir.glob("{bin,lib}/**/*")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency             "colorize", "~> 0.8.1"
end

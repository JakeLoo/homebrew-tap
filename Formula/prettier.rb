require "language/node"

class Prettier < Formula
  desc "Prettier is an opinionated JavaScript formatter"
  homepage "https://prettier.github.io/prettier/"
  url "https://registry.npmjs.org/prettier/-/prettier-0.22.0.tgz"
  sha256 "4d6d5f6444624d8dcb104658e4215b88afcde042981403a0ff5efcb33d829041"
  head "https://github.com/prettier/prettier.git"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"index.js").write <<-EOS.undent
      function component() {
        var element = document.createElement("div");
        element.innerHTML = "Hello" + " " + "prettier";
        return element;
      }
    EOS

    system bin/"prettier", "--single-quote", "--write", "index.js"
  end
end
